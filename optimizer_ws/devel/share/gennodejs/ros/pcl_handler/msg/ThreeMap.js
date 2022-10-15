// Auto-generated. Do not edit!

// (in-package pcl_handler.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class ThreeMap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Var_map = null;
      this.LSD_map = null;
      this.coloredImage = null;
      this.cameraMatrix = null;
      this.RotationMatrix = null;
      this.translationVector = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('Var_map')) {
        this.Var_map = initObj.Var_map
      }
      else {
        this.Var_map = [];
      }
      if (initObj.hasOwnProperty('LSD_map')) {
        this.LSD_map = initObj.LSD_map
      }
      else {
        this.LSD_map = [];
      }
      if (initObj.hasOwnProperty('coloredImage')) {
        this.coloredImage = initObj.coloredImage
      }
      else {
        this.coloredImage = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('cameraMatrix')) {
        this.cameraMatrix = initObj.cameraMatrix
      }
      else {
        this.cameraMatrix = [];
      }
      if (initObj.hasOwnProperty('RotationMatrix')) {
        this.RotationMatrix = initObj.RotationMatrix
      }
      else {
        this.RotationMatrix = [];
      }
      if (initObj.hasOwnProperty('translationVector')) {
        this.translationVector = initObj.translationVector
      }
      else {
        this.translationVector = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThreeMap
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Var_map]
    bufferOffset = _arraySerializer.float32(obj.Var_map, buffer, bufferOffset, null);
    // Serialize message field [LSD_map]
    bufferOffset = _arraySerializer.float32(obj.LSD_map, buffer, bufferOffset, null);
    // Serialize message field [coloredImage]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.coloredImage, buffer, bufferOffset);
    // Serialize message field [cameraMatrix]
    bufferOffset = _arraySerializer.float32(obj.cameraMatrix, buffer, bufferOffset, null);
    // Serialize message field [RotationMatrix]
    bufferOffset = _arraySerializer.float32(obj.RotationMatrix, buffer, bufferOffset, null);
    // Serialize message field [translationVector]
    bufferOffset = _arraySerializer.float32(obj.translationVector, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThreeMap
    let len;
    let data = new ThreeMap(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Var_map]
    data.Var_map = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [LSD_map]
    data.LSD_map = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [coloredImage]
    data.coloredImage = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [cameraMatrix]
    data.cameraMatrix = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [RotationMatrix]
    data.RotationMatrix = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [translationVector]
    data.translationVector = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.Var_map.length;
    length += 4 * object.LSD_map.length;
    length += sensor_msgs.msg.Image.getMessageSize(object.coloredImage);
    length += 4 * object.cameraMatrix.length;
    length += 4 * object.RotationMatrix.length;
    length += 4 * object.translationVector.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pcl_handler/ThreeMap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '35eb6653c31b68cb2b3203e9acd1f9e4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header 
    float32[] Var_map
    float32[] LSD_map
    sensor_msgs/Image coloredImage
    float32[] cameraMatrix
    float32[] RotationMatrix
    float32[] translationVector
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThreeMap(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.Var_map !== undefined) {
      resolved.Var_map = msg.Var_map;
    }
    else {
      resolved.Var_map = []
    }

    if (msg.LSD_map !== undefined) {
      resolved.LSD_map = msg.LSD_map;
    }
    else {
      resolved.LSD_map = []
    }

    if (msg.coloredImage !== undefined) {
      resolved.coloredImage = sensor_msgs.msg.Image.Resolve(msg.coloredImage)
    }
    else {
      resolved.coloredImage = new sensor_msgs.msg.Image()
    }

    if (msg.cameraMatrix !== undefined) {
      resolved.cameraMatrix = msg.cameraMatrix;
    }
    else {
      resolved.cameraMatrix = []
    }

    if (msg.RotationMatrix !== undefined) {
      resolved.RotationMatrix = msg.RotationMatrix;
    }
    else {
      resolved.RotationMatrix = []
    }

    if (msg.translationVector !== undefined) {
      resolved.translationVector = msg.translationVector;
    }
    else {
      resolved.translationVector = []
    }

    return resolved;
    }
};

module.exports = ThreeMap;
