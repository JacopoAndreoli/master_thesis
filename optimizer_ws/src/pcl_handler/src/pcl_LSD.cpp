#include <ros/ros.h>
#include <opencv3/opencv.hpp>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl_handler/FloatList.h>
#include <pcl_handler/keyframeMsg.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <pcl/point_types.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/features/normal_3d.h>
#include <tf/transform_broadcaster.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/sample_consensus/ransac.h>
#include <pcl/sample_consensus/sac_model_plane.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include "sophus/sim3.hpp"

// K = np.array([[506.933047262, 0.0, 321.4629011],    matrix definition used before in the python script
//     [0.0, 508.079839422, 243.86413906],
//     [0.0, 0.0, 1.0]], np.float32)

float K[3][3] = {{506.933047262,      0.0     , 321.4629011 },
                 {     0.0     , 508.079839422, 243.86413906}, 
                 {     0.0     ,      0.0     ,      1.0    }};
                 
struct InputPointDense
{
	float idepth;
	float idepth_var;
	unsigned char color[4];
};

class PCL_handler{

    private:
        ros::Publisher pub;
        ros::Subscriber sub;
        ros::NodeHandle nh;

    public:

      PCL_handler(){

        sub = nh.subscribe<pcl_handler::keyframeMsg>("/lsd_slam/keyframes", 1000, &PCL_handler::callback, this);
        pub = nh.advertise<sensor_msgs::PointCloud2>("/Pointcloud2LSD", 10); 
    
      }

      void callback(const pcl_handler::keyframeMsg::ConstPtr& raw_point_cloud_message){ // this message include the depth map, the pose of the camera and the image in itself
      
        float tx = raw_point_cloud_message->camToWorld[0];
        float ty = raw_point_cloud_message->camToWorld[1];
        float tz = raw_point_cloud_message->camToWorld[2];
        float qw = raw_point_cloud_message->camToWorld[3];
        float qx = raw_point_cloud_message->camToWorld[4];
        float qy = raw_point_cloud_message->camToWorld[5];
        float qz = raw_point_cloud_message->camToWorld[6];

        static tf::TransformBroadcaster br;
        tf::Transform transform;
        transform.setOrigin(tf::Vector3(tx, ty, tz));
        transform.setRotation(tf::Quaternion(qx, qy, qz, qw));
        br.sendTransform(tf::StampedTransform(transform, ros::Time(raw_point_cloud_message->time), "camera", "world"));

        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_filtered (new pcl::PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::PointXYZ>::Ptr PCLRemoval (new pcl::PointCloud<pcl::PointXYZ>);
        InputPointDense* originalInput = new InputPointDense[raw_point_cloud_message->width*raw_point_cloud_message->height];
        memcpy(originalInput, raw_point_cloud_message->pointcloud.data(), raw_point_cloud_message->width*raw_point_cloud_message->height*sizeof(InputPointDense));       

        // If there are no points then we're done.
        if(originalInput == 0)
          return;

        // Get pose from received lsd-slam pointcloud relative to starting pose of lsd-slam.
        Sophus::Sim3f camToWorld;
        memcpy(camToWorld.data(), raw_point_cloud_message->camToWorld.data(), 7*sizeof(float));

        // Get camera parameters from lsd-slam node. Needed to compute 3D coordinates.
        double fx = raw_point_cloud_message->fx;
        double fy = raw_point_cloud_message->fy;
        double cx = raw_point_cloud_message->cx;
        double cy = raw_point_cloud_message->cy;

        double fxi = 1/fx;
        double fyi = 1/fy;
        double cxi = -cx / fx;
        double cyi = -cy / fy;

        pcl::PointXYZ point;
        // For each point in the recieved lsd-slam pointcloud message,
        // calculate its 3D real world coordinate. Formerly they were image coordinates.
        for(int y=1;y<raw_point_cloud_message->height-1;y++)
        {
          for(int x=1;x<raw_point_cloud_message->width-1;x++)
          {
            // Skip all points with zero depths.
            if(originalInput[x+y*raw_point_cloud_message->width].idepth <= 0)
            {
                continue;
            } 

            // Calculate the depth of the point.
            float depth = 1 / originalInput[x+y*raw_point_cloud_message->width].idepth;

                // Create 3D point, with lsd-slam pose transformation.
            Sophus::Vector3f transformed_point = camToWorld * (Sophus::Vector3f((x*fxi + cxi), (y*fyi + cyi), 1) * depth);   
            point.x = transformed_point[0];
            point.y = transformed_point[1];
            point.z = transformed_point[2];
 
            // Add point to pointcloud.
            cloud->points.push_back(point);
          }
        }

        // here the pointcloud is filled with the correct values
        // now, we transform the pointcloud<PointXYZ> in pointcloud2
        pcl::VoxelGrid<pcl::PointXYZ> sor;
        sor.setInputCloud(cloud);
        //LeafSize is a voxel raster leaf size parameter, where each 
        // element represents the dimension of the voxel in the XYZ direction. 
        // The unit is m, where 0.01 represents one centimeter.
        sor.setLeafSize (0.05f, 0.05f, 0.05f);
        sor.filter(*cloud_filtered);
        
        printf("filter applied\n");

        pcl::StatisticalOutlierRemoval<pcl::PointXYZ> removal;
        removal.setInputCloud(cloud_filtered);
        removal.setMeanK(50);
        removal.setStddevMulThresh(1.0);
        removal.filter(*PCLRemoval); 
        printf("outlier removed\n");

        sensor_msgs::PointCloud2 msgToSend;
        pcl::toROSMsg(*PCLRemoval, msgToSend);
        msgToSend.header.stamp = ros::Time(raw_point_cloud_message->time);
        msgToSend.header.frame_id = "camera";
        pub.publish(msgToSend);
        std::cout << "pointcloud sent" << std::endl;
      }  
};

int main (int argc, char** argv)
{
  // Initialize ROS
  ros::init(argc, argv, "pclHandler");
  PCL_handler handler;
  ros::spin();
  return 0;
}
