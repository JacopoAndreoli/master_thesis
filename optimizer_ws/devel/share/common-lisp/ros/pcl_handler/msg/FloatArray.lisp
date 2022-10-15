; Auto-generated. Do not edit!


(cl:in-package pcl_handler-msg)


;//! \htmlinclude FloatArray.msg.html

(cl:defclass <FloatArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vector
    :reader vector
    :initarg :vector
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3))))
)

(cl:defclass FloatArray (<FloatArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FloatArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FloatArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_handler-msg:<FloatArray> is deprecated: use pcl_handler-msg:FloatArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FloatArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:header-val is deprecated.  Use pcl_handler-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vector-val :lambda-list '(m))
(cl:defmethod vector-val ((m <FloatArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:vector-val is deprecated.  Use pcl_handler-msg:vector instead.")
  (vector m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FloatArray>) ostream)
  "Serializes a message object of type '<FloatArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vector))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FloatArray>) istream)
  "Deserializes a message object of type '<FloatArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FloatArray>)))
  "Returns string type for a message object of type '<FloatArray>"
  "pcl_handler/FloatArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FloatArray)))
  "Returns string type for a message object of type 'FloatArray"
  "pcl_handler/FloatArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FloatArray>)))
  "Returns md5sum for a message object of type '<FloatArray>"
  "7b324c7325e683bf02a9b14b01090ec7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FloatArray)))
  "Returns md5sum for a message object of type 'FloatArray"
  "7b324c7325e683bf02a9b14b01090ec7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FloatArray>)))
  "Returns full string definition for message of type '<FloatArray>"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3[] vector~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FloatArray)))
  "Returns full string definition for message of type 'FloatArray"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3[] vector~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FloatArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FloatArray>))
  "Converts a ROS message object to a list"
  (cl:list 'FloatArray
    (cl:cons ':header (header msg))
    (cl:cons ':vector (vector msg))
))
