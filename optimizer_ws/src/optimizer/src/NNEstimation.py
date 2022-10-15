#!/usr/bin/env python3
from utils_functions import *

PLOT = False
DEBUG = False
cout = 0
CONVERGENCE_DATA = []
DATA = []
X = []
Y = []
w_pred_variation = []


COMPRESSED = False

model_type = "DPT_Large"     # MiDaS v3 - Large     (highest accuracy, slowest inference speed)
#model_type = "DPT_Hybrid"   # MiDaS v3 - Hybrid    (medium accuracy, medium inference speed)
#model_type = "MiDaS_small"  # MiDaS v2.1 - Small   (lowest accuracy, highest inference speed)

midas, device, transform = NNInitializer(model_type)
count = 0

print("NN correctly initialized; ready for works \n")

class NNestimation:

    def __init__(self):

        # self.NNpreProcessLight = rospy.Subscriber("/NNestimation/NNPreProcessLight", 
        #     NNPreProcessLight, self.callback)
        # self.pub = rospy.Publisher("/NNestimation/output", 
        #     FloatList, queue_size=10)

        self.keyframe_sub = message_filters.Subscriber("/lsd_slam/original_output", 
            Idepth)
        self.NNPreProcessLight = message_filters.Subscriber("/NNestimation/NNPreProcessLight", 
            NNPreProcessLight)
        
        self.pub = rospy.Publisher("/NNestimation/output", 
             FloatList, queue_size=10)

        self.posePub = rospy.Publisher("/NNestimation/PoseForPointcloud", 
            PoseStamped, queue_size=10)

        ts = message_filters.ApproximateTimeSynchronizer(
            [self.keyframe_sub, self.NNPreProcessLight], 100000, 0.1)      # HERE WE CAN HAVE BIG DE-SINCHRONIZATION
        ts.registerCallback(self.callback)
    
    def callback(self, keyframe, msg):
        global X, Y, w_pred_variation, count, cout
        time_interval = abs(keyframe.header.stamp.to_sec()-msg.header.stamp.to_sec())
        print("\ntime interval between lidar and image: ", time_interval , "s")
        bridge = CvBridge()
        #cv_image = bridge.imgmsg_to_cv2(keyframe.coloredImage, desired_encoding='passthrough')
        count = count +1
        #SavePath2 = "/home/jacopo/check/keyframe/" + str(count) + ".png"
        #cv2.imwrite(SavePath2, cv_image) 
        #print(count)
        

        LidarCoords = msg.vector
        # we use this definition to identify when turn on the NN estimation
        np_arr = np.frombuffer(msg.RGBImage.data, np.uint8)
        img = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        #SavePath = "/home/jacopo/check/NNEstimation/" + str(count) + ".png"
        #cv2.imwrite(SavePath, img) 

        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        output, timeNN = NNEstimation(img, midas, device, transform) # the output is a numpy array of float 32, with size (480,640)
        #print(timeNN)
        #original_output = output                                     # we have obtained an inverse relative depth; let's scale to 
        # if(DEBUG):                                                   # absolute inverse depth (Linear Regression)             
        #     print("time for NN prediction: ", timeNN)                          
        #     imagePlot = PlotProcessing(output)      
        #     cv2.imwrite("/home/slamlaboratory/thesis_ws/Midas.png", np.array(imagePlot, dtype=np.uint8))         
        #     windowstring = "window" + model_type 
        #     cv2.imshow(windowstring, imagePlot)
        #     cv2.waitKey(0)
        #     print("functionality of node stopped for plotting purpose")
        
        # take the inverse of the distances calculated from the LIDAR
        
        for j in range(len(LidarCoords)):
            LidarCoords[j].z = 1/LidarCoords[j].z  # get the lidar inverse depth
            X.append(output[int(LidarCoords[j].y)][int(LidarCoords[j].x)]) # here, (x,y) coords correspond to (u,v) coords in the image plane
            Y.append(LidarCoords[j].z)
        
        X_vector = np.array(X).reshape(-1,1)
        Y_vector = np.array(Y).reshape(-1,1)
        #w_pred, timeLinearByHand = LinearRegressionByHand(X_vector, Y_vector)
        w_pred_numpy, timeLinearNumpy, r_square= LinearRegressionNP(X_vector, Y_vector) # same result, but faster
        w_pred_variation.append(w_pred_numpy)
        
        # if(DEBUG):  
        #     print("time for linear regression by hand: ", timeLinearByHand)
        #     print("time for NUMPY linear regression: ", timeLinearNumpy)
        #     print("===================================================")
        #     print("result linear by hand: ", w_pred)
        #     print("result linear numpy: ", w_pred_numpy)

        if(PLOT):
            xPLOT = np.linspace(min(X_vector),max(X_vector),100)
            yPLOT = w_pred_numpy[0]*xPLOT+w_pred_numpy[1]
            convergenceVector = [xPLOT, yPLOT]
            CONVERGENCE_DATA.append(convergenceVector)
            print("linear regression with: ", X_vector.shape[0])
            plt.plot(xPLOT, yPLOT, '-r', label='regression line')
            plt.title('Linear regression')
            plt.xlabel('x', color='#1C2833')
            plt.ylabel('y', color='#1C2833')
            plt.legend(loc='upper left')
            sns.set_theme(style="darkgrid")
            plt.scatter(X_vector,Y_vector, s = 1)
            plt.show()

        # outputPlot = PlotProcessing(output)
        # saving_path = "/home/jacopo/Desktop/images/NN_image/" + str(msg.RGBImage.header.seq) + ".png"
        # cv2.imwrite(saving_path, outputPlot)
        # here output is a 640x480 vector
        output = output.reshape((-1,1))
        # here the output is correctly converted into the correct
        # shape (example: pixel [1][0]  --> pixel [640][0]), 1-dim vector
        output = LinearPrediction(output, w_pred_numpy)
        #print("w used: ", w_pred_numpy)
        msg_pub = FloatList()
        

        output[output != 0] = 1. / output[output != 0]
        msg_pub.header.stamp = msg.RGBImage.header.stamp
        msg_pub.elements = output
        
        # if(DEBUG):  
        #     output = output.reshape((height, width))
        #     for i in range(output.shape[0]):
        #         for j in range(output.shape[1]):
        #             print("original prediction: ", original_output[i][j])
        #             print("prediction scaled: ", output[i][j]) 
        #             print("=======================")
        #     imagePlot = PlotProcessing(output)               
        #     windowstring = "window" + model_type
        #     cv2.imshow(windowstring, imagePlot)
        #     cv2.waitKey(0)

        msg_pub.RGBImage = msg.RGBImage
        msg_pub.header.seq = msg.RGBImage.header.seq 
        #print("\nimage timestamp elaborated: ", msg_pub.header.stamp)
        self.pub.publish(msg_pub)
        #print("data published")
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
        #print("Pose sent")

# ============================= LIVE SLAM ================================== 
      
        
def main(args):
    
    rospy.init_node('NNestimation', anonymous=True)
    ic = NNestimation()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS NN estimation module")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)