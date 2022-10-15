; Auto-generated. Do not edit!


(cl:in-package optimizer-msg)


;//! \htmlinclude BoolStampedMsg.msg.html

(cl:defclass <BoolStampedMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bool
    :reader bool
    :initarg :bool
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BoolStampedMsg (<BoolStampedMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoolStampedMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoolStampedMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name optimizer-msg:<BoolStampedMsg> is deprecated: use optimizer-msg:BoolStampedMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BoolStampedMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:header-val is deprecated.  Use optimizer-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bool-val :lambda-list '(m))
(cl:defmethod bool-val ((m <BoolStampedMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optimizer-msg:bool-val is deprecated.  Use optimizer-msg:bool instead.")
  (bool m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoolStampedMsg>) ostream)
  "Serializes a message object of type '<BoolStampedMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bool) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoolStampedMsg>) istream)
  "Deserializes a message object of type '<BoolStampedMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'bool) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoolStampedMsg>)))
  "Returns string type for a message object of type '<BoolStampedMsg>"
  "optimizer/BoolStampedMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoolStampedMsg)))
  "Returns string type for a message object of type 'BoolStampedMsg"
  "optimizer/BoolStampedMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoolStampedMsg>)))
  "Returns md5sum for a message object of type '<BoolStampedMsg>"
  "69889c828e9b57d09fcac5f696f08fc4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoolStampedMsg)))
  "Returns md5sum for a message object of type 'BoolStampedMsg"
  "69889c828e9b57d09fcac5f696f08fc4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoolStampedMsg>)))
  "Returns full string definition for message of type '<BoolStampedMsg>"
  (cl:format cl:nil "Header header~%bool bool~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoolStampedMsg)))
  "Returns full string definition for message of type 'BoolStampedMsg"
  (cl:format cl:nil "Header header~%bool bool~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoolStampedMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoolStampedMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'BoolStampedMsg
    (cl:cons ':header (header msg))
    (cl:cons ':bool (bool msg))
))
