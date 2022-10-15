;; Auto-generated. Do not edit!


(when (boundp 'optimizer::keyframeMsgModified)
  (if (not (find-package "OPTIMIZER"))
    (make-package "OPTIMIZER"))
  (shadow 'keyframeMsgModified (find-package "OPTIMIZER")))
(unless (find-package "OPTIMIZER::KEYFRAMEMSGMODIFIED")
  (make-package "OPTIMIZER::KEYFRAMEMSGMODIFIED"))

(in-package "ROS")
;;//! \htmlinclude keyframeMsgModified.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass optimizer::keyframeMsgModified
  :super ros::object
  :slots (_id _time _isKeyframe _coloredImage _camToWorld _fx _fy _cx _cy _height _width _pointcloud ))

(defmethod optimizer::keyframeMsgModified
  (:init
   (&key
    ((:id __id) 0)
    ((:time __time) 0.0)
    ((:isKeyframe __isKeyframe) nil)
    ((:coloredImage __coloredImage) (instance sensor_msgs::Image :init))
    ((:camToWorld __camToWorld) (make-array 7 :initial-element 0.0 :element-type :float))
    ((:fx __fx) 0.0)
    ((:fy __fy) 0.0)
    ((:cx __cx) 0.0)
    ((:cy __cy) 0.0)
    ((:height __height) 0)
    ((:width __width) 0)
    ((:pointcloud __pointcloud) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _time (float __time))
   (setq _isKeyframe __isKeyframe)
   (setq _coloredImage __coloredImage)
   (setq _camToWorld __camToWorld)
   (setq _fx (float __fx))
   (setq _fy (float __fy))
   (setq _cx (float __cx))
   (setq _cy (float __cy))
   (setq _height (round __height))
   (setq _width (round __width))
   (setq _pointcloud __pointcloud)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:isKeyframe
   (&optional (__isKeyframe :null))
   (if (not (eq __isKeyframe :null)) (setq _isKeyframe __isKeyframe)) _isKeyframe)
  (:coloredImage
   (&rest __coloredImage)
   (if (keywordp (car __coloredImage))
       (send* _coloredImage __coloredImage)
     (progn
       (if __coloredImage (setq _coloredImage (car __coloredImage)))
       _coloredImage)))
  (:camToWorld
   (&optional __camToWorld)
   (if __camToWorld (setq _camToWorld __camToWorld)) _camToWorld)
  (:fx
   (&optional __fx)
   (if __fx (setq _fx __fx)) _fx)
  (:fy
   (&optional __fy)
   (if __fy (setq _fy __fy)) _fy)
  (:cx
   (&optional __cx)
   (if __cx (setq _cx __cx)) _cx)
  (:cy
   (&optional __cy)
   (if __cy (setq _cy __cy)) _cy)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:pointcloud
   (&optional __pointcloud)
   (if __pointcloud (setq _pointcloud __pointcloud)) _pointcloud)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; float64 _time
    8
    ;; bool _isKeyframe
    1
    ;; sensor_msgs/Image _coloredImage
    (send _coloredImage :serialization-length)
    ;; float32[7] _camToWorld
    (* 4    7)
    ;; float32 _fx
    4
    ;; float32 _fy
    4
    ;; float32 _cx
    4
    ;; float32 _cy
    4
    ;; uint32 _height
    4
    ;; uint32 _width
    4
    ;; uint8[] _pointcloud
    (* 1    (length _pointcloud)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _isKeyframe
       (if _isKeyframe (write-byte -1 s) (write-byte 0 s))
     ;; sensor_msgs/Image _coloredImage
       (send _coloredImage :serialize s)
     ;; float32[7] _camToWorld
     (dotimes (i 7)
       (sys::poke (elt _camToWorld i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _fx
       (sys::poke _fx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fy
       (sys::poke _fy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cx
       (sys::poke _cx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cy
       (sys::poke _cy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _height
       (write-long _height s)
     ;; uint32 _width
       (write-long _width s)
     ;; uint8[] _pointcloud
     (write-long (length _pointcloud) s)
     (princ _pointcloud s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _isKeyframe
     (setq _isKeyframe (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; sensor_msgs/Image _coloredImage
     (send _coloredImage :deserialize buf ptr-) (incf ptr- (send _coloredImage :serialization-length))
   ;; float32[7] _camToWorld
   (dotimes (i (length _camToWorld))
     (setf (elt _camToWorld i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _fx
     (setq _fx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fy
     (setq _fy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cx
     (setq _cx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cy
     (setq _cy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _pointcloud
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _pointcloud (make-array n :element-type :char))
     (replace _pointcloud buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get optimizer::keyframeMsgModified :md5sum-) "a426dd51d76b783b431104e7486ba4d6")
(setf (get optimizer::keyframeMsgModified :datatype-) "optimizer/keyframeMsgModified")
(setf (get optimizer::keyframeMsgModified :definition-)
      "int32 id
float64 time
bool isKeyframe
sensor_msgs/Image coloredImage
# camToWorld as serialization of sophus sim(3).
# may change with keyframeGraph-updates.
float32[7] camToWorld 


# camera parameter (fx fy cx cy), width, height
# will never change, but required for display.
float32 fx
float32 fy
float32 cx
float32 cy
uint32 height
uint32 width


# data as InputPointDense (float idepth, float idepth_var, uchar color[4]), width x height
# may be empty, in that case no associated pointcloud is ever shown.
uint8[] pointcloud

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

")



(provide :optimizer/keyframeMsgModified "a426dd51d76b783b431104e7486ba4d6")


