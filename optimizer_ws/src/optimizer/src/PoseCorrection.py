#!/usr/bin/env python3

from utils_functions import *

X = []
cout = 0
Y = []
w_pred_variation = []
LINEAR_REGRESSION_LSD = False
w_predTemp = 0
PLOT = False
GoodX = []
GoodY = []
poses = []

K = np.array([[506.933047262, 0.0, 321.4629011], 
    [0.0, 508.079839422, 243.86413906],
    [0.0, 0.0, 1.0]], np.float32)

class PoseCorrection:

    def __init__(self):

        self.keyframe_sub = message_filters.Subscriber("/lsd_slam/original_output", 
            Idepth)
        self.LidarCords = message_filters.Subscriber("/NNestimation/NNPreProcessLight", 
            NNPreProcessLight)

        self.posePub = rospy.Publisher("/NNestimation/PoseForPointcloud", 
            PoseStamped, queue_size=10)

        ts = message_filters.ApproximateTimeSynchronizer(
            [self.keyframe_sub, self.LidarCords], 0.1, 10000)      # HERE WE CAN HAVE BIG DE-SINCHRONIZATION
        ts.registerCallback(self.callback)

    print("pose correction ready")
    

    def callback(self, keyframe, LidarCoordinate):

        global cout, w_predTemp,  w_pred_variation, GoodX, GoodY, poses
        cout += 1
        
        if(cout < 0): # set different values if you want to skip the first initialization frame
            print("skip keyframe for initialization")
            return
    
        # this first part can be added in order to highlight the linear dependencies of the LSD-slam
        # and the lidar measurements (densification idea!)
        if(LINEAR_REGRESSION_LSD):
            # vector of inverse depth defined wrt the camera reference frame
            CameraDepth = np.array(keyframe.idepth, dtype=np.float32).reshape(-1,1)
            # vector of coordinate: [u,v,dist] associate to the projection of the lidar over the image plane
            LidarCoords = LidarCoordinate.vector
            # we set a zero matrix equivalent to the image size and draw over it the lidar measuerements 
            LidarVector = np.zeros((len(CameraDepth),1))
            for j in range(len(LidarCoords)):  # here we use the invere depth associated to the lidar measurements
                LidarVector[int(LidarCoords[j].x) + int(LidarCoords[j].y)*640,0] = 1/LidarCoords[j].z

            IndexArray = np.argwhere(LidarVector)  # this vector contain the values of the index where values are different from zero
            xtemp = []
            ytemp = []
            for index in IndexArray:
                    if(int(CameraDepth[index[0]]) > 0 and int(CameraDepth[index[0]]) < 3 and int(LidarVector[index[0]]) < 15):   
                        # at first we scale the actual measurements wrt to the first taken
                        
                        xtemp.append(CameraDepth[index[0]])
                        ytemp.append(LidarVector[index[0]]) # temp variable for saving information only about actual keyframe
                        X.append(CameraDepth[index[0]])     # global variable for saving information from different keyframe
                        Y.append(LidarVector[index[0]])
            # here we convert the lists into np.array 
            xtemp = np.array(xtemp).reshape(-1,1)
            ytemp = np.array(ytemp).reshape(-1,1)
            vectorX = np.array(X).reshape(-1,1)                       
            vectorY = np.array(Y).reshape(-1,1)                       
            GoodXFile = "/home/slamlaboratory/optimizer_ws/LinearRegression/RegressionValidation/GoodX/keyframe_" + str(cout) + ".txt"
            GoodYFile = "/home/slamlaboratory/optimizer_ws/LinearRegression/RegressionValidation/GoodY/keyframe_" + str(cout) + ".txt"
            TmpXFile = "/home/slamlaboratory/optimizer_ws/LinearRegression/RegressionValidation/singular/GoodX/keyframe_" + str(cout) + ".txt"
            TmpYFile = "/home/slamlaboratory/optimizer_ws/LinearRegression/RegressionValidation/singular/GoodY/keyframe_" + str(cout) + ".txt"
            # the plot show the intersection of lsd_slam with the lidar projection
            if(PLOT):
                np_arr = np.frombuffer(LidarCoordinate.RGBImage.data, np.uint8)
                image_np = cv2.imdecode(np_arr, cv2.IMREAD_GRAYSCALE)
                original_shape = image_np.shape
                image_np = image_np.reshape(original_shape[0]*original_shape[1], 1)
                img = np.copy(image_np)
                for k in range(len(CameraDepth)):
                    if(CameraDepth[k] > 0):
                        image_np[k] = 0
                # img = img.reshape(original_shape)
                # cv2.imshow("window", img)
                # cv2.waitKey(0)

                for index in IndexArray:
                    image_np[index[0]+1] = 126
                    image_np[index[0]-1] = 126
                    image_np[index[0]+640] = 126
                    image_np[index[0]-640] = 126
                    image_np[index[0]+641] = 126
                    image_np[index[0]-641] = 126
                    image_np[index[0]+639] = 126
                    image_np[index[0]-639] = 126
                    image_np[index[0]] = 126
                    if(int(CameraDepth[index[0]]) > 0 and LidarVector[index[0]] < 15):
                        image_np[index[0]+1] = 255
                        image_np[index[0]-1] = 255
                        image_np[index[0]+640] = 255
                        image_np[index[0]-640] = 255
                        image_np[index[0]+641] = 255
                        image_np[index[0]-641] = 255
                        image_np[index[0]+639] = 255
                        image_np[index[0]-639] = 255
                        image_np[index[0]] = 255
                        
                image_np = image_np.reshape(original_shape)
                cv2.imshow("window", image_np)
                cv2.waitKey(0)
                with open(GoodXFile,"w+") as f:
                        np.savetxt(f, vectorX)
                        f.close()

                with open(GoodYFile,"w+") as f:
                        np.savetxt(f, vectorY)
                        f.close()

                with open(TmpXFile,"w+") as f:
                        np.savetxt(f, xtemp)
                        f.close()

                with open(TmpYFile,"w+") as f:
                        np.savetxt(f, ytemp)
                        f.close()

                w_pred, timeTaken, r_square = LinearRegressionNP(xtemp, ytemp)
         

        # the actual part of code that is needed, namely the transcription of the POSE!
        position = keyframe.POSE.pose.position
        orientation = keyframe.POSE.pose.orientation
        br = tf2_ros.TransformBroadcaster()
        t = TransformStamped()
        t.header.stamp = keyframe.header.stamp
        t.header.frame_id = "world" 
        t.child_frame_id = "camera"
        t.transform.translation.x = position.x
        t.transform.translation.y = position.y
        t.transform.translation.z = position.z
        t.transform.rotation.x = orientation.x
        t.transform.rotation.y = orientation.y
        t.transform.rotation.z = orientation.z
        t.transform.rotation.w = orientation.w
        br.sendTransform(t)
        print("Pose sent")

        return

def main(args):
    
    rospy.init_node('PoseCorrection', anonymous=True)
    ic = PoseCorrection()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS Pose correction module")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)