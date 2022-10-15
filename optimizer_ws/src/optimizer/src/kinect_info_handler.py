#!/usr/bin/env python3

from symbol import yield_expr
from utils_functions import *
"""
    Script used for different code trial!
"""

K = np.array([[506.933047262, 0.0, 321.4629011], 
    [0.0, 508.079839422, 243.86413906],
    [0.0, 0.0, 1.0]], np.float32)

KKinect = np.array([[520.4878115686323, 0.0, 322.9776205101799], 
    [0.0, 520.2818789261314, 256.8493764669614],
    [0.0, 0.0, 1.0]], np.float32)

# we suppose that the reference frame of the kinect has the same orientation as the camera, for the first trial;
# after that, we can adjust angle parameter. Than we can correct also the traslation coefficient
Ideal = np.zeros((4,4))
Roll = math.radians(-1.50)
Pitch = math.radians(-0.75)
Yaw = math.radians(-0.5)

Roll_R = np.array([[1 , 0, 0],
            [0, math.cos(Roll), -math.sin(Roll)],
            [0, math.sin(Roll), math.cos(Roll)]], np.float32)

Yaw_R = np.array([[math.cos(Yaw), -math.sin(Yaw), 0],
            [math.sin(Yaw), math.cos(Yaw), 0],
            [0, 0, 1]], np.float32)

Pitch_R = np.array([[math.cos(Pitch), 0, math.sin(Pitch)],
            [0, 1, 0],
            [-math.sin(Pitch), 0, math.cos(Pitch)]], np.float32)

R = Yaw_R.dot(Pitch_R.dot(Roll_R))    # rotation matrix with roll-pitch-yaw Euler angles
Ideal[0:3, 0:3] = R
t = [-0.29, 0, 0.01]
Ideal[0:3,3] = t
Ideal[3, 0:4] = [0.0, 0.0, 0.0, 1]

count = 0 
class image_feature:

    def __init__(self):
 
        self.NN_depth_sub = message_filters.Subscriber(                      # monocular image
            "/NNestimation/output", FloatList, queue_size=1000)

        self.depth_sub = message_filters.Subscriber(
            "/camera/depth_registered/image_raw", Image, queue_size=1000)  # kinect depth map

        # self.rgb_sub = message_filters.Subscriber(
        #     "/camera/rgb/image_raw", Image, queue_size=1000)

        ts = message_filters.ApproximateTimeSynchronizer(
            [self.NN_depth_sub, self.depth_sub], 500000, 0.01)     # kinect rgb image
        ts.registerCallback(self.callback)
    


    def callback(self, NN_depth, kinect_depth):

        global count
        count = count + 1
        print(count)
        if(count < 2):
            return
        else:
            bridge = CvBridge()
            #rgb = bridge.imgmsg_to_cv2(rgb_image, "bgr8")
            time_interval = abs(NN_depth.header.stamp.to_sec()-kinect_depth.header.stamp.to_sec())
            print("\ntime interval between NN_prediction and kinect_depth: ", time_interval , "s")
            np_arr = np.frombuffer(NN_depth.RGBImage.data, np.uint8)
            img_to_save = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
            saving_path = "/home/jacopo/Desktop/images/kinect_image/" + str(count) + "image.png"
            cv2.imwrite(saving_path, img_to_save)
            depth_image = bridge.imgmsg_to_cv2(kinect_depth, "16UC1") # the depth is written as uint16 np.ndarray
            depth_image = depth_image/1000.0 # now the np.ndarray is written with float values; it is 480x640
            NN_prediction = np.array((NN_depth.elements)).reshape((480,640)) 
            NN_depth_image = PlotProcessing(NN_prediction)
            saving_path = "/home/jacopo/Desktop/images/kinect_image/" + str(count) + "_NN_depth.png"
            cv2.imwrite(saving_path, NN_depth_image)
            #line of code for printing kinect depth
            depth_image_plot = PlotProcessing(depth_image)
            saving_path = "/home/jacopo/Desktop/images/kinect_image/" + str(count) + "_kinect_.png"
            cv2.imwrite(saving_path, depth_image_plot)   
            #cv2.imshow("hey", a)
            #cv2.waitKey(0)

            # NN_depth is written as a vector which elements are distnace associated to pixels 
            # here it is converted as an image 480x640       
                #307200 pixels image 480x640
            heatmap = np.zeros((NN_prediction.shape[0], NN_prediction.shape[1])) # this variable will contain heatmap information
        
            np_arr = np.frombuffer(NN_depth.RGBImage.data, np.uint8)
            cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
            #imageColored = np.copy(cv_image)                                    # for roto-translation debug
            
            monocular_projection = [[], []]
            monocular_projection[0] = np.zeros((depth_image.shape[0]*depth_image.shape[1],1))
            monocular_projection[1] = np.zeros((depth_image.shape[0]*depth_image.shape[1],1))

            
            for y in range(depth_image.shape[0]):
                for x in range(depth_image.shape[1]):  
                    if(depth_image[y][x] != 0.0):
                        Y = ((y - KKinect[1][2]) * depth_image[y][x]) / KKinect[1][1]
                        X = ((x - KKinect[0][2]) * depth_image[y][x]) / KKinect[0][0]
                        Z = depth_image[y][x]
                        kinect_vec = np.array([X, Y, Z, 1])
                        monocular_vec = np.matmul(Ideal, kinect_vec)
                        image_plane = np.matmul(K, monocular_vec[0:3])
                        monocular_projection[0][x+y*depth_image.shape[0]] = image_plane[0]/image_plane[2]
                        monocular_projection[1][x+y*depth_image.shape[0]] = image_plane[1]/image_plane[2]
                        y_cord = int(monocular_projection[1][x+y*depth_image.shape[0]])
                        x_cord = int(monocular_projection[0][x+y*depth_image.shape[0]])
                        if((x_cord < 640) and (y_cord< 480) and (x_cord > 0) and (y_cord > 0)):
                            # print("depth_image.shape: ", depth_image.shape)
                            # print("NN_prediction.shape: ", NN_prediction.shape)
                            # print("heatmap: ", heatmap[y][x])
                            # print("NNpred: ", NN_prediction[y_cord][x_cord])
                            # print("depth: ", depth_image[y][x])
                            heatmap[y][x] = abs(NN_prediction[y_cord][x_cord] - depth_image[y][x])
                            #print(heatmap[y][x] )
                        
                        if(False):
                            #if( y+1 < depth_image.shape[0] and x+1 < depth_image.shape[1] and x-1 > 0 and y-1 > 0):
                                #rgb = square(4, x, y, rgb)# give colors to the image of the kinecr 
                            if(int(monocular_projection[0][x+y*depth_image.shape[0]]+1) < 640 and int(monocular_projection[1][x+y*depth_image.shape[0]]+1)< 480 and 
                            int(monocular_projection[0][x+y*depth_image.shape[0]]-1) > 0 and int(monocular_projection[1][x+y*depth_image.shape[0]]-1) > 0):
                                imageColored = square(4, int(monocular_projection[0][x+y*depth_image.shape[0]]), int(monocular_projection[1][x+y*depth_image.shape[0]]), imageColored)
                            #giving color to the colored image
                            cv2.imshow("image_kinect_modified", rgb)
                            cv2.imshow("imageColored", imageColored)
                            cv2.waitKey(1)    
                    
            print("heatmap printed")
            fig, ax = plt.subplots()
            ax = sns.heatmap(heatmap)
            plt.xlabel("x - coordinates")
            plt.ylabel("y - coordinates")
            string = "absolute depth difference map between CNN and kinect"
            save_path = "/home/jacopo/Desktop/heatmap/" + str(NN_depth.header.stamp) +".png"
            ax.set_title(string)
            plt.savefig(save_path)
            plt.close()
            
            heatmap_file = "/home/jacopo/Desktop/heatmap/" + str(count) + "_number.txt" 
            heatmap = np.array(heatmap, np.float32)
            with open(heatmap_file,"w+") as f:
                np.savetxt(f, heatmap)
                f.close()
            
            print("\n\n\n\n")
            print(NN_depth.header.stamp)
            print("\n")
            print(kinect_depth.header.stamp)
            print("\n\n\n\n")


                

        
def main(args):
    
    rospy.init_node('kinectPointcloudDebug', anonymous=True)
    ic = image_feature()
    
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS Image feature detector module")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)










    # pixels values always have values 574x 243y; needs to identify the passage inside the process that deal with incorrect values!!