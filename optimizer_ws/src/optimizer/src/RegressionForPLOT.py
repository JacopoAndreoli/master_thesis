#!/usr/bin/env python3

from utils_functions import *
"""
    Script used for the plot over the features-labels information over data acquired
"""

FeaturesPath = "/home/slamlaboratory/optimizer_ws/LinearRegression/camera_position8_27PointsStraightDEPTH/FeaturesWrtGT/"
LabelsPath = "/home/slamlaboratory/optimizer_ws/LinearRegression/camera_position8_27PointsStraightDEPTH/LabelsWrtGT/"
filesFeatures = glob.glob(os.path.join(FeaturesPath, '*'))
filesFeatures.sort(key=lambda x:[int(c) if c.isdigit() else c for c in re.split(r'(\d+)', x)])
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

print("all data for Linear regression Loaded")


def main(args):

    WList = []
    ## =============================================================================================== ##
    # HERE WE START THE PLOTTING CODE PART, AFTER THE CORRECT VARIABLE INITIALIZATION   
    # at first we set only one possibility for the feature vector; then we will extend it
    # through all the different data combination available
    cout = 0
    # absolute scale
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
        plt.ylabel("Lidar measurements - absolute depth")
        plt.xlim(min(x),max(x))
        plt.ylim(min(y), max(y))
        string = "plot with " + str(x.shape[0]) + " features-labels corrispondence"
        ax.set_title(string)
        save_path = "/home/slamlaboratory/trial_result/plot" + str(cout) + ".png"
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
    for i in range(len(WList)):

        xPlotLine= np.linspace(min(x),max(x),100)
        w_pred = WList[i]
        yPlotLine = w_pred[0]*xPotLine+w_pred[1]
        ax1.grid(True)
        plt.xlim(min(xPlotLine),max(xPlotLine))
        plt.ylim(min(yPlotLine),max(yPlotLine))
        string  = "W convergence"
        ax1.set_title(string)
        
        if(i == len(WList)-1):
            alpha = 0.5
            color = "red"
            linewidth = 2
            label = "final regresion line"
        else:
            color = "gray"
            linewidth = 3
            label = "regression it. n°" + str(i+1)
        
        plt.plot(xPotLine, yPlotLine, c=color, alpha=alpha, linewidth=linewidth, label=label)
        alpha += 0.05

    ax1.legend()  
    save_path = "/home/slamlaboratory/trial_result/trialConvergence.png"  
    plt.savefig(save_path)
    plt.close()

    
if __name__ == "__main__":
    main(sys.argv)


