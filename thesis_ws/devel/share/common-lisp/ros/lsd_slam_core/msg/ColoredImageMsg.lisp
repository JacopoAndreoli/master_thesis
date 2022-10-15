; Auto-generated. Do not edit!


(cl:in-package lsd_slam_core-msg)


;//! \htmlinclude ColoredImageMsg.msg.html

(cl:defclass <ColoredImageMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (coloredImage
    :reader coloredImage
    :initarg :coloredImage
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (POSE
    :reader POSE
    :initarg :POSE
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (LSD_map
    :reader LSD_map
    :initarg :LSD_map
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (Var_map
    :reader Var_map
    :initarg :Var_map
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ColoredImageMsg (<ColoredImageMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColoredImageMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColoredImageMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lsd_slam_core-msg:<ColoredImageMsg> is deprecated: use lsd_slam_core-msg:ColoredImageMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ColoredImageMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lsd_slam_core-msg:header-val is deprecated.  Use lsd_slam_core-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'coloredImage-val :lambda-list '(m))
(cl:defmethod coloredImage-val ((m <ColoredImageMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lsd_slam_core-msg:coloredImage-val is deprecated.  Use lsd_slam_core-msg:coloredImage instead.")
  (coloredImage m))

(cl:ensure-generic-function 'POSE-val :lambda-list '(m))
(cl:defmethod POSE-val ((m <ColoredImageMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lsd_slam_core-msg:POSE-val is deprecated.  Use lsd_slam_core-msg:POSE instead.")
  (POSE m))

(cl:ensure-generic-function 'LSD_map-val :lambda-list '(m))
(cl:defmethod LSD_map-val ((m <ColoredImageMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lsd_slam_core-msg:LSD_map-val is deprecated.  Use lsd_slam_core-msg:LSD_map instead.")
  (LSD_map m))

(cl:ensure-generic-function 'Var_map-val :lambda-list '(m))
(cl:defmethod Var_map-val ((m <ColoredImageMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lsd_slam_core-msg:Var_map-val is deprecated.  Use lsd_slam_core-msg:Var_map instead.")
  (Var_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColoredImageMsg>) ostream)
  "Serializes a message object of type '<ColoredImageMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'coloredImage) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'POSE) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'LSD_map))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'LSD_map))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Var_map))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'Var_map))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColoredImageMsg>) istream)
  "Deserializes a message object of type '<ColoredImageMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'coloredImage) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'POSE) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'LSD_map) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'LSD_map)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Var_map) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Var_map)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColoredImageMsg>)))
  "Returns string type for a message object of type '<ColoredImageMsg>"
  "lsd_slam_core/ColoredImageMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColoredImageMsg)))
  "Returns string type for a message object of type 'ColoredImageMsg"
  "lsd_slam_core/ColoredImageMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColoredImageMsg>)))
  "Returns md5sum for a message object of type '<ColoredImageMsg>"
  "4c222e02e39b32be1aab36e1c565a823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColoredImageMsg)))
  "Returns md5sum for a message object of type 'ColoredImageMsg"
  "4c222e02e39b32be1aab36e1c565a823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColoredImageMsg>)))
  "Returns full string definition for message of type '<ColoredImageMsg>"
  (cl:format cl:nil "Header header~%sensor_msgs/Image coloredImage~%geometry_msgs/PoseStamped POSE~%float32[] LSD_map~%float32[] Var_map~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColoredImageMsg)))
  "Returns full string definition for message of type 'ColoredImageMsg"
  (cl:format cl:nil "Header header~%sensor_msgs/Image coloredImage~%geometry_msgs/PoseStamped POSE~%float32[] LSD_map~%float32[] Var_map~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColoredImageMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'coloredImage))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'POSE))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'LSD_map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Var_map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColoredImageMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ColoredImageMsg
    (cl:cons ':header (header msg))
    (cl:cons ':coloredImage (coloredImage msg))
    (cl:cons ':POSE (POSE msg))
    (cl:cons ':LSD_map (LSD_map msg))
    (cl:cons ':Var_map (Var_map msg))
))
