;; Auto-generated. Do not edit!


(when (boundp 'pcl_handler::ColoredImageMsg)
  (if (not (find-package "PCL_HANDLER"))
    (make-package "PCL_HANDLER"))
  (shadow 'ColoredImageMsg (find-package "PCL_HANDLER")))
(unless (find-package "PCL_HANDLER::COLOREDIMAGEMSG")
  (make-package "PCL_HANDLER::COLOREDIMAGEMSG"))

(in-package "ROS")
;;//! \htmlinclude ColoredImageMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pcl_handler::ColoredImageMsg
  :super ros::object
  :slots (_header _coloredImage _POSE _LSD_map _Var_map ))

(defmethod pcl_handler::ColoredImageMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:coloredImage __coloredImage) (instance sensor_msgs::Image :init))
    ((:POSE __POSE) (instance geometry_msgs::PoseStamped :init))
    ((:LSD_map __LSD_map) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:Var_map __Var_map) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _coloredImage __coloredImage)
   (setq _POSE __POSE)
   (setq _LSD_map __LSD_map)
   (setq _Var_map __Var_map)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:coloredImage
   (&rest __coloredImage)
   (if (keywordp (car __coloredImage))
       (send* _coloredImage __coloredImage)
     (progn
       (if __coloredImage (setq _coloredImage (car __coloredImage)))
       _coloredImage)))
  (:POSE
   (&rest __POSE)
   (if (keywordp (car __POSE))
       (send* _POSE __POSE)
     (progn
       (if __POSE (setq _POSE (car __POSE)))
       _POSE)))
  (:LSD_map
   (&optional __LSD_map)
   (if __LSD_map (setq _LSD_map __LSD_map)) _LSD_map)
  (:Var_map
   (&optional __Var_map)
   (if __Var_map (setq _Var_map __Var_map)) _Var_map)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/Image _coloredImage
    (send _coloredImage :serialization-length)
    ;; geometry_msgs/PoseStamped _POSE
    (send _POSE :serialization-length)
    ;; float32[] _LSD_map
    (* 4    (length _LSD_map)) 4
    ;; float32[] _Var_map
    (* 4    (length _Var_map)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/Image _coloredImage
       (send _coloredImage :serialize s)
     ;; geometry_msgs/PoseStamped _POSE
       (send _POSE :serialize s)
     ;; float32[] _LSD_map
     (write-long (length _LSD_map) s)
     (dotimes (i (length _LSD_map))
       (sys::poke (elt _LSD_map i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _Var_map
     (write-long (length _Var_map) s)
     (dotimes (i (length _Var_map))
       (sys::poke (elt _Var_map i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/Image _coloredImage
     (send _coloredImage :deserialize buf ptr-) (incf ptr- (send _coloredImage :serialization-length))
   ;; geometry_msgs/PoseStamped _POSE
     (send _POSE :deserialize buf ptr-) (incf ptr- (send _POSE :serialization-length))
   ;; float32[] _LSD_map
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _LSD_map (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _LSD_map i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _Var_map
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Var_map (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _Var_map i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get pcl_handler::ColoredImageMsg :md5sum-) "4c222e02e39b32be1aab36e1c565a823")
(setf (get pcl_handler::ColoredImageMsg :datatype-) "pcl_handler/ColoredImageMsg")
(setf (get pcl_handler::ColoredImageMsg :definition-)
      "Header header
sensor_msgs/Image coloredImage
geometry_msgs/PoseStamped POSE
float32[] LSD_map
float32[] Var_map

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :pcl_handler/ColoredImageMsg "4c222e02e39b32be1aab36e1c565a823")


