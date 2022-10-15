#!/usr/bin/env python3

from utils_functions import *

"""
    Script that was used in orther to save reuslts of LSD-slam for a single run
    in orther to reply them in an offline manner, so as to concentrte only into the 
    linear regression part
"""

LSDList = []
VARList = []
count = 0
print("node ready!")

class LSDRetrival:

    def __init__(self):

        self.image_sub = message_filters.Subscriber(
            "/lsd_slam/Colored_image", ColoredImageMsg, queue_size=1)
        self.image_sub.registerCallback(self.callback)
    
    def callback(self, msg):
        global LSDList, VARList, count
        count += 1

        if(count < 100):
            
            text_file = "/home/slamlaboratory/optimizer_ws/KeyframesMaps/"
            if(msg.coloredImage.header.seq < 100):
                number = "000" + str(msg.coloredImage.header.seq)
            elif(msg.coloredImage.header.seq < 1000 and msg.coloredImage.header.seq >= 100):
                number = "00" + str(msg.coloredImage.header.seq)
            elif(msg.coloredImage.header.seq < 10000 and msg.coloredImage.header.seq >= 1000):
                number = "0" + str(msg.coloredImage.header.seq)
            else:
                number = str(msg.coloredImage.header.seq)
            text_fileLSD = text_file + "LSD/keyframe_" + str(count) + "_frame_" + number + ".txt" 
            text_fileVAR = text_file + "VAR/keyframe_" + str(count) + "_frame_" + number + ".txt"
            LSDMap = np.array(msg.LSD_map, np.float32)
            VARMap = np.array(msg.Var_map, np.float32)

            with open(text_fileLSD,"w+") as f:
                np.savetxt(f, LSDMap)
                f.close()
            
            with open(text_fileVAR,"w+") as v:
                np.savetxt(v, VARMap)
                v.close()

            print("maps stored for keyframe ", count)


def main(args):
    
    rospy.init_node('LSDRetrival', anonymous=True)
    ic = LSDRetrival()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS NN estimation module")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)