;; Auto-generated. Do not edit!


(when (boundp 'optimizer::FloatList)
  (if (not (find-package "OPTIMIZER"))
    (make-package "OPTIMIZER"))
  (shadow 'FloatList (find-package "OPTIMIZER")))
(unless (find-package "OPTIMIZER::FLOATLIST")
  (make-package "OPTIMIZER::FLOATLIST"))

(in-package "ROS")
;;//! \htmlinclude FloatList.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass optimizer::FloatList
  :super ros::object
  :slots (_header _elements _RGBImage ))

(defmethod optimizer::FloatList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:elements __elements) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:RGBImage __RGBImage) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _elements __elements)
   (setq _RGBImage __RGBImage)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:elements
   (&optional __elements)
   (if __elements (setq _elements __elements)) _elements)
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
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _elements
    (* 4    (length _elements)) 4
    ;; sensor_msgs/CompressedImage _RGBImage
    (send _RGBImage :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _elements
     (write-long (length _elements) s)
     (dotimes (i (length _elements))
       (sys::poke (elt _elements i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; sensor_msgs/CompressedImage _RGBImage
       (send _RGBImage :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _elements
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _elements (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _elements i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; sensor_msgs/CompressedImage _RGBImage
     (send _RGBImage :deserialize buf ptr-) (incf ptr- (send _RGBImage :serialization-length))
   ;;
   self)
  )

(setf (get optimizer::FloatList :md5sum-) "aa0ffa7ee0c8405a53af12a7ef35f8ad")
(setf (get optimizer::FloatList :datatype-) "optimizer/FloatList")
(setf (get optimizer::FloatList :definition-)
      "Header header
float32[] elements
sensor_msgs/CompressedImage RGBImage

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



(provide :optimizer/FloatList "aa0ffa7ee0c8405a53af12a7ef35f8ad")


