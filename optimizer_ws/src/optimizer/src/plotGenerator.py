#!/usr/bin/env python3

from utils_functions import *
import matplotlib.pyplot as plt2
"""
    Script used for the plot over the features-labels information over data acquired
"""
GTpath = "/home/jacopo/optimizer_ws/LinearRegression/GT/gt/"
ESTpath = "/home/jacopo/optimizer_ws/LinearRegression/GT/est"
GTFeatures = glob.glob(os.path.join(GTpath, '*'))
GTFeatures.sort(key=lambda x:[int(c) if c.isdigit() else c for c in re.split(r'(\d+)', x)]) # reading in alphabetic order
ESTFeatures = glob.glob(os.path.join(ESTpath, '*'))
ESTFeatures.sort(key=lambda x:[int(c) if c.isdigit() else c for c in re.split(r'(\d+)', x)]) # reading in alphabetic order

GTList = []
ESTList = []
for GTFeatures in GTFeatures:    
    File_data = np.loadtxt(GTFeatures, dtype=np.float32)
    GTList.append(File_data)

for ESTFeatures in ESTFeatures:    
    File_data = np.loadtxt(ESTFeatures, dtype=np.float32)
    ESTList.append(File_data)

FeaturesPath = "/home/jacopo/optimizer_ws/LinearRegression/WALLRegression/Features/"   # NN-estimation (inverse relative depth)
LabelsPath = "/home/jacopo/optimizer_ws/LinearRegression/WALLRegression/Labels/"     # LiDAR measurements (absolute inverse depth)
filesFeatures = glob.glob(os.path.join(FeaturesPath, '*'))
filesFeatures.sort(key=lambda x:[int(c) if c.isdigit() else c for c in re.split(r'(\d+)', x)]) # reading in alphabetic order
filesLabels = glob.glob(os.path.join(LabelsPath, '*'))
filesLabels.sort(key=lambda x:[int(c) if c.isdigit() else c for c in re.split(r'(\d+)', x)])
FeaturesList = []
LabelsList = []

for filenameFeatures in filesFeatures:    
    File_data = np.loadtxt(filenameFeatures, dtype=np.float32)
    FeaturesList.append(File_data)

for filenameLabels in filesLabels:    
    File_data = np.loadtxt(filenameLabels, dtype=np.float32)
    LabelsList.append(File_data)

# for k in range(len(FeaturesList)):
#     FeaturesList[k] = np.reciprocal(FeaturesList[k])
#     LabelsList[k] = np.reciprocal(LabelsList[k])
#     remotion = 0
#     for y in range(len(LabelsList[k])):
#         if(y < len(LabelsList[k])-remotion):
#             if(LabelsList[k][y] > 10):   # since indoor environment, max distance measurable is set to 10 meters
#                 LabelsList[k][y] = LabelsList[k][y-1]
                

for k in range(len(FeaturesList)):
    FeaturesList[k] = np.reciprocal(FeaturesList[k])
    LabelsList[k] = np.reciprocal(LabelsList[k])
    remotion = 0
    for y in range(len(LabelsList[k])):
        if(y < len(LabelsList[k])-remotion):
            if(LabelsList[k][y] > 10):   # since indoor environment, max distance measurable is set to 10 meters
                LabelsList[k] = np.delete(LabelsList[k], y)
                FeaturesList[k] = np.delete(FeaturesList[k], y)
    #comment this two line for using direct depth method 
    FeaturesList[k] = np.reciprocal(FeaturesList[k])
    LabelsList[k] = np.reciprocal(LabelsList[k])
    #conversion from inverse depth to direct depth; remove this part for working with inverse depth!

TRIGGER = False

def main(args):

    if(False):
        WList = []
        ## =============================================================================================== ##
        # HERE WE START THE PLOTTING CODE PART, AFTER THE CORRECT VARIABLE INITIALIZATION   
        # at first we set only one possibility for the feature vector; then we will extend it
        # through all the different data combination available
        error_list = []
        Label = []
        cout = 0
        error = 0
        count = 0

        accuracy = [25.36, 36.62, 46.51, 53.52, 63.38, 71.83, 76.07]
        distances = [0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4]

        for i in range(len(GTList[0])):
            if(abs(GTList[0][i] - ESTList[0][i])< 0.4):
                count += 1

            if(abs(GTList[0][i] - ESTList[0][i])< 0.6):
                error += abs(GTList[0][i] - ESTList[0][i])
                error_list.append(abs(GTList[0][i] - ESTList[0][i]))
                Label.append(GTList[0][i])
        print(error/len(error_list))

        index_list = np.argsort(Label)
        sorted_labels = np.sort(Label)
        error_list_sorted = [error_list[i] for i in index_list]
        
        fig, ax = plt.subplots()
        string = "Absolute error behavior vs distance measurements"
        ax.set_title(string)
        
        x = np.array(sorted_labels).reshape((-1,1))
        y = np.array(error_list_sorted).reshape((-1,1))
        ax.scatter(x,y, color="blue", alpha= 0.4, label="abs error datapoints")
        plt.axhline(y=error/len(error_list), color='r', linestyle='--', alpha=0.4, label= "average abs error")
        ax.plot(x,y, color="orange", alpha= 0.3)
        ax.grid(True)
        plt.xlabel("absolute depth [m]")
        plt.ylabel("absolute error [m]")
        plt.xlim(min(x),max(x))
        plt.ylim(min(y),max(y))
        save_path = "/home/jacopo/optimizer_ws/LinearRegression/thesis_plot/error_line_NEWPLOT.png"
        ax.legend()
        plt.savefig(save_path)
        plt.close()

        # generate some statistic about the error found!!

    # absolute scale
    if(False):
        for i in range(len(FeaturesList)):
            cout += 1
            x = FeaturesList[i]                                        # here we have saved the features and labels information 
            y = LabelsList[i]                                          # as direct depth, for camera position 8
            x = np.array(x).reshape((-1,1))
            y = np.array(y).reshape((-1,1))
            w_pred, timeTaken, r_square = LinearRegressionNP(x, y)
            WList.append(w_pred)
            fig, ax = plt.subplots()
            scale = 10
            ax.scatter(x,y,c="blue",s=scale, label="datapoints",alpha=0.1, edgecolor=None)
            ax.grid(True)
            plt.xlabel("Midas-NN estimation - relative depth")
            plt.ylabel("Lidar measurements - absolute depth [m]")
            plt.xlim(min(x),max(x))
            plt.ylim(min(y), max(y))
            string = "plot with " + str(x.shape[0]) + " features-labels corrispondence"
            ax.set_title(string)
            save_path = "/home/jacopo/optimizer_ws/LinearRegression/thesis_plot/" + str(cout) + ".png"
            xPotLine= np.linspace(min(x),max(x),500)
            yPlotLine = w_pred[0]*xPotLine+w_pred[1]
            #print("linear regression with: ", x.shape[0])
            plt.plot(xPotLine, yPlotLine,c="orange", alpha=0.8, label='regression line')
            ax.legend()
            plt.savefig(save_path)
            plt.close()
            #print("plot saved correctly for set: ", i)
            if(cout > 1 and cout < len(FeaturesList)):
                variation = WList[cout-1]-WList[cout-2]
                #print("variation between set",cout-1,",",cout,": ", variation)
            print("elaborated plot: ", cout)
        
        # output = scaler.inverse_transform(output)
        fig1, ax1 = plt.subplots()
        alpha = 0.1 
        if(False):
            for i in range(len(WList)):
                
                xPlotLine= np.linspace(min(x),max(x),100)
                w_pred = WList[i]
                yPlotLine = w_pred[0]*xPotLine+w_pred[1]
                ax1.grid(True)
                plt.xlim(min(xPlotLine),max(xPlotLine))
                plt.ylim(min(yPlotLine),max(yPlotLine))
                string  = "W convergence"
                plt.xlabel("Midas-NN estimation - relative depth")
                plt.ylabel("Lidar measurements - absolute depth")
                ax1.set_title(string)
                color = "gray" 

                if(i == len(WList)-1):
                    alpha = 0.5
                    color = "red"
                    linewidth = 2
                    label = "final regression line"
                    plt.plot(xPotLine, yPlotLine, c=color, alpha=alpha, linewidth=linewidth, label=label)
                    
                elif(i == 1 or i == 5 or i == 7 or i == 8):
                    alpha += +0.03*i
                    color = "gray"
                    linewidth = 3
                    label = "regression it. n°" + str(i+1)
                    plt.plot(xPotLine, yPlotLine, c=color, alpha=alpha, linewidth=linewidth, label=label)
                    
            ax1.legend()  
            save_path = "/home/jacopo/optimizer_ws/LinearRegression/thesis_plot/Convergence.png"  
            plt.savefig(save_path)
            plt.close()
        std = []
        y = np.array(LabelsList[9]).reshape((-1,1))
        w_pred = WList[len(WList)-1]
        for k in range(len(FeaturesList[9])):
            y_linear_regre# ax.plot(x, y, color="magenta", alpha = 0.6, label="3rd scan")
        

        fig, ax = plt.subplots()
        x = np.array(FeaturesList[0]).reshape((-1,1)) 
        y = np.array(std[0:250]).reshape((-1,1))
        print(x)
        # plt.xlabel("MiDAS depth estimation")
        # plt.ylabel("std deviation of MiDAS wrt Linear regression")
        # string = "std deviation of CNN estimation - single scan"
        # ax.set_title(string)
        # save_path = "/home/jacopo/optimizer_ws/LinearRegression/thesis_plot/std_single_scan.png"
        # ax.legend()
        # plt.savefig(save_path)
        # plt.close()


        # fig, ax = plt.subplots()   PLOT FOR 4 SCANS AND RELATIVE STANDARD DEVIATION
        
            
        # x = np.array(FeaturesList[9][0: 128]).reshape((-1,1)) 
        # y =  np.array(std[0 : 128]).reshape((-1,1))
        # ax.plot(x, y, color="blue", alpha = 0.6)

        # x = np.array(FeaturesList[9][130: 250]).reshape((-1,1)) 
        # y =  np.array(std[130 : 250]).reshape((-1,1))
        # ax.plot(x, y, color="blue", alpha = 0.6, label= "1st scan")

        # x = np.array(FeaturesList[9][249: 378]).reshape((-1,1)) 
        # y =  np.array(std[249 : 378]).reshape((-1,1))
        # ax.plot(x, y, color="orange", alpha = 0.6, label="2nd scan")

        # x = np.array(FeaturesList[9][380: 500]).reshape((-1,1)) 
        # y =  np.array(std[380 : 500]).reshape((-1,1))
        # ax.plot(x, y, color="orange", alpha = 0.6)

        # x = np.array(FeaturesList[9][499: 628]).reshape((-1,1)) 
        # y =  np.array(std[499 : 628]).reshape((-1,1))
        # ax.plot(x, y, color="magenta", alpha = 0.6, label="3rd scan")

        # x = np.array(FeaturesList[9][630: 750]).reshape((-1,1)) 
        # y =  np.array(std[630 : 750]).reshape((-1,1))
        # ax.plot(x, y, color="magenta", alpha = 0.6)

        # x = np.array(FeaturesList[9][749: 878]).reshape((-1,1)) 
        # y =  np.array(std[749 : 878]).reshape((-1,1))
        # ax.plot(x, y, color="green", alpha = 0.6, label="4th scan")

        # x = np.array(FeaturesList[9][880: 1000]).reshape((-1,1)) 
        # y =  np.array(std[880 : 1000]).reshape((-1,1))
        # ax.plot(x, y, color="green", alpha = 0.6)

        # ax.grid(True)
        # plt.xlabel("MiDAS depth estimation")
        # plt.ylabel("std deviation of MiDAS wrt Linear regression")
        # string = "std deviation of CNN estimation"
        # ax.set_title(string)
        # save_path = "/home/jacopo/optimizer_ws/LinearRegression/thesis_plot/standard_deviation_line.png"
        # ax.legend()
        # plt.savefig(save_path)
        # plt.close()


        if(TRIGGER):
            # plot of lidar variation
            average = []
            sum = 0
            # plotting the deviation of Lidar measurements!
            print(len(LabelsList[9]))
            for k in range(250):
                for t in range(10):
                    sum += LabelsList[9][k+t*250] 
                    if(k == 249):
                        print(LabelsList[9][k+t*250])
                sum = sum/10
                average.append(sum)
                sum = 0
            
            x =  np.array(LabelsList[9]).reshape((-1,1)) 

            for f in range(250):
                for k in range(10):
                    LabelsList[9][f+k*250] = LabelsList[9][f+k*250] - average[f]
                    
            y =  np.array(LabelsList[9]).reshape((-1,1))
            fig, ax = plt.subplots()
            scale = 10
            ax.scatter(x,y,c="blue",s=scale, label="datapoints",alpha=0.1, edgecolor=None)
            ax.grid(True)
            plt.xlabel("Lidar measurements - absolute depth")
            plt.ylabel("Variation wrt average values")
            plt.xlim(min(x),max(x))
            plt.ylim(min(y), max(y))
            string = "plot of Lidar measurements variation - 10 scan"
            ax.set_title(string)
            save_path = "/home/jacopo/optimizer_ws/LinearRegression/thesis_plot/variation_LiDAR.png"
            ax.legend()
            plt.savefig(save_path)
            plt.close()
    
    fig, ax = plt.subplots()
    ax.grid(True)
    plt.xlabel("Midas-NN estimation - inverse relative depth")
    plt.ylabel("Lidar measurements - inverse absolute depth [m]")
    xPotLine= np.linspace(0,0.45,500)
    yPlotLine = 0.00740249*xPotLine+0.26262971    #1
    yPlotLine = 0.01452822*xPotLine+0.22766054
    plt.xlim(min(xPotLine),max(xPotLine))
    plt.ylim(min(yPlotLine),max(yPlotLine))
    save_path = "/home/jacopo/Desktop/w_convergence_general"
    # #print("linear regression with: ", x.shape[0])
    # plt.plot(xPotLine, yPlotLine,c="gray", alpha=0.2, label='it. 1')
    # yPlotLine = 0.00834578*xPotLine+0.24987154    #4
    # plt.plot(xPotLine, yPlotLine,c="gray", alpha=0.2, label='it. 4')
    # yPlotLine = 0.00454363*xPotLine+0.30077808    #6
    # plt.plot(xPotLine, yPlotLine,c="gray", alpha=0.2, label='it. 6')
    # yPlotLine = 0.01190554*xPotLine+0.24317825 
    # plt.plot(xPotLine, yPlotLine,c="gray", alpha=0.2, label='it. 8')
    
    plt.plot(xPotLine, yPlotLine,c="red", alpha=0.8, label='it. 9')
    ax.legend()
    plt.savefig(save_path)
    plt.close()

    
if __name__ == "__main__":
    main(sys.argv)





# [array([[0.00740249],
#        [0.26262971]]),     #1
# array([[0.0038435 ],
#        [0.28497299]]),     #2
# array([[0.00402182],
#        [0.28671352]]),     #3
# array([[0.00834578],
#        [0.24987154]]),     #4
# array([[0.00819065],
#        [0.25831646]]),     #5
# array([[0.00454363],
#        [0.30077808]]),     #6
# array([[0.00963488],
#        [0.26021846]]),     #7
# array([[0.01190554],
#        [0.24317825]]),     #8
# array([[0.01452822],
#        [0.22766054]])]     #9