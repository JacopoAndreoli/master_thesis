;; Auto-generated. Do not edit!


(when (boundp 'pcl_handler::ThreeMap)
  (if (not (find-package "PCL_HANDLER"))
    (make-package "PCL_HANDLER"))
  (shadow 'ThreeMap (find-package "PCL_HANDLER")))
(unless (find-package "PCL_HANDLER::THREEMAP")
  (make-package "PCL_HANDLER::THREEMAP"))

(in-package "ROS")
;;//! \htmlinclude ThreeMap.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pcl_handler::ThreeMap
  :super ros::object
  :slots (_header _Var_map _LSD_map _coloredImage _cameraMatrix _RotationMatrix _translationVector ))

(defmethod pcl_handler::ThreeMap
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Var_map __Var_map) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:LSD_map __LSD_map) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:coloredImage __coloredImage) (instance sensor_msgs::Image :init))
    ((:cameraMatrix __cameraMatrix) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:RotationMatrix __RotationMatrix) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:translationVector __translationVector) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _Var_map __Var_map)
   (setq _LSD_map __LSD_map)
   (setq _coloredImage __coloredImage)
   (setq _cameraMatrix __cameraMatrix)
   (setq _RotationMatrix __RotationMatrix)
   (setq _translationVector __translationVector)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:Var_map
   (&optional __Var_map)
   (if __Var_map (setq _Var_map __Var_map)) _Var_map)
  (:LSD_map
   (&optional __LSD_map)
   (if __LSD_map (setq _LSD_map __LSD_map)) _LSD_map)
  (:coloredImage
   (&rest __coloredImage)
   (if (keywordp (car __coloredImage))
       (send* _coloredImage __coloredImage)
     (progn
       (if __coloredImage (setq _coloredImage (car __coloredImage)))
       _coloredImage)))
  (:cameraMatrix
   (&optional __cameraMatrix)
   (if __cameraMatrix (setq _cameraMatrix __cameraMatrix)) _cameraMatrix)
  (:RotationMatrix
   (&optional __RotationMatrix)
   (if __RotationMatrix (setq _RotationMatrix __RotationMatrix)) _RotationMatrix)
  (:translationVector
   (&optional __translationVector)
   (if __translationVector (setq _translationVector __translationVector)) _translationVector)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _Var_map
    (* 4    (length _Var_map)) 4
    ;; float32[] _LSD_map
    (* 4    (length _LSD_map)) 4
    ;; sensor_msgs/Image _coloredImage
    (send _coloredImage :serialization-length)
    ;; float32[] _cameraMatrix
    (* 4    (length _cameraMatrix)) 4
    ;; float32[] _RotationMatrix
    (* 4    (length _RotationMatrix)) 4
    ;; float32[] _translationVector
    (* 4    (length _translationVector)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _Var_map
     (write-long (length _Var_map) s)
     (dotimes (i (length _Var_map))
       (sys::poke (elt _Var_map i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _LSD_map
     (write-long (length _LSD_map) s)
     (dotimes (i (length _LSD_map))
       (sys::poke (elt _LSD_map i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; sensor_msgs/Image _coloredImage
       (send _coloredImage :serialize s)
     ;; float32[] _cameraMatrix
     (write-long (length _cameraMatrix) s)
     (dotimes (i (length _cameraMatrix))
       (sys::poke (elt _cameraMatrix i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _RotationMatrix
     (write-long (length _RotationMatrix) s)
     (dotimes (i (length _RotationMatrix))
       (sys::poke (elt _RotationMatrix i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _translationVector
     (write-long (length _translationVector) s)
     (dotimes (i (length _translationVector))
       (sys::poke (elt _translationVector i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _Var_map
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Var_map (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _Var_map i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _LSD_map
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _LSD_map (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _LSD_map i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; sensor_msgs/Image _coloredImage
     (send _coloredImage :deserialize buf ptr-) (incf ptr- (send _coloredImage :serialization-length))
   ;; float32[] _cameraMatrix
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cameraMatrix (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cameraMatrix i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _RotationMatrix
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _RotationMatrix (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _RotationMatrix i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _translationVector
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _translationVector (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _translationVector i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get pcl_handler::ThreeMap :md5sum-) "35eb6653c31b68cb2b3203e9acd1f9e4")
(setf (get pcl_handler::ThreeMap :datatype-) "pcl_handler/ThreeMap")
(setf (get pcl_handler::ThreeMap :definition-)
      "Header header 
float32[] Var_map
float32[] LSD_map
sensor_msgs/Image coloredImage
float32[] cameraMatrix
float32[] RotationMatrix
float32[] translationVector


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

")



(provide :pcl_handler/ThreeMap "35eb6653c31b68cb2b3203e9acd1f9e4")


