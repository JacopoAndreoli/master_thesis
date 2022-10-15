#!/usr/bin/env python3

from utils_functions import *

"""
    Script that is used in the evaluation of the neural network and the 
    generation of the assocaited ground truth. Starting from the click of the mouse,
    recover the saved NN estimation. Then the same point is neasured by means of a meter
    or laser finder.
"""

def click_event(event, x, y, falgs, params):

    output = np.loadtxt("/home/jacopo/optimizer_ws/LinearRegression/camera_position7_45Points/final_output/output.txt", dtype=np.float32)
    output_array = np.array(output)
    output_reshaped = output_array.reshape(480,640)

    if event == cv2.EVENT_LBUTTONDOWN:
        print(x, '', y)
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(img,str(x)+','+str(y),(x,y),font,0.7,(255,0,0),1)
        cv2.imshow("image", img)
        print("NNpred for the pixel: ", output_reshaped[y][x])
    
if __name__=="__main__":

    img = cv2.imread("/home/jacopo/optimizer_ws/LinearRegression/camera_position7_45Points/imageGT/ImagePosition7.png", cv2.IMREAD_COLOR)
    cv2.imshow('image', img)
    cv2.setMouseCallback('image', click_event)

    cv2.waitKey(0)
    cv2.destroyAllWindows