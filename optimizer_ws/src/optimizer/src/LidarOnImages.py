#!/usr/bin/env python3

from utils_functions import *
"""
    Script that is performing the projection of the lidar measurements over 
    the image plane associated to the camera. Refer to the /tf defined in the 
    text for recover the reference frame and the type of rototranslation derived
"""
DEBUG = False
COMPRESSED = True # compressed means take images from the raspicam node 

K = np.array([[506.933047262, 0.0, 321.4629011], 
    [0.0, 508.079839422, 243.86413906],
    [0.0, 0.0, 1.0]], np.float32)

Ideal = initializingTF()
print("Listener correctly initialized; ready for works")

class image_feature:

    def __init__(self):

        self.OpencvBridge = CvBridge()

        self.image_pub = rospy.Publisher(
            "/LidarOnImages/image/compressed", CompressedImage, queue_size=10)
    
        #NNPreProcessLight
        self.NNPreProcessLight = rospy.Publisher(
            "/NNestimation/NNPreProcessLight", NNPreProcessLight, queue_size=100)

        if(COMPRESSED):
            self.image_sub = message_filters.Subscriber(
            "/raspicam_node/image", Image, queue_size=10)
        else:
            self.image_sub = message_filters.Subscriber(
            "lsd_slam/instantKeyframe", Image, queue_size=1)

        self.scan_sub = message_filters.Subscriber("/scan", LaserScan, queue_size=5000)
        ts = message_filters.ApproximateTimeSynchronizer(
            [self.image_sub, self.scan_sub],5000, 0.1)
        ts.registerCallback(self.callback)


    def callback(self, image_sync, scan_sync):
        c1 = cv2.getTickCount()
       
        time_interval = abs(image_sync.header.stamp.to_sec()-scan_sync.header.stamp.to_sec())
        #print("\ntime interval between lidar and image: ", time_interval , "s")
        
# ============================================================================================================================= 
#       PART USED FOR READING THE IMAGE 

        
        original_image = self.OpencvBridge.imgmsg_to_cv2(image_sync, desired_encoding='passthrough')
        image_np = np.copy(original_image)
           
        # IN BOTH CASES "image_np" TURNS OUT TO BE A NP.NDARRAY
     
# ==============================================================================================================================
#       FILTERING THE SCAN INFORMATION AND RECOVERING VECTOR OF MEASUREMENTS
        ranges = self.range_filter(scan_sync) 
        
        #if(COMPRESSED):
        stamp = image_sync.header.stamp
        seq = image_sync.header.seq           # useless the seq information
        # else:
        #     stamp = image_sync.coloredImage.header.stamp
        #     seq = image_sync.coloredImage.header.seq

        image_circle,ArrayMsg = self.lidar_data_to_img(ranges, image_np, stamp, seq)
        image_np = cv2.cvtColor(image_np, cv2.COLOR_BGR2RGB)  
        msgToSend = AddingCOMPRESSEDToMsg(ArrayMsg, stamp, seq, original_image)     
        msgToSend.headerScan.stamp = scan_sync.header.stamp
        msgToSend.headerScan.seq = scan_sync.header.seq
        msg = publishingImage(image_circle, stamp, seq)
        self.image_pub.publish(msg)
        self.NNPreProcessLight.publish(msgToSend)
        #print("data sent") 
        c2 = cv2.getTickCount() 
        time_taken = (c2 - c1)/ cv2.getTickFrequency() 
        print(time_taken)
           
       
    
    # Filters impossible ranges and combines it with angle data
    def range_filter(self, scan_sync):

        range_data = np.array(scan_sync.ranges, np.float32)
        angle_min = scan_sync.angle_min
        angle_max = scan_sync.angle_max
        range_min = scan_sync.range_min
        range_max = scan_sync.range_max
        angle_increment = scan_sync.angle_increment
        N = int((angle_max-angle_min)/angle_increment)
        angle_data = np.linspace(angle_min, angle_max, num=(N+1)) + math.pi
        ranges = np.array([range_data, angle_data], np.float32)
        ranges[0, ranges[0, :] > range_max] = range_max
        ranges[0, ranges[0, :] < range_min] = range_min
        return ranges

    # Converts lidar range data to XYZ coordinates and then projects it to the camera image plane
    def lidar_data_to_img(self, ranges, image_np, header_stamp, header_seq):

        U = 640  # Horizontal number of pixels
        V = 480  # Vertical number of pixels of the camera sensor

        image_height, image_width, rgb = image_np.shape
        bool_vector = np.zeros((image_width,1), bool)
        Points_laser = np.array([(np.multiply(np.sin(ranges[1, :]), ranges[0, :])),
                    np.zeros(len(ranges[0, :])),
                    np.multiply(np.cos(ranges[1, :]), ranges[0, :]), np.ones(len(ranges[0, :]))], np.float32)

        # Rotation matrix of the lidar regarding the camera position
        Points_cam_modified = Ideal.dot(Points_laser)            
        Pc = Points_cam_modified[0:3]
        P = K.dot(Pc)
        
        UV = np.array([np.divide(P[0, :], P[2, :]),
                    np.divide(P[1, :], P[2, :])], np.float32)
        bool_vector = np.full((1, U), False)
        float_array = NNPreProcessLight()
       

        for i in range(len(UV[0, :])):
            u = UV[0, i]
            v = UV[1, i]
            float_list = Vector3()
            
            #image_np[:, 320] = [255, 255, 255]
    
            u_real = valmap(u, 0, U, 0, image_width)
            v_real = valmap(v, 0, V, 0, image_height)
            u_mod = int(correctionFactor(int(u_real),U,V))
            max_dist = 3

            if (u_mod  < U) and (v_real < V):
                if (u_mod  >= 0) and (v_real >= 0) and (P[2, i] >= 0):

                    if(not bool_vector[0][u_mod]):
                        
                        bool_vector[0][u_mod] = True
                        dist = ranges[0, i]
                        u_mod = int(u_mod)
                        v_real = int(v_real)

                        if(not(u_mod <= U and v <= V)):
                            continue
                        
                        #changing only the red channel
                        if(dist >= max_dist):
                            cv2.circle(image_np, (u_mod, v_real),
                            1, (0, 0, 255), -1)
                        else:
                            green_color = int((255*dist)/max_dist)
                            cv2.circle(image_np, (u_mod, v_real),
                            1, (255-green_color, green_color, 0), -1)

                        float_list.x = float(u_mod)
                        float_list.y = float(v_real)
                        float_list.z = float(dist)
                        float_array.vector.append(float_list)
                         
        float_array.header.stamp = header_stamp
        float_array.header.seq = header_seq

        return image_np, float_array

    

def main(args):
    
    rospy.init_node('LidarOnImages', anonymous=True)
    ic = image_feature()
    
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS Image feature detector module")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)