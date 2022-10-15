; Auto-generated. Do not edit!


(cl:in-package optimizer-msg)


;//! \htmlinclude FloatList.msg.html

(cl:defclass <FloatList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (elements
    :reader elements
    :initarg :elements
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (RGBImage
    :reader RGBImage
    :initarg :RGBImage
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage)))
)

(cl:defclass FloatList (<FloatList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FloatList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FloatList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name optimizer-msg:<FloatList> is deprecated: use optimizer-msg:FloatList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FloatList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:header-val is deprecated.  Use optimizer-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'elements-val :lambda-list '(m))
(cl:defmethod elements-val ((m <FloatList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:elements-val is deprecated.  Use optimizer-msg:elements instead.")
  (elements m))

(cl:ensure-generic-function 'RGBImage-val :lambda-list '(m))
(cl:defmethod RGBImage-val ((m <FloatList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:RGBImage-val is deprecated.  Use optimizer-msg:RGBImage instead.")
  (RGBImage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FloatList>) ostream)
  "Serializes a message object of type '<FloatList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'elements))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'elements))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RGBImage) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FloatList>) istream)
  "Deserializes a message object of type '<FloatList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'elements) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'elements)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RGBImage) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FloatList>)))
  "Returns string type for a message object of type '<FloatList>"
  "optimizer/FloatList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FloatList)))
  "Returns string type for a message object of type 'FloatList"
  "optimizer/FloatList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FloatList>)))
  "Returns md5sum for a message object of type '<FloatList>"
  "aa0ffa7ee0c8405a53af12a7ef35f8ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FloatList)))
  "Returns md5sum for a message object of type 'FloatList"
  "aa0ffa7ee0c8405a53af12a7ef35f8ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FloatList>)))
  "Returns full string definition for message of type '<FloatList>"
  (cl:format cl:nil "Header header~%float32[] elements~%sensor_msgs/CompressedImage RGBImage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FloatList)))
  "Returns full string definition for message of type 'FloatList"
  (cl:format cl:nil "Header header~%float32[] elements~%sensor_msgs/CompressedImage RGBImage~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FloatList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'elements) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RGBImage))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FloatList>))
  "Converts a ROS message object to a list"
  (cl:list 'FloatList
    (cl:cons ':header (header msg))
    (cl:cons ':elements (elements msg))
    (cl:cons ':RGBImage (RGBImage msg))
))
