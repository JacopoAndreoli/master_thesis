;; Auto-generated. Do not edit!


(when (boundp 'pcl_handler::NNPreProcessLight)
  (if (not (find-package "PCL_HANDLER"))
    (make-package "PCL_HANDLER"))
  (shadow 'NNPreProcessLight (find-package "PCL_HANDLER")))
(unless (find-package "PCL_HANDLER::NNPREPROCESSLIGHT")
  (make-package "PCL_HANDLER::NNPREPROCESSLIGHT"))

(in-package "ROS")
;;//! \htmlinclude NNPreProcessLight.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pcl_handler::NNPreProcessLight
  :super ros::object
  :slots (_vector _header _RGBImage ))

(defmethod pcl_handler::NNPreProcessLight
  (:init
   (&key
    ((:vector __vector) ())
    ((:header __header) (instance std_msgs::Header :init))
    ((:RGBImage __RGBImage) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _vector __vector)
   (setq _header __header)
   (setq _RGBImage __RGBImage)
   self)
  (:vector
   (&rest __vector)
   (if (keywordp (car __vector))
       (send* _vector __vector)
     (progn
       (if __vector (setq _vector (car __vector)))
       _vector)))
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:RGBImage
   (&rest __RGBImage)
   (if (keywordp (car __RGBImage))
       (send* _RGBImage __RGBImage)
     (progn
       (if __RGBImage (setq _RGBImage (car __RGBImage)))
       _RGBImage)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3[] _vector
    (apply #'+ (send-all _vector :serialization-length)) 4
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/CompressedImage _RGBImage
    (send _RGBImage :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3[] _vector
     (write-long (length _vector) s)
     (dolist (elem _vector)
       (send elem :serialize s)
       )
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/CompressedImage _RGBImage
       (send _RGBImage :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3[] _vector
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vector (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _vector)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/CompressedImage _RGBImage
     (send _RGBImage :deserialize buf ptr-) (incf ptr- (send _RGBImage :serialization-length))
   ;;
   self)
  )

(setf (get pcl_handler::NNPreProcessLight :md5sum-) "de922429bcb55d706bc2e38daa8f534b")
(setf (get pcl_handler::NNPreProcessLight :datatype-) "pcl_handler/NNPreProcessLight")
(setf (get pcl_handler::NNPreProcessLight :definition-)
      "geometry_msgs/Vector3[] vector
Header header
sensor_msgs/CompressedImage RGBImage

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
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
MSG: sensor_msgs/CompressedImage
# This message contains a compressed image

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image

string format        # Specifies the format of the data
                     #   Acceptable values:
                     #     jpeg, png
uint8[] data         # Compressed image buffer

")



(provide :pcl_handler/NNPreProcessLight "de922429bcb55d706bc2e38daa8f534b")


