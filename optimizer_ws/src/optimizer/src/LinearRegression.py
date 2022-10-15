#!/usr/bin/env python3

"""
    Script that is used for evaluate the linear regression, without considering 
    the way in which features and labels data are constructed
"""
from utils_functions import *

model_type = "DPT_Large"     # MiDaS v3 - Large     (highest accuracy, slowest inference speed)
#model_type = "DPT_Hybrid"   # MiDaS v3 - Hybrid    (medium accuracy, medium inference speed)
#model_type = "MiDaS_small"  # MiDaS v2.1 - Small   (lowest accuracy, highest inference speed)

midas, device, transform = NNInitializer(model_type)
print("all data for Linear regression Loaded")

def main(args):

    XPath = "/home/jacopo/optimizer_ws/LinearRegression/camera_position7_45Points/FeaturesWrtGT/features"
    X = np.loadtxt(XPath, dtype=np.float32)
    YPath = "/home/jacopo/optimizer_ws/LinearRegression/camera_position7_45Points/LabelsWrtGT/labels"
    Y = np.loadtxt(YPath, dtype=np.float32)
    imgPath = "/home/jacopo/optimizer_ws/LinearRegression/camera_position7_45Points/imageGT/ImagePosition7.png"
    OutputPath = "/home/jacopo/optimizer_ws/LinearRegression/camera_position7_45Points/final_output"
    x = np.array(X).reshape((-1,1))
    y = np.array(Y).reshape((-1,1))
    w_pred, timeTaken, r_square = LinearRegressionNP(x, y) # for camera position 7-8, the linear regression is performed wrt depth
    img = cv2.imread(imgPath)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    print("data in elaboration ... ")
    output, timeNN = NNEstimation(img, midas, device, transform) 
    print("starts post-processing after NN")
    Y[Y != 0] = 1. / Y[Y != 0]      # line added before the linear prediction in order to consider the depth 
    output = output.reshape((-1,1))
    output = LinearPrediction(output, w_pred)
    #output[output != 0] = 1. / output[output != 0]     #uncomment this line for the inverse depth approach (make sure that labels and features 
                                                        # are correctly defined)
    with open(OutputPath+"/output.txt","w+") as f:
        np.savetxt(f, np.array(output, dtype=np.float32))
        f.close()
    
    
if __name__ == "__main__":
    main(sys.argv)