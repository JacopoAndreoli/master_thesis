# master_thesis
This repository contains ROS package individuated for the my master thesis work. It has built during the Erasmus+ mobility period at the Universitè Catholique du Louvaine. A full description about the overall setup can be extracted from the master thesis pdf file "master_thesis.pdf", where it is analyzed the problem related to the SLAM mpping module and the related solution found
<p align="center">
  <img src="https://github.com/JacopoAndreoli/master_thesis/blob/main/gif/sensors_system.png"  width="750" height="400">
</p>
Briefly summarizing, the overall idea is to recover a relative scaled dense depth estimation from a single RGB monocular image, exploiting the MiDaS Convolutional Neural network. Then, the absolute scale is evaluated coupling the 2D LiDAR information with the depth map output from MiDaS. The fusion process consists into the projection of LiDAR measurements over the camera image plane and then, given the set of pairs measured depth-estimated depth, a linear regression model is performed.

<p align="center">
  <img src="https://github.com/JacopoAndreoli/master_thesis/blob/main/gif/test_lidar_modified(1).gif" alt="animated" />
</p>

The final ROS network built for the SLAM software architecture is shown in the next image. The last gif is reporting the overall pointcloud generated at the end. It is based on the LSD-SLAM solution; however, it could be integrated with any type of localization process.

<p align="center">
  <img src="https://github.com/JacopoAndreoli/master_thesis/blob/main/gif/slam_architecture.drawio-1-1.png"  width="750" height="400">
</p>
<p align="center">
  <img src="https://github.com/JacopoAndreoli/master_thesis/blob/main/gif/pointcloud_gift_modified.gif" alt="animated" />
</p>
