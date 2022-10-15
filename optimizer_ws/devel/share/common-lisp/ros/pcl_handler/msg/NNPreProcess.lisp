; Auto-generated. Do not edit!


(cl:in-package pcl_handler-msg)


;//! \htmlinclude NNPreProcess.msg.html

(cl:defclass <NNPreProcess> (roslisp-msg-protocol:ros-message)
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
   (RGBImage
    :reader RGBImage
    :initarg :RGBImage
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
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

(cl:defclass NNPreProcess (<NNPreProcess>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NNPreProcess>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NNPreProcess)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_handler-msg:<NNPreProcess> is deprecated: use pcl_handler-msg:NNPreProcess instead.")))

(cl:ensure-generic-function 'vector-val :lambda-list '(m))
(cl:defmethod vector-val ((m <NNPreProcess>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:vector-val is deprecated.  Use pcl_handler-msg:vector instead.")
  (vector m))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <NNPreProcess>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:header-val is deprecated.  Use pcl_handler-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'RGBImage-val :lambda-list '(m))
(cl:defmethod RGBImage-val ((m <NNPreProcess>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:RGBImage-val is deprecated.  Use pcl_handler-msg:RGBImage instead.")
  (RGBImage m))

(cl:ensure-generic-function 'POSE-val :lambda-list '(m))
(cl:defmethod POSE-val ((m <NNPreProcess>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:POSE-val is deprecated.  Use pcl_handler-msg:POSE instead.")
  (POSE m))

(cl:ensure-generic-function 'LSD_map-val :lambda-list '(m))
(cl:defmethod LSD_map-val ((m <NNPreProcess>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:LSD_map-val is deprecated.  Use pcl_handler-msg:LSD_map instead.")
  (LSD_map m))

(cl:ensure-generic-function 'Var_map-val :lambda-list '(m))
(cl:defmethod Var_map-val ((m <NNPreProcess>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_handler-msg:Var_map-val is deprecated.  Use pcl_handler-msg:Var_map instead.")
  (Var_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NNPreProcess>) ostream)
  "Serializes a message object of type '<NNPreProcess>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vector))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RGBImage) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NNPreProcess>) istream)
  "Deserializes a message object of type '<NNPreProcess>"
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RGBImage) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NNPreProcess>)))
  "Returns string type for a message object of type '<NNPreProcess>"
  "pcl_handler/NNPreProcess")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NNPreProcess)))
  "Returns string type for a message object of type 'NNPreProcess"
  "pcl_handler/NNPreProcess")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NNPreProcess>)))
  "Returns md5sum for a message object of type '<NNPreProcess>"
  "a185c379656599a27ef14c753cf0f00b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NNPreProcess)))
  "Returns md5sum for a message object of type 'NNPreProcess"
  "a185c379656599a27ef14c753cf0f00b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NNPreProcess>)))
  "Returns full string definition for message of type '<NNPreProcess>"
  (cl:format cl:nil "geometry_msgs/Vector3[] vector~%Header header~%sensor_msgs/CompressedImage RGBImage~%geometry_msgs/PoseStamped POSE~%float32[] LSD_map~%float32[] Var_map~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NNPreProcess)))
  "Returns full string definition for message of type 'NNPreProcess"
  (cl:format cl:nil "geometry_msgs/Vector3[] vector~%Header header~%sensor_msgs/CompressedImage RGBImage~%geometry_msgs/PoseStamped POSE~%float32[] LSD_map~%float32[] Var_map~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NNPreProcess>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RGBImage))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'POSE))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'LSD_map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Var_map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NNPreProcess>))
  "Converts a ROS message object to a list"
  (cl:list 'NNPreProcess
    (cl:cons ':vector (vector msg))
    (cl:cons ':header (header msg))
    (cl:cons ':RGBImage (RGBImage msg))
    (cl:cons ':POSE (POSE msg))
    (cl:cons ':LSD_map (LSD_map msg))
    (cl:cons ':Var_map (Var_map msg))
))
