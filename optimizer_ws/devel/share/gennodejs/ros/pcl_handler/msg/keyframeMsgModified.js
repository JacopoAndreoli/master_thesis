// Auto-generated. Do not edit!

// (in-package pcl_handler.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class keyframeMsgModified {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.time = null;
      this.isKeyframe = null;
      this.coloredImage = null;
      this.camToWorld = null;
      this.fx = null;
      this.fy = null;
      this.cx = null;
      this.cy = null;
      this.height = null;
      this.width = null;
      this.pointcloud = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0.0;
      }
      if (initObj.hasOwnProperty('isKeyframe')) {
        this.isKeyframe = initObj.isKeyframe
      }
      else {
        this.isKeyframe = false;
      }
      if (initObj.hasOwnProperty('coloredImage')) {
        this.coloredImage = initObj.coloredImage
      }
      else {
        this.coloredImage = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('camToWorld')) {
        this.camToWorld = initObj.camToWorld
      }
      else {
        this.camToWorld = new Array(7).fill(0);
      }
      if (initObj.hasOwnProperty('fx')) {
        this.fx = initObj.fx
      }
      else {
        this.fx = 0.0;
      }
      if (initObj.hasOwnProperty('fy')) {
        this.fy = initObj.fy
      }
      else {
        this.fy = 0.0;
      }
      if (initObj.hasOwnProperty('cx')) {
        this.cx = initObj.cx
      }
      else {
        this.cx = 0.0;
      }
      if (initObj.hasOwnProperty('cy')) {
        this.cy = initObj.cy
      }
      else {
        this.cy = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('pointcloud')) {
        this.pointcloud = initObj.pointcloud
      }
      else {
        this.pointcloud = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type keyframeMsgModified
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.float64(obj.time, buffer, bufferOffset);
    // Serialize message field [isKeyframe]
    bufferOffset = _serializer.bool(obj.isKeyframe, buffer, bufferOffset);
    // Serialize message field [coloredImage]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.coloredImage, buffer, bufferOffset);
    // Check that the constant length array field [camToWorld] has the right length
    if (obj.camToWorld.length !== 7) {
      throw new Error('Unable to serialize array field camToWorld - length must be 7')
    }
    // Serialize message field [camToWorld]
    bufferOffset = _arraySerializer.float32(obj.camToWorld, buffer, bufferOffset, 7);
    // Serialize message field [fx]
    bufferOffset = _serializer.float32(obj.fx, buffer, bufferOffset);
    // Serialize message field [fy]
    bufferOffset = _serializer.float32(obj.fy, buffer, bufferOffset);
    // Serialize message field [cx]
    bufferOffset = _serializer.float32(obj.cx, buffer, bufferOffset);
    // Serialize message field [cy]
    bufferOffset = _serializer.float32(obj.cy, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [pointcloud]
    bufferOffset = _arraySerializer.uint8(obj.pointcloud, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type keyframeMsgModified
    let len;
    let data = new keyframeMsgModified(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [isKeyframe]
    data.isKeyframe = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [coloredImage]
    data.coloredImage = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [camToWorld]
    data.camToWorld = _arrayDeserializer.float32(buffer, bufferOffset, 7)
    // Deserialize message field [fx]
    data.fx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fy]
    data.fy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cx]
    data.cx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cy]
    data.cy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [pointcloud]
    data.pointcloud = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.coloredImage);
    length += object.pointcloud.length;
    return length + 69;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pcl_handler/keyframeMsgModified';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a426dd51d76b783b431104e7486ba4d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    float64 time
    bool isKeyframe
    sensor_msgs/Image coloredImage
    # camToWorld as serialization of sophus sim(3).
    # may change with keyframeGraph-updates.
    float32[7] camToWorld 
    
    
    # camera parameter (fx fy cx cy), width, height
    # will never change, but required for display.
    float32 fx
    float32 fy
    float32 cx
    float32 cy
    uint32 height
    uint32 width
    
    
    # data as InputPointDense (float idepth, float idepth_var, uchar color[4]), width x height
    # may be empty, in that case no associated pointcloud is ever shown.
    uint8[] pointcloud
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new keyframeMsgModified(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0.0
    }

    if (msg.isKeyframe !== undefined) {
      resolved.isKeyframe = msg.isKeyframe;
    }
    else {
      resolved.isKeyframe = false
    }

    if (msg.coloredImage !== undefined) {
      resolved.coloredImage = sensor_msgs.msg.Image.Resolve(msg.coloredImage)
    }
    else {
      resolved.coloredImage = new sensor_msgs.msg.Image()
    }

    if (msg.camToWorld !== undefined) {
      resolved.camToWorld = msg.camToWorld;
    }
    else {
      resolved.camToWorld = new Array(7).fill(0)
    }

    if (msg.fx !== undefined) {
      resolved.fx = msg.fx;
    }
    else {
      resolved.fx = 0.0
    }

    if (msg.fy !== undefined) {
      resolved.fy = msg.fy;
    }
    else {
      resolved.fy = 0.0
    }

    if (msg.cx !== undefined) {
      resolved.cx = msg.cx;
    }
    else {
      resolved.cx = 0.0
    }

    if (msg.cy !== undefined) {
      resolved.cy = msg.cy;
    }
    else {
      resolved.cy = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.pointcloud !== undefined) {
      resolved.pointcloud = msg.pointcloud;
    }
    else {
      resolved.pointcloud = []
    }

    return resolved;
    }
};

module.exports = keyframeMsgModified;
