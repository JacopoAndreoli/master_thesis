// Auto-generated. Do not edit!

// (in-package pcl_handler.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class NNPreProcess {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vector = null;
      this.header = null;
      this.RGBImage = null;
      this.POSE = null;
      this.LSD_map = null;
      this.Var_map = null;
    }
    else {
      if (initObj.hasOwnProperty('vector')) {
        this.vector = initObj.vector
      }
      else {
        this.vector = [];
      }
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('RGBImage')) {
        this.RGBImage = initObj.RGBImage
      }
      else {
        this.RGBImage = new sensor_msgs.msg.CompressedImage();
      }
      if (initObj.hasOwnProperty('POSE')) {
        this.POSE = initObj.POSE
      }
      else {
        this.POSE = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('LSD_map')) {
        this.LSD_map = initObj.LSD_map
      }
      else {
        this.LSD_map = [];
      }
      if (initObj.hasOwnProperty('Var_map')) {
        this.Var_map = initObj.Var_map
      }
      else {
        this.Var_map = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NNPreProcess
    // Serialize message field [vector]
    // Serialize the length for message field [vector]
    bufferOffset = _serializer.uint32(obj.vector.length, buffer, bufferOffset);
    obj.vector.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [RGBImage]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.RGBImage, buffer, bufferOffset);
    // Serialize message field [POSE]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.POSE, buffer, bufferOffset);
    // Serialize message field [LSD_map]
    bufferOffset = _arraySerializer.float32(obj.LSD_map, buffer, bufferOffset, null);
    // Serialize message field [Var_map]
    bufferOffset = _arraySerializer.float32(obj.Var_map, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NNPreProcess
    let len;
    let data = new NNPreProcess(null);
    // Deserialize message field [vector]
    // Deserialize array length for message field [vector]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.vector = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.vector[i] = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [RGBImage]
    data.RGBImage = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    // Deserialize message field [POSE]
    data.POSE = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [LSD_map]
    data.LSD_map = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [Var_map]
    data.Var_map = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.vector.length;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.RGBImage);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.POSE);
    length += 4 * object.LSD_map.length;
    length += 4 * object.Var_map.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pcl_handler/NNPreProcess';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a185c379656599a27ef14c753cf0f00b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Vector3[] vector
    Header header
    sensor_msgs/CompressedImage RGBImage
    geometry_msgs/PoseStamped POSE
    float32[] LSD_map
    float32[] Var_map
    
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
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NNPreProcess(null);
    if (msg.vector !== undefined) {
      resolved.vector = new Array(msg.vector.length);
      for (let i = 0; i < resolved.vector.length; ++i) {
        resolved.vector[i] = geometry_msgs.msg.Vector3.Resolve(msg.vector[i]);
      }
    }
    else {
      resolved.vector = []
    }

    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.RGBImage !== undefined) {
      resolved.RGBImage = sensor_msgs.msg.CompressedImage.Resolve(msg.RGBImage)
    }
    else {
      resolved.RGBImage = new sensor_msgs.msg.CompressedImage()
    }

    if (msg.POSE !== undefined) {
      resolved.POSE = geometry_msgs.msg.PoseStamped.Resolve(msg.POSE)
    }
    else {
      resolved.POSE = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.LSD_map !== undefined) {
      resolved.LSD_map = msg.LSD_map;
    }
    else {
      resolved.LSD_map = []
    }

    if (msg.Var_map !== undefined) {
      resolved.Var_map = msg.Var_map;
    }
    else {
      resolved.Var_map = []
    }

    return resolved;
    }
};

module.exports = NNPreProcess;
