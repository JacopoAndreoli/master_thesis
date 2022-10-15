#include <ros/ros.h>
#include <opencv3/opencv.hpp>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>

                
class PCL_handler{

    private:
        ros::Publisher pub;
        ros::Subscriber sub;
        ros::NodeHandle nh;

    public:

      PCL_handler(){

        sub = nh.subscribe<sensor_msgs::Image>("/camera/ir/image_raw", 1000, &PCL_handler::callback, this);
        pub = nh.advertise<sensor_msgs::PointCloud2>("/camera/ir/image_8_bit", 10); 

      }

      void callback(const sensor_msgs::Image::ConstPtr& msg){ // this message include the depth map, the pose of the camera and the image in itself
       
        cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg,sensor_msgs::image_encodings::MONO16);
        cv::Mat img = cv_ptr->image;

        cv::Mat image_grayscale = img.clone();
        image_grayscale.convertTo(image_grayscale, CV_8U, 1 / 256.0);
        cv::imshow("image_trial", image_grayscale);
        cv::waitKey(0);
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
