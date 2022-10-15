#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl_handler/FloatList.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <pcl/point_types.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/features/normal_3d.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/sample_consensus/ransac.h>
#include <pcl/sample_consensus/sac_model_plane.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <chrono>

using namespace std::chrono;
int count = 0;
/*
  Script is used in order to produce a pointcloud based on the depth information coming from
  the linear regression applied over the neural network
*/
// K = np.array([[506.933047262, 0.0, 321.4629011],    matrix definition used before in the python script
//     [0.0, 508.079839422, 243.86413906],
//     [0.0, 0.0, 1.0]], np.float32)

float K[3][3] = {{506.933047262,      0.0     , 321.4629011 },
                 {     0.0     , 508.079839422, 243.86413906}, 
                 {     0.0     ,      0.0     ,      1.0    }};
                 

class PCL_handler{

    private:
        ros::Publisher pub;
        ros::Subscriber sub;
        ros::NodeHandle nh;

    public:

      PCL_handler(){

        sub = nh.subscribe<pcl_handler::FloatList>("/NNestimation/output", 1000, &PCL_handler::callback, this);
        pub = nh.advertise<sensor_msgs::PointCloud2>("/Pointcloud2", 10); 

      }

      void callback(const pcl_handler::FloatList::ConstPtr& msg){ // this message include the depth map, the pose of the camera and the image in itself
        // camera intrinsic parameter information
        auto start = high_resolution_clock::now();
        float fx = K[0][0];
        float fy = K[1][1];
        float cx = K[0][2]; 
        float cy = K[1][2];

        pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZRGB>);
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_filtered (new pcl::PointCloud<pcl::PointXYZRGB>);
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr PCLRemoval (new pcl::PointCloud<pcl::PointXYZRGB>);
        cv_bridge::CvImagePtr cv_ptr_compressed = cv_bridge::toCvCopy(msg->RGBImage,sensor_msgs::image_encodings::BGR8);
        cv::Mat img = cv_ptr_compressed->image;
        count = count + 1;
        std::string savePath = "/home/jacopo/check/pointcloud/" + std::to_string(count) + ".png";
        cv::imwrite(savePath, img);

        // filling pointcloud information with information
        cloud->width = img.cols;
        cloud->points.resize(cloud->width * cloud->height);
        cloud->height = img.rows;
        cloud->is_dense = false;
        
        #pragma omp parallel for
        for (int y = 0; y < img.rows; y++)
        {
          for (int x = 0; x < img.cols; x++)
          {
              // 7 = FLOAT32 type
            pcl::PointXYZRGB p;
            float dist = msg->elements[x + y*img.cols];   // recalling that the output is a 307200 elements, one-dim vector
            p.z = dist;
            
            p.y = ((y - cy) * dist) / fy;
            p.x = ((x - cx) * dist) / fx;

            cv::Vec3b color = img.at<cv::Vec3b>(cv::Point(x,y));
            uint8_t r = (color[2]);
            uint8_t g = (color[1]);
            uint8_t b = (color[0]);
            int32_t rgb = (r << 16) | (g << 8) | b;
            p.rgb = *reinterpret_cast<float*>(&rgb);

            cloud->points.push_back(p);
          }
        }
        
        // cloud is the preprocessed pointlcloud variable

        // here the pointcloud is filled with the correct values
        // now, we transform the pointcloud<PointXYZ> in pointcloud2
        pcl::VoxelGrid<pcl::PointXYZRGB> sor;
        sor.setInputCloud(cloud);
        //LeafSize is a voxel raster leaf size parameter, where each 
        // element represents the dimension of the voxel in the XYZ direction. 
        // The unit is m, where 0.01 represents one centimeter.
        sor.setLeafSize (0.05f, 0.05f, 0.05f);
        sor.filter(*cloud_filtered);
        printf("voxel filter applied\n");
        // outlier removal (statistically approach) filter applied to the pointcloud
        pcl::StatisticalOutlierRemoval<pcl::PointXYZRGB> removal;
        removal.setInputCloud(cloud_filtered);
        removal.setMeanK(50);
        removal.setStddevMulThresh(1.0);
        removal.filter(*PCLRemoval); //substitute this for the voxel filter and outlier removal 
        printf("outlier removed\n");
        
        // converting the c++ pcl pointcloud into its ros msg pointcloud2
        sensor_msgs::PointCloud2 msgToSend;
        pcl::toROSMsg(*cloud, msgToSend);
        msgToSend.header.seq = msg->RGBImage.header.seq;
        msgToSend.header.stamp = msg->RGBImage.header.stamp;
        msgToSend.header.frame_id = "camera";
       
        pub.publish(msgToSend); 
        
        
        //std::cout << "NN output stamp elaborated: " << msg->header.stamp << std::endl;
        //printf("data published\n");

        auto stop = high_resolution_clock::now();
        auto duration = duration_cast<microseconds>(stop - start);
 
        // std::cout << "Time taken by function: "
        //  << duration.count() << " microseconds" << std::endl;

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
