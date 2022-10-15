// Auto-generated. Do not edit!

// (in-package optimizer.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class NewMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.coloredImage = null;
      this.POSE = null;
      this.LSDMap = null;
      this.depth = null;
      this.scale = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('coloredImage')) {
        this.coloredImage = initObj.coloredImage
      }
      else {
        this.coloredImage = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('POSE')) {
        this.POSE = initObj.POSE
      }
      else {
        this.POSE = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('LSDMap')) {
        this.LSDMap = initObj.LSDMap
      }
      else {
        this.LSDMap = [];
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = [];
      }
      if (initObj.hasOwnProperty('scale')) {
        this.scale = initObj.scale
      }
      else {
        this.scale = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NewMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [coloredImage]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.coloredImage, buffer, bufferOffset);
    // Serialize message field [POSE]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.POSE, buffer, bufferOffset);
    // Serialize message field [LSDMap]
    // Serialize the length for message field [LSDMap]
    bufferOffset = _serializer.uint32(obj.LSDMap.length, buffer, bufferOffset);
    obj.LSDMap.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [depth]
    bufferOffset = _arraySerializer.float32(obj.depth, buffer, bufferOffset, null);
    // Serialize message field [scale]
    bufferOffset = _serializer.float64(obj.scale, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NewMsg
    let len;
    let data = new NewMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [coloredImage]
    data.coloredImage = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [POSE]
    data.POSE = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [LSDMap]
    // Deserialize array length for message field [LSDMap]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.LSDMap = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.LSDMap[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [depth]
    data.depth = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [scale]
    data.scale = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.Image.getMessageSize(object.coloredImage);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.POSE);
    length += 24 * object.LSDMap.length;
    length += 4 * object.depth.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'optimizer/NewMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '078bbc35fe46c3fd961f9820ad417d34';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    sensor_msgs/Image coloredImage
    geometry_msgs/PoseStamped POSE
    geometry_msgs/Point[] LSDMap 
    float32[] depth
    float64 scale
    
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
    const resolved = new NewMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.coloredImage !== undefined) {
      resolved.coloredImage = sensor_msgs.msg.Image.Resolve(msg.coloredImage)
    }
    else {
      resolved.coloredImage = new sensor_msgs.msg.Image()
    }

    if (msg.POSE !== undefined) {
      resolved.POSE = geometry_msgs.msg.PoseStamped.Resolve(msg.POSE)
    }
    else {
      resolved.POSE = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.LSDMap !== undefined) {
      resolved.LSDMap = new Array(msg.LSDMap.length);
      for (let i = 0; i < resolved.LSDMap.length; ++i) {
        resolved.LSDMap[i] = geometry_msgs.msg.Point.Resolve(msg.LSDMap[i]);
      }
    }
    else {
      resolved.LSDMap = []
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = []
    }

    if (msg.scale !== undefined) {
      resolved.scale = msg.scale;
    }
    else {
      resolved.scale = 0.0
    }

    return resolved;
    }
};

module.exports = NewMsg;
