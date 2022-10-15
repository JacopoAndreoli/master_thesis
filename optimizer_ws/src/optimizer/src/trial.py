#!/usr/bin/env python3

from utils_functions import *
"""
    Script used for different code trial!
"""


class image_feature:

    def __init__(self):

        self.NNpreProcessLight = rospy.Subscriber('/camera/depth/image_raw',Image,self.callback)

    def callback(self, kinect_depth):
        bridge = CvBridge()
        cv_image = bridge.imgmsg_to_cv2(kinect_depth, "32FC1")
        print(cv_image[10,10])

def main(args):
    
    rospy.init_node('LidarOnImages', anonymous=True)
    ic = image_feature()
    
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS Image feature detector module")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)