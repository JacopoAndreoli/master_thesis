;; Auto-generated. Do not edit!


(when (boundp 'pcl_handler::FloatArray)
  (if (not (find-package "PCL_HANDLER"))
    (make-package "PCL_HANDLER"))
  (shadow 'FloatArray (find-package "PCL_HANDLER")))
(unless (find-package "PCL_HANDLER::FLOATARRAY")
  (make-package "PCL_HANDLER::FLOATARRAY"))

(in-package "ROS")
;;//! \htmlinclude FloatArray.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pcl_handler::FloatArray
  :super ros::object
  :slots (_header _vector ))

(defmethod pcl_handler::FloatArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vector __vector) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _vector __vector)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vector
   (&rest __vector)
   (if (keywordp (car __vector))
       (send* _vector __vector)
     (progn
       (if __vector (setq _vector (car __vector)))
       _vector)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3[] _vector
    (apply #'+ (send-all _vector :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3[] _vector
     (write-long (length _vector) s)
     (dolist (elem _vector)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3[] _vector
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vector (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _vector)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pcl_handler::FloatArray :md5sum-) "7b324c7325e683bf02a9b14b01090ec7")
(setf (get pcl_handler::FloatArray :datatype-) "pcl_handler/FloatArray")
(setf (get pcl_handler::FloatArray :definition-)
      "Header header
geometry_msgs/Vector3[] vector

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
")



(provide :pcl_handler/FloatArray "7b324c7325e683bf02a9b14b01090ec7")


