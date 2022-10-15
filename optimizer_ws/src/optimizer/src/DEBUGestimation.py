#!/usr/bin/env python3

from utils_functions import *
"""
    Script that is used inn orther to construct a Features and labels data,
    useful for performing a Linear regression and depth estimation when lsd-slam is
    NOT running. Useful for validating the Neural Network with the linear regression
"""
count = 0
X = []
Y = []
model_type = "DPT_Large"     # MiDaS v3 - Large     (highest accuracy, slowest inference speed)
#model_type = "DPT_Hybrid"   # MiDaS v3 - Hybrid    (medium accuracy, medium inference speed)
#model_type = "MiDaS_small"  # MiDaS v2.1 - Small   (lowest accuracy, highest inference speed)
midas, device, transform = NNInitializer(model_type)

FeaturesPath = "/home/slamlaboratory/optimizer_ws/LinearRegression/camera_position8/FeaturesWrtGT/"
LabelsPath = "/home/slamlaboratory/optimizer_ws/LinearRegression/camera_position8/LabelsWrtGT/"

print("NN correctly initialized; ready for works \n")

class NNestimation:

    def __init__(self):

        self.NNpreProcessLight = rospy.Subscriber("/NNestimation/NNPreProcessLight", 
        NNPreProcessLight, self.callback)
        
        
    def callback(self, msg):

        global X, Y, w_pred_variation, count, FeaturesPath, LabelsPath
        count += 1
        if(count < 11):
            # here the LidarCoords are represented by a vector of float32, with [307200,1] dimension
            LidarCoords = msg.vector  
            # reading the compressed image information 
            np_arr = np.frombuffer(msg.RGBImage.data, np.uint8)
            img = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
            if(count == 1):
                #saving the image in an apposite folder only at the first cycle of the program
                cv2.imwrite("/home/slamlaboratory/optimizer_ws/LinearRegression/camera_position8/imageGT/ImagePosition8.png", img)
            # color code change for the neural network depth estimation 
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            
            output, timeNN = NNEstimation(img, midas, device, transform) # the output is a numpy array of float 32, with size (480,640)
                                                # we have obtained an inverse relative depth; let's scale to 
                                                # absolute inverse depth (Linear Regression)             
                                                # take the inverse of the distances calculated from the LIDAR 
            if(count == 1):
                imagePlot = PlotProcessing(output)      
                # saving the depth image only for the first cycle of the program
                cv2.imwrite("/home/slamlaboratory/optimizer_ws/LinearRegression/camera_position8/imageGT/Depth.png", np.array(imagePlot, dtype=np.uint8))  

            for j in range(len(LidarCoords)):
                # get the lidar inverse depth? for now let's consider direct depth
                LidarCoords[j].z = LidarCoords[j].z 
                # take the midas nn depth estimation given the coordinates of the lidar over the image plane
                X.append(1/(output[int(LidarCoords[j].y)][int(LidarCoords[j].x)])) # here we need to inverse, since Midas give only
                Y.append(LidarCoords[j].z)                                         # inverse depth relative information; now we have the depth!!
            X_vector = np.array(X).reshape(-1,1)
            Y_vector = np.array(Y).reshape(-1,1)
            # part realted to save the features and the labels
            FeaturesPath = FeaturesPath + "features"
            LabelsPath = LabelsPath +"labels"
            with open(FeaturesPath,"w+") as f:
                np.savetxt(f, np.array(X_vector, dtype=np.float32))
                f.close()
            with open(LabelsPath,"w+") as f:
                np.savetxt(f, np.array(Y_vector, dtype = np.float32))
                f.close()
            print("number of images elaborated:", count)
            print("data saved")    
        else:
            print("took 10 images; change position of the camera")
            return

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