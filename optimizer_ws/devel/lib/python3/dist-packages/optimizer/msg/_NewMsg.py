# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from optimizer/NewMsg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import sensor_msgs.msg
import std_msgs.msg

class NewMsg(genpy.Message):
  _md5sum = "078bbc35fe46c3fd961f9820ad417d34"
  _type = "optimizer/NewMsg"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
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
"""
  __slots__ = ['header','coloredImage','POSE','LSDMap','depth','scale']
  _slot_types = ['std_msgs/Header','sensor_msgs/Image','geometry_msgs/PoseStamped','geometry_msgs/Point[]','float32[]','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,coloredImage,POSE,LSDMap,depth,scale

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(NewMsg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.coloredImage is None:
        self.coloredImage = sensor_msgs.msg.Image()
      if self.POSE is None:
        self.POSE = geometry_msgs.msg.PoseStamped()
      if self.LSDMap is None:
        self.LSDMap = []
      if self.depth is None:
        self.depth = []
      if self.scale is None:
        self.scale = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.coloredImage = sensor_msgs.msg.Image()
      self.POSE = geometry_msgs.msg.PoseStamped()
      self.LSDMap = []
      self.depth = []
      self.scale = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.coloredImage.header.seq, _x.coloredImage.header.stamp.secs, _x.coloredImage.header.stamp.nsecs))
      _x = self.coloredImage.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.coloredImage.height, _x.coloredImage.width))
      _x = self.coloredImage.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.coloredImage.is_bigendian, _x.coloredImage.step))
      _x = self.coloredImage.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.Struct('<I%sB'%length).pack(length, *_x))
      else:
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.POSE.header.seq, _x.POSE.header.stamp.secs, _x.POSE.header.stamp.nsecs))
      _x = self.POSE.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_7d().pack(_x.POSE.pose.position.x, _x.POSE.pose.position.y, _x.POSE.pose.position.z, _x.POSE.pose.orientation.x, _x.POSE.pose.orientation.y, _x.POSE.pose.orientation.z, _x.POSE.pose.orientation.w))
      length = len(self.LSDMap)
      buff.write(_struct_I.pack(length))
      for val1 in self.LSDMap:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      length = len(self.depth)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.depth))
      _x = self.scale
      buff.write(_get_struct_d().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.coloredImage is None:
        self.coloredImage = sensor_msgs.msg.Image()
      if self.POSE is None:
        self.POSE = geometry_msgs.msg.PoseStamped()
      if self.LSDMap is None:
        self.LSDMap = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.coloredImage.header.seq, _x.coloredImage.header.stamp.secs, _x.coloredImage.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.coloredImage.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.coloredImage.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.coloredImage.height, _x.coloredImage.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.coloredImage.encoding = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.coloredImage.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.coloredImage.is_bigendian, _x.coloredImage.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.coloredImage.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.POSE.header.seq, _x.POSE.header.stamp.secs, _x.POSE.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.POSE.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.POSE.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 56
      (_x.POSE.pose.position.x, _x.POSE.pose.position.y, _x.POSE.pose.position.z, _x.POSE.pose.orientation.x, _x.POSE.pose.orientation.y, _x.POSE.pose.orientation.z, _x.POSE.pose.orientation.w,) = _get_struct_7d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.LSDMap = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Point()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.LSDMap.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.depth = s.unpack(str[start:end])
      start = end
      end += 8
      (self.scale,) = _get_struct_d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.coloredImage.header.seq, _x.coloredImage.header.stamp.secs, _x.coloredImage.header.stamp.nsecs))
      _x = self.coloredImage.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.coloredImage.height, _x.coloredImage.width))
      _x = self.coloredImage.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.coloredImage.is_bigendian, _x.coloredImage.step))
      _x = self.coloredImage.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.Struct('<I%sB'%length).pack(length, *_x))
      else:
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.POSE.header.seq, _x.POSE.header.stamp.secs, _x.POSE.header.stamp.nsecs))
      _x = self.POSE.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_7d().pack(_x.POSE.pose.position.x, _x.POSE.pose.position.y, _x.POSE.pose.position.z, _x.POSE.pose.orientation.x, _x.POSE.pose.orientation.y, _x.POSE.pose.orientation.z, _x.POSE.pose.orientation.w))
      length = len(self.LSDMap)
      buff.write(_struct_I.pack(length))
      for val1 in self.LSDMap:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      length = len(self.depth)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.depth.tostring())
      _x = self.scale
      buff.write(_get_struct_d().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.coloredImage is None:
        self.coloredImage = sensor_msgs.msg.Image()
      if self.POSE is None:
        self.POSE = geometry_msgs.msg.PoseStamped()
      if self.LSDMap is None:
        self.LSDMap = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.coloredImage.header.seq, _x.coloredImage.header.stamp.secs, _x.coloredImage.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.coloredImage.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.coloredImage.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.coloredImage.height, _x.coloredImage.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.coloredImage.encoding = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.coloredImage.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.coloredImage.is_bigendian, _x.coloredImage.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.coloredImage.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.POSE.header.seq, _x.POSE.header.stamp.secs, _x.POSE.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.POSE.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.POSE.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 56
      (_x.POSE.pose.position.x, _x.POSE.pose.position.y, _x.POSE.pose.position.z, _x.POSE.pose.orientation.x, _x.POSE.pose.orientation.y, _x.POSE.pose.orientation.z, _x.POSE.pose.orientation.w,) = _get_struct_7d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.LSDMap = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Point()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.LSDMap.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.depth = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 8
      (self.scale,) = _get_struct_d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_7d = None
def _get_struct_7d():
    global _struct_7d
    if _struct_7d is None:
        _struct_7d = struct.Struct("<7d")
    return _struct_7d
_struct_BI = None
def _get_struct_BI():
    global _struct_BI
    if _struct_BI is None:
        _struct_BI = struct.Struct("<BI")
    return _struct_BI
_struct_d = None
def _get_struct_d():
    global _struct_d
    if _struct_d is None:
        _struct_d = struct.Struct("<d")
    return _struct_d
