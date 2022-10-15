#!/usr/bin/env python
# the import are used in all the different script .py where the overall ros network is working
from __future__ import division 
from tkinter import N
from click import FloatRange
import rospy
import matplotlib.cm as cm
import numpy as np
import cv2
import matplotlib.pyplot as plt
import matplotlib as mpl
import sys
from optimizer.msg import FloatList, NewMsg, BoolStampedMsg, Idepth
from optimizer.msg import ThreeMap, keyframeMsg, ColoredImageMsg, FloatArray, NNPreProcess, NNPreProcessLight
import os
from random import randrange
from sensor_msgs import point_cloud2
from sensor_msgs.msg import CompressedImage, LaserScan, PointCloud2, Image
from geometry_msgs.msg import PoseStamped, TransformStamped
from std_msgs.msg import Header
import struct
from sklearn.cluster import KMeans
import pandas as pd
import scipy as sp
from scipy import stats
from sensor_msgs.msg import CompressedImage, Image
import torch
from cv_bridge import CvBridge
import math
from sklearn import preprocessing
from geometry_msgs.msg import Vector3
import message_filters
import seaborn as sns
import os, glob
import re
import tf2_ros
"""
    This script is used qs supporting script that contains all the functions exploited in the other
    script in which they refer.

"""

def quaternion_to_rotation_matrix(Q):
    """
    Covert a quaternion into a full three-dimensional rotation matrix.
 
    Input
    :param Q: A 4 element array representing the quaternion (q0,q1,q2,q3) 
 
    Output
    :return: A 3x3 element matrix representing the full 3D rotation matrix. 
             This rotation matrix converts a point in the local reference 
             frame to a point in the global reference frame.
    """
    # Extract the values from Q
   
    q0 = Q[0]
    q1 = Q[1]
    q2 = Q[2]
    q3 = Q[3]
     
    # First row of the rotation matrix
    r00 = 2 * (q0 * q0 + q1 * q1) - 1
    r01 = 2 * (q1 * q2 - q0 * q3)
    r02 = 2 * (q1 * q3 + q0 * q2)
     
    # Second row of the rotation matrix
    r10 = 2 * (q1 * q2 + q0 * q3)
    r11 = 2 * (q0 * q0 + q2 * q2) - 1
    r12 = 2 * (q2 * q3 - q0 * q1)
     
    # Third row of the rotation matrix
    r20 = 2 * (q1 * q3 - q0 * q2)
    r21 = 2 * (q2 * q3 + q0 * q1)
    r22 = 2 * (q0 * q0 + q3 * q3) - 1
     
    # 3x3 rotation matrix
    rot_matrix = np.array([[r00, r01, r02],
                           [r10, r11, r12],
                           [r20, r21, r22]])
                            
    return rot_matrix


def valmap(value, istart, istop, ostart, ostop):
    """
    evaluation of the pixel based on the image information.
 
    Input
    :extremas of the image and the values of the coordinate of the pixels to consider
 
    Output
    :return: float32 value associated to the pixel coordinates (pixel intensity or distance information)
    """
    return int(ostart + (ostop - ostart) * ((value - istart) / (istop - istart)))

def K_Means_Clustering(colored_image, K):
    """
    implementation of k-means segmentation algorithm, from the opencv library 
 
    Input
    :colored_image: np.ndarray(uint8), namely the input image to be considered
    :K: numbers of cluster in which segment the input image
 
    Output
    :label: np.array(uint); assign a label (cluster identifier) to all pixels of the image
    :center: np.array that identify the centres of the different clusters used (dimension depends on the number of the cluster)
    """
    Z = colored_image.reshape((-1,3))
    Z = np.float32(Z)
    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 10000, 1.0)
    ret,label,center=cv2.kmeans(Z,K,None,criteria,10,cv2.KMEANS_RANDOM_CENTERS)
    #cv2.imshow('result 2',res2)
    return label, center

def saving_image(folder, image_name, image, count):
    """
    save the image, given path name and input image
 
    Input
    :image_name: string; name of the image
    :image: image that we want to save
    :count: counter used to make difference on the image name 
    :folder: folder that is used to save the images
 
    Output
    :there is no return; the overall function save the image as a .png file in the specified path and folder 
    """
    image_name = image_name + str(count) + ".png"
    cv2.imwrite(os.path.join(folder , image_name), image)
    return

def equalizeHistogram(image_BGR):
    """
    apply opencv equalize histogram algorithm to enhance contrast in the input image
 
    Input
    :image_BGR: np.ndarray(uint) image in BGR format color code
 
    Output
    :the input image with equalize histogram filtered channel for the colors
    """
    img_lab = cv2.cvtColor(image_BGR, cv2.COLOR_BGR2LAB)
    l, a, b = cv2.split(img_lab)
    equ_l = cv2.equalizeHist(l)
    updated_lab_image = cv2.merge((equ_l,a,b))
    hist_eq_img = cv2.cvtColor(updated_lab_image, cv2.COLOR_LAB2BGR)
    return hist_eq_img
    
def CLAHE_filtering(image_BGR):
    """
    apply opencv CLAHE histogram algorithm to enhance contrast in the input image
 
    Input
    :image_BGR: np.ndarray(uint) image in BGR format color code
 
    Output
    :the input image with CLAHE histogram filtered channel for the colors
    """
    img_lab = cv2.cvtColor(image_BGR, cv2.COLOR_BGR2LAB)
    l, a, b = cv2.split(img_lab)
    clahe = cv2.createCLAHE(clipLimit = 3.0, tileGridSize = (8,8))
    clahe_img_l = clahe.apply(l)
    update_img_clahe = cv2.merge((clahe_img_l, a,b))
    CLAHE_img = cv2.cvtColor(update_img_clahe, cv2.COLOR_LAB2BGR)
    return CLAHE_img

def PlotProcessing(input_img):      # conversion from a float np.ndarray to np.uint8, for plotting purpose
    """
    process an image of np.ndarray(float) depth map so as to define a np.ndarray(float)
    that can be shown by means of cv2.imshow() function, since it accepts only uint8 values 
 
    Input
    :input_img: np.ndarray(float) image that we want to show through cv2.imshow() function
 
    Output
    :uint8_image: input image converted in a uint8 values inside, keeping the range values as the input
    """
    preproces_img  = np.zeros((480,640), float)
    uint8_image = np.zeros((480,640), np.uint8)
    Min = 0.0
    Max = 0.0
    Min, Max, min_index, max_index = cv2.minMaxLoc(input_img)
    Range = Max-Min
    for y in range(preproces_img.shape[0]):
        for x in range(preproces_img.shape[1]):
            preproces_img[y,x] = float((1.0/Range) * input_img[y,x] - (Min / Range))
            uint8_image[y,x] =  np.uint8(255.0 * preproces_img[y,x])
    return uint8_image

def image_sharpening(input_img):

    kernel = np.array([[0, -1, 0],
                   [-1, 5,-1],
                   [0, -1, 0]])
    image_sharp = cv2.filter2D(src=input_img, ddepth=-1, kernel=kernel)
    """
    sharpening image through the span of a 2d filter
 
    Input
    :input_img: np.ndarray(uint8) image 
 
    Output
    :uint8_image: input image with sharpening effect applied
    """
    return image_sharp

def Number_of_cluster(input_dataframes, clusters_checking):
    """
    return a plot that can be open so as to identify the number of optimal cluster 
    for the k-means cluster algorithm
 
    Input
    :input_dataframes: pd dataframes
    :clusters_checking: max number of clusters where search the optimal number of clusters
 
    Output
    : no output is returned; ones need to check the plot saved in the path defined so as to identify the 
    optimal value for the k-means clustering
    """
    distortions = []
    Z = range(1,clusters_checking)
    for k in Z:
        kmeanModel = KMeans(n_clusters=k)
        kmeanModel.fit(input_dataframes)
        distortions.append(kmeanModel.inertia_)
        print("iteration complete for", k, "number of clusters")
    plt.figure(figsize=(16,8))
    plt.plot(Z, distortions, 'bx-')
    plt.xlabel('k')
    plt.ylabel('Distortion')
    plt.title('The Elbow Method showing the optimal k')
    plt.savefig('/home/slamlaboratory/optimizer_ws/Optimal_key/optimal_cluster_plot.png')
    return

def dataframe_creation(input_img):   # this is a gray image
    """
    starting from an input image create a dataframe, where each field is found applied some filtering operation 
    to the input image 
 
    Input
    :input_img: input image that needs to be segmented through k-means clustering algorithm
    
    Output
    :df: the pd dataframe constructed over the image taken into account
    """
    b_channel, g_channel, r_channel = cv2.split(input_img)
    b_mask = b_channel.reshape(-1)
    g_mask = g_channel.reshape(-1)
    r_mask = r_channel.reshape(-1)
    df = pd.DataFrame()
    df['b pixels'] = b_mask
    df['g pixels'] = g_mask
    df['r pixels'] = r_mask
    img = cv2.cvtColor(input_img, cv2.COLOR_BGR2GRAY)
    img2 = img.reshape(-1)

    #Generate Gabor features
    num = 1  #To count numbers up in order to give Gabor features a lable in the data frame
    kernels = []
    for theta in range(2):   #Define number of thetas
        theta = theta / 4. * np.pi
        for sigma in (1, 3):  #Sigma with 1 and 3
            for lamda in np.arange(0, np.pi, np.pi / 4):   #Range of wavelengths
                for gamma in (0.05, 0.5):   #Gamma values of 0.05 and 0.5
                    gabor_label = 'Gabor' + str(num)  #Label Gabor columns as Gabor1, Gabor2, etc.
    #                print(gabor_label)
                    ksize=9
                    kernel = cv2.getGaborKernel((ksize, ksize), sigma, theta, lamda, gamma, 0, ktype=cv2.CV_32F)    
                    kernels.append(kernel)
                    #Now filter the image and add values to a new column 
                    fimg = cv2.filter2D(img2, cv2.CV_8UC3, kernel)
                    filtered_img = fimg.reshape(-1)
                    df[gabor_label] = filtered_img  #Labels columns as Gabor1, Gabor2, etc.
                    num += 1  #Increment for gabor column label
                    
    ########################################
    #Gerate OTHER FEATURES and add them to the data frame
                    
    #CANNY EDGE
    edges = cv2.Canny(img, 100,200)   #Image, min and max values
    edges1 = edges.reshape(-1)
    df['Canny Edge'] = edges1 #Add column to original dataframe

    from skimage.filters import roberts, sobel, scharr, prewitt

    #ROBERTS EDGE
    edge_roberts = roberts(img)
    edge_roberts1 = edge_roberts.reshape(-1)
    df['Roberts'] = edge_roberts1

    #SOBEL
    edge_sobel = sobel(img)
    edge_sobel1 = edge_sobel.reshape(-1)
    df['Sobel'] = edge_sobel1

    #SCHARR
    edge_scharr = scharr(img)
    edge_scharr1 = edge_scharr.reshape(-1)
    df['Scharr'] = edge_scharr1

    #PREWITT
    edge_prewitt = prewitt(img)
    edge_prewitt1 = edge_prewitt.reshape(-1)
    df['Prewitt'] = edge_prewitt1

    # #GAUSSIAN with sigma=3
    # from scipy import ndimage as nd
    # gaussian_img = nd.gaussian_filter(img, sigma=3)
    # gaussian_img1 = gaussian_img.reshape(-1)
    # df['Gaussian s3'] = gaussian_img1

    # #GAUSSIAN with sigma=7
    # gaussian_img2 = nd.gaussian_filter(img, sigma=7)
    # gaussian_img3 = gaussian_img2.reshape(-1)
    # df['Gaussian s7'] = gaussian_img3

    # #MEDIAN with sigma=3
    # median_img = nd.median_filter(img, size=3)
    # median_img1 = median_img.reshape(-1)
    # df['Median s3'] = median_img1

    # #VARIANCE with size=3
    # variance_img = nd.generic_filter(img, np.var, size=3)
    # variance_img1 = variance_img.reshape(-1)
    # df['Variance s3'] = variance_img1  #Add column to original dataframe
    return df

def NN_prediction(input_img, NN):    # function based on Monodepth adabin; for Midas is built a different function
    """
    NN depth estimation starting from the imnput image and the downloaded NN model
 
    Input
    :input_img: input image 
    :NN: Neural network model downloaded
    
    Output
    :predicted_depth: np.ndarray(float), where each element is a pixel and its valued the depth prediction
    """
    bin_centers, predicted_depth = NN.predict_pil(input_img)
    predicted_depth = np.squeeze(predicted_depth, axis = 0)
    predicted_depth = np.squeeze(predicted_depth, axis = 0)
    return predicted_depth

def Rototranslation_def(translation, quaternion):
    """
    create a rototranslation starting from translation and quaternion information
 
    Input
    :translation: np.array(float) that identify 3D translation
    :quaternion: orientation in the 3D dimension expressed in quaternion form
    
    Output
    :rototranslation: np.ndarray(float)m dim=4x4, representing the obtained rototranslation
    """
    rotation = quaternion_to_rotation_matrix(quaternion)
    rototranslation = np.zeros((4,4))
    rototranslation[0:3, 0:3] = rotation
    rototranslation[0:3,3] = translation[0, :].T
    rototranslation[3, 0:4] = [0.0, 0.0, 0.0, 1]
    
    return rototranslation
    
def initializingTF():
    """
    create a rototranslation from the rplidar to the camera
 
    Input
    :
    
    Output
    :Ideal: np.ndarray(float), dim=4x4, rototranslation from lidaro to the camera
    """
    Ideal = np.zeros((4,4))
    Roll = math.radians(0)
    Pitch = math.radians(-1.8)
    Yaw = math.radians(0)
    Roll_R = np.array([[1 , 0, 0],
                [0, math.cos(Roll), -math.sin(Roll)],
                [0, math.sin(Roll), math.cos(Roll)]], np.float32)

    Yaw_R = np.array([[math.cos(Yaw), -math.sin(Yaw), 0],
                [math.sin(Yaw), math.cos(Yaw), 0],
                [0, 0, 1]], np.float32)

    Pitch_R = np.array([[math.cos(Pitch), 0, math.sin(Pitch)],
                [0, 1, 0],
                [-math.sin(Pitch), 0, math.cos(Pitch)]], np.float32)
    R = Yaw_R.dot(Pitch_R.dot(Roll_R))

    Ideal[0:3, 0:3] = R
    t = [-0.0, -0.07, -0.05]
    Ideal[0:3,3] = t
    Ideal[3, 0:4] = [0.0, 0.0, 0.0, 1]

    return Ideal

def correctionFactor(u_real, image_width, image_height):
    """
    correction factor considering the different coordinate system (x,y) and (u,v)
 
    Input
    :u_real: pixel coordinates
    :image_width: image width (number of pixels in a row)
    :image_width: image height (number of pixels in a column)

    Output
    :u_real: new coordinate for the pixel
    """

    central_axis = int(image_width/2)
    if(u_real < central_axis):
        u_real = u_real + int(2*(central_axis - u_real))
   
    else:
        u_real = u_real + int(2*(central_axis - u_real))

    return u_real

def correctionFactorHeight(u_real, image_width, image_height):
    """
    correction factor considering the different coordinate system (x,y) and (u,v);
 
    Input
    :u_real: pixel coordinates
    :image_width: image width (number of pixels in a row)
    :image_width: image height (number of pixels in a column)

    Output
    :u_real: new coordinate for the pixel
    """
    central_axis = int(image_height/2)
    if(u_real < central_axis):
        u_real = u_real + int(2*(central_axis - u_real))
    else:
        u_real = u_real + int(2*(central_axis - u_real))
        

    return u_real

def publishingImage(image, stamp, seq):
    """
    write a ros message for publishing a compressed image in the ros network
 
    Input
    :image: input image to be compressed and sent
    :stamp: timestamp associated to the image
    :image_width: image sequencer; useless information at the end

    Output
    :msg: returned message with compressed image information
    """
    msg = CompressedImage()
    msg.header.stamp = stamp
    msg.header.seq = seq
    msg.format = "jpeg"
    msg.data = np.array(cv2.imencode('.jpg', image)[1]).tobytes()
    # Publish new image
    return msg
    

def NNEstimation(RGBimage, midas, device, transform):
    """
    Midas-NN estimation

    Input
    :RGBimage: input image where we want to make our depth prediction
    :midas: midas model that we want to use for the depth estimation
    :device: cpu or gpu device?
    :transform: used when choosing large Midas NN models

    Output
    :output: np.ndarray(float), namely depth map associated to the input image
    :time_taken: time needed for the neural network estimation
    """
    c1 = cv2.getTickCount()
    input_batch = transform(RGBimage).to(device)
    with torch.no_grad():
        prediction = midas(input_batch)
        prediction = torch.nn.functional.interpolate(
            prediction.unsqueeze(1),
            size=RGBimage.shape[:2],
            mode="bicubic",
            align_corners=False,
        ).squeeze()  
    output = prediction.cpu().numpy()     # the output is a numpy array of float 32, with size (480,640)
    c2 = cv2.getTickCount() 
    time_taken = (c2 - c1)/ cv2.getTickFrequency() 
    return output, time_taken

def NNInitializer(model_type):
    """
    Midas-NN estimation initializer; download the weights

    Input
    :model_type: string that identify the model of the Midas NN
    
    Output
    :midas: Midas-NN weights
    :device: cpu or gpu device?
    :transform: particular initilization only for the large models of midas
    """
    midas = torch.hub.load("intel-isl/MiDaS", model_type)
    device = torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")

    midas.to(device)
    midas.eval()
    midas_transforms = torch.hub.load("intel-isl/MiDaS", "transforms")

    if model_type == "DPT_Large" or model_type == "DPT_Hybrid":
        transform = midas_transforms.dpt_transform
    else:
        transform = midas_transforms.small_transform

    return midas , device, transform


def AddingCOMPRESSEDToMsg(msgPoints, stamp, seq, image):
    """
    adding compressed image to the modified message type

    Input
    :msgPoints: custom message type
    :stamp; timestamp associated to the image 
    :seq: sequencer associated to the image (not important)
    :image: input image to be compressed
    
    Output
    :msgPoints: new message definition after adding the compressed image information
    """
    msg = CompressedImage()
    msg.header.stamp = stamp
    msg.header.seq = seq
    msg.format = "jpeg"
    msg.data = np.array(cv2.imencode('.jpg', image)[1]).tobytes()
    # Publish new image
    msgPoints.RGBImage = msg

    return msgPoints

def pseudoinverseByHand(InputMatrix, threshold : float = 1e-10):
    """
    calculating svd decomposition by hand

    Input
    :InputMatrix: input matrix that we want to obtain its pseudoinverse
    
    Output
    :A_pseudo_inverse: pseudo-inverse of the input matrix
    """
    U, S, V = np.linalg.svd(InputMatrix, full_matrices = False)
    for i in range(len(S)): 
        S[i] = np.where(S[i] > threshold ,1 / S[i], 0)
    A_pseudo_inverse = np.matmul(V.T, np.matmul(np.diag(S), U.T))
    return A_pseudo_inverse


def LinearRegressionByHand(X, Y):
    """
    Linear regression by hand 

    Input
    :X: feature matrix
    :Y: Labels matrix (or vector)
    
    Output
    :w_hat: coefficent of the regression line
    :time_taken: time needed for the regression
    """
    # data normalization for better number condition for
    # finding a solution for the inverse problem:
    # we set zero-centered mean and unitary standard deviation
    c1 = cv2.getTickCount()
    X_1 = np.ones((X.shape[0],1))
    X_extended = np.hstack((X, X_1))
    w_hat = np.matmul(np.matmul(pseudoinverseByHand(np.matmul(X_extended.T, X_extended), 1e-10), X_extended.T), Y)
    c2 = cv2.getTickCount() 
    time_taken = (c2 - c1)/ cv2.getTickFrequency() 
    return w_hat, time_taken

def LinearPrediction(Xdata, wPred):
    """
    Linear prediction for unseen data

    Input
    :Xdata: feature matrix
    :wPred: coefficent of the regression line
    
    Output
    :prediction: prediction based on the linear regression
    """
    #Xdata = scaler.transform(Xdata)
    X1 = np.ones((Xdata.shape[0],1))
    Xdata = np.hstack((Xdata, X1))
    prediction = np.matmul(Xdata, wPred)

    return prediction

def LinearRegressionNP(X, Y):
    """
    Linear regression based on the numpy module

    Input
    :X: feature matrix
    :Y: Labels matrix (or vector)
    
    Output
    :w_hat: coefficent of the regression line
    :time_taken: time needed for the regression
    r_square: Coefficent of determination for the linear regression
    """
    c1 = cv2.getTickCount()
    X1 = np.ones((X.shape[0],1))
    x_train_extended = np.hstack((X, X1))
    w_hat_np, r_square = np.linalg.lstsq(x_train_extended, Y, rcond = 1e-10)[0], np.linalg.lstsq(x_train_extended, Y, rcond = 1e-10)[1]
    #rss_np = np.linalg.lstsq(x_train_extended, Y, rcond = 1e-10)[1]
    c2 = cv2.getTickCount() 
    time_taken = (c2 - c1)/ cv2.getTickFrequency() 
    return w_hat_np, time_taken, r_square #, rss_np


def get_quaternion_from_euler(roll, pitch, yaw):
  """
  Convert an Euler angle to a quaternion.
   
  Input
    :param roll: The roll (rotation around x-axis) angle in radians.
    :param pitch: The pitch (rotation around y-axis) angle in radians.
    :param yaw: The yaw (rotation around z-axis) angle in radians.
 
  Output
    :return qx, qy, qz, qw: The orientation in quaternion [x,y,z,w] format
  """
  qx = np.sin(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) - np.cos(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)
  qy = np.cos(roll/2) * np.sin(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.cos(pitch/2) * np.sin(yaw/2)
  qz = np.cos(roll/2) * np.cos(pitch/2) * np.sin(yaw/2) - np.sin(roll/2) * np.sin(pitch/2) * np.cos(yaw/2)
  qw = np.cos(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)
 
  return [qx, qy, qz, qw]

def valmap( value, istart, istop, ostart, ostop):
        return ostart + (ostop - ostart) * ((value - istart) / (istop - istart))

def square(lenght_side, x_coord, y_coord, image):
    i = 0

    while(i < lenght_side):
        image[y_coord][x_coord] = [0,0,255]      #image colored is a copy of the raspicam monocular image
        image[y_coord][x_coord+i] = [0,0,255]
        image[y_coord][x_coord-i] = [0,0,255]
        image[y_coord+i][x_coord]= [0,0,255]
        image[y_coord+i][x_coord-i] = [0,0,255]
        image[y_coord+i][x_coord+i] = [0,0,255]
        image[y_coord-i][x_coord] = [0,0,255]
        image[y_coord-i][x_coord+i] = [0,0,255]
        image[y_coord-i][x_coord-i] = [0,0,255]
        i += 1

    return image