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
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class FloatList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.elements = null;
      this.RGBImage = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('elements')) {
        this.elements = initObj.elements
      }
      else {
        this.elements = [];
      }
      if (initObj.hasOwnProperty('RGBImage')) {
        this.RGBImage = initObj.RGBImage
      }
      else {
        this.RGBImage = new sensor_msgs.msg.CompressedImage();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FloatList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [elements]
    bufferOffset = _arraySerializer.float32(obj.elements, buffer, bufferOffset, null);
    // Serialize message field [RGBImage]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.RGBImage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FloatList
    let len;
    let data = new FloatList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [elements]
    data.elements = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [RGBImage]
    data.RGBImage = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.elements.length;
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.RGBImage);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'optimizer/FloatList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aa0ffa7ee0c8405a53af12a7ef35f8ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32[] elements
    sensor_msgs/CompressedImage RGBImage
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FloatList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.elements !== undefined) {
      resolved.elements = msg.elements;
    }
    else {
      resolved.elements = []
    }

    if (msg.RGBImage !== undefined) {
      resolved.RGBImage = sensor_msgs.msg.CompressedImage.Resolve(msg.RGBImage)
    }
    else {
      resolved.RGBImage = new sensor_msgs.msg.CompressedImage()
    }

    return resolved;
    }
};

module.exports = FloatList;
