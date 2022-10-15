; Auto-generated. Do not edit!


(cl:in-package optimizer-msg)


;//! \htmlinclude NNPreProcessLight.msg.html

(cl:defclass <NNPreProcessLight> (roslisp-msg-protocol:ros-message)
  ((vector
    :reader vector
    :initarg :vector
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3)))
   (header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (headerScan
    :reader headerScan
    :initarg :headerScan
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (RGBImage
    :reader RGBImage
    :initarg :RGBImage
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage)))
)

(cl:defclass NNPreProcessLight (<NNPreProcessLight>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NNPreProcessLight>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NNPreProcessLight)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name optimizer-msg:<NNPreProcessLight> is deprecated: use optimizer-msg:NNPreProcessLight instead.")))

(cl:ensure-generic-function 'vector-val :lambda-list '(m))
(cl:defmethod vector-val ((m <NNPreProcessLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:vector-val is deprecated.  Use optimizer-msg:vector instead.")
  (vector m))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <NNPreProcessLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:header-val is deprecated.  Use optimizer-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'headerScan-val :lambda-list '(m))
(cl:defmethod headerScan-val ((m <NNPreProcessLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:headerScan-val is deprecated.  Use optimizer-msg:headerScan instead.")
  (headerScan m))

(cl:ensure-generic-function 'RGBImage-val :lambda-list '(m))
(cl:defmethod RGBImage-val ((m <NNPreProcessLight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:RGBImage-val is deprecated.  Use optimizer-msg:RGBImage instead.")
  (RGBImage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NNPreProcessLight>) ostream)
  "Serializes a message object of type '<NNPreProcessLight>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vector))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'headerScan) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RGBImage) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NNPreProcessLight>) istream)
  "Deserializes a message object of type '<NNPreProcessLight>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vector) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vector)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'headerScan) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RGBImage) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NNPreProcessLight>)))
  "Returns string type for a message object of type '<NNPreProcessLight>"
  "optimizer/NNPreProcessLight")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NNPreProcessLight)))
  "Returns string type for a message object of type 'NNPreProcessLight"
  "optimizer/NNPreProcessLight")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NNPreProcessLight>)))
  "Returns md5sum for a message object of type '<NNPreProcessLight>"
  "61ad2ac8e21a73b941594a3472729661")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NNPreProcessLight)))
  "Returns md5sum for a message object of type 'NNPreProcessLight"
  "61ad2ac8e21a73b941594a3472729661")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NNPreProcessLight>)))
  "Returns full string definition for message of type '<NNPreProcessLight>"
  (cl:format cl:nil "geometry_msgs/Vector3[] vector~%Header header~%Header headerScan~%sensor_msgs/CompressedImage RGBImage~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NNPreProcessLight)))
  "Returns full string definition for message of type 'NNPreProcessLight"
  (cl:format cl:nil "geometry_msgs/Vector3[] vector~%Header header~%Header headerScan~%sensor_msgs/CompressedImage RGBImage~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NNPreProcessLight>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'headerScan))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RGBImage))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NNPreProcessLight>))
  "Converts a ROS message object to a list"
  (cl:list 'NNPreProcessLight
    (cl:cons ':vector (vector msg))
    (cl:cons ':header (header msg))
    (cl:cons ':headerScan (headerScan msg))
    (cl:cons ':RGBImage (RGBImage msg))
))
