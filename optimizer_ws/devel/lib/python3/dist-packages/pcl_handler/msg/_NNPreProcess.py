# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from pcl_handler/NNPreProcess.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import sensor_msgs.msg
import std_msgs.msg

class NNPreProcess(genpy.Message):
  _md5sum = "a185c379656599a27ef14c753cf0f00b"
  _type = "pcl_handler/NNPreProcess"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """geometry_msgs/Vector3[] vector
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
"""
  __slots__ = ['vector','header','RGBImage','POSE','LSD_map','Var_map']
  _slot_types = ['geometry_msgs/Vector3[]','std_msgs/Header','sensor_msgs/CompressedImage','geometry_msgs/PoseStamped','float32[]','float32[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       vector,header,RGBImage,POSE,LSD_map,Var_map

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(NNPreProcess, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.vector is None:
        self.vector = []
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.RGBImage is None:
        self.RGBImage = sensor_msgs.msg.CompressedImage()
      if self.POSE is None:
        self.POSE = geometry_msgs.msg.PoseStamped()
      if self.LSD_map is None:
        self.LSD_map = []
      if self.Var_map is None:
        self.Var_map = []
    else:
      self.vector = []
      self.header = std_msgs.msg.Header()
      self.RGBImage = sensor_msgs.msg.CompressedImage()
      self.POSE = geometry_msgs.msg.PoseStamped()
      self.LSD_map = []
      self.Var_map = []

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
      length = len(self.vector)
      buff.write(_struct_I.pack(length))
      for val1 in self.vector:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.RGBImage.header.seq, _x.RGBImage.header.stamp.secs, _x.RGBImage.header.stamp.nsecs))
      _x = self.RGBImage.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.RGBImage.format
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.RGBImage.data
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
      length = len(self.LSD_map)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.LSD_map))
      length = len(self.Var_map)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.Var_map))
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
      if self.vector is None:
        self.vector = None
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.RGBImage is None:
        self.RGBImage = sensor_msgs.msg.CompressedImage()
      if self.POSE is None:
        self.POSE = geometry_msgs.msg.PoseStamped()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.vector = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Vector3()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.vector.append(val1)
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
      (_x.RGBImage.header.seq, _x.RGBImage.header.stamp.secs, _x.RGBImage.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.RGBImage.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.RGBImage.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.RGBImage.format = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.RGBImage.format = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.RGBImage.data = str[start:end]
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
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.LSD_map = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.Var_map = s.unpack(str[start:end])
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
      length = len(self.vector)
      buff.write(_struct_I.pack(length))
      for val1 in self.vector:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.RGBImage.header.seq, _x.RGBImage.header.stamp.secs, _x.RGBImage.header.stamp.nsecs))
      _x = self.RGBImage.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.RGBImage.format
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.RGBImage.data
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
      length = len(self.LSD_map)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.LSD_map.tostring())
      length = len(self.Var_map)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.Var_map.tostring())
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
      if self.vector is None:
        self.vector = None
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.RGBImage is None:
        self.RGBImage = sensor_msgs.msg.CompressedImage()
      if self.POSE is None:
        self.POSE = geometry_msgs.msg.PoseStamped()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.vector = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Vector3()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.vector.append(val1)
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
      (_x.RGBImage.header.seq, _x.RGBImage.header.stamp.secs, _x.RGBImage.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.RGBImage.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.RGBImage.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.RGBImage.format = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.RGBImage.format = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.RGBImage.data = str[start:end]
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
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.LSD_map = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.Var_map = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
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
