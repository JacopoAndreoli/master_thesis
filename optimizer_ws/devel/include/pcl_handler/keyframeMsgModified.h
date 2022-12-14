// Generated by gencpp from file pcl_handler/keyframeMsgModified.msg
// DO NOT EDIT!


#ifndef PCL_HANDLER_MESSAGE_KEYFRAMEMSGMODIFIED_H
#define PCL_HANDLER_MESSAGE_KEYFRAMEMSGMODIFIED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/Image.h>

namespace pcl_handler
{
template <class ContainerAllocator>
struct keyframeMsgModified_
{
  typedef keyframeMsgModified_<ContainerAllocator> Type;

  keyframeMsgModified_()
    : id(0)
    , time(0.0)
    , isKeyframe(false)
    , coloredImage()
    , camToWorld()
    , fx(0.0)
    , fy(0.0)
    , cx(0.0)
    , cy(0.0)
    , height(0)
    , width(0)
    , pointcloud()  {
      camToWorld.assign(0.0);
  }
  keyframeMsgModified_(const ContainerAllocator& _alloc)
    : id(0)
    , time(0.0)
    , isKeyframe(false)
    , coloredImage(_alloc)
    , camToWorld()
    , fx(0.0)
    , fy(0.0)
    , cx(0.0)
    , cy(0.0)
    , height(0)
    , width(0)
    , pointcloud(_alloc)  {
  (void)_alloc;
      camToWorld.assign(0.0);
  }



   typedef int32_t _id_type;
  _id_type id;

   typedef double _time_type;
  _time_type time;

   typedef uint8_t _isKeyframe_type;
  _isKeyframe_type isKeyframe;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _coloredImage_type;
  _coloredImage_type coloredImage;

   typedef boost::array<float, 7>  _camToWorld_type;
  _camToWorld_type camToWorld;

   typedef float _fx_type;
  _fx_type fx;

   typedef float _fy_type;
  _fy_type fy;

   typedef float _cx_type;
  _cx_type cx;

   typedef float _cy_type;
  _cy_type cy;

   typedef uint32_t _height_type;
  _height_type height;

   typedef uint32_t _width_type;
  _width_type width;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _pointcloud_type;
  _pointcloud_type pointcloud;





  typedef boost::shared_ptr< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> const> ConstPtr;

}; // struct keyframeMsgModified_

typedef ::pcl_handler::keyframeMsgModified_<std::allocator<void> > keyframeMsgModified;

typedef boost::shared_ptr< ::pcl_handler::keyframeMsgModified > keyframeMsgModifiedPtr;
typedef boost::shared_ptr< ::pcl_handler::keyframeMsgModified const> keyframeMsgModifiedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pcl_handler::keyframeMsgModified_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pcl_handler::keyframeMsgModified_<ContainerAllocator1> & lhs, const ::pcl_handler::keyframeMsgModified_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.time == rhs.time &&
    lhs.isKeyframe == rhs.isKeyframe &&
    lhs.coloredImage == rhs.coloredImage &&
    lhs.camToWorld == rhs.camToWorld &&
    lhs.fx == rhs.fx &&
    lhs.fy == rhs.fy &&
    lhs.cx == rhs.cx &&
    lhs.cy == rhs.cy &&
    lhs.height == rhs.height &&
    lhs.width == rhs.width &&
    lhs.pointcloud == rhs.pointcloud;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pcl_handler::keyframeMsgModified_<ContainerAllocator1> & lhs, const ::pcl_handler::keyframeMsgModified_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pcl_handler

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a426dd51d76b783b431104e7486ba4d6";
  }

  static const char* value(const ::pcl_handler::keyframeMsgModified_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa426dd51d76b783bULL;
  static const uint64_t static_value2 = 0x431104e7486ba4d6ULL;
};

template<class ContainerAllocator>
struct DataType< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pcl_handler/keyframeMsgModified";
  }

  static const char* value(const ::pcl_handler::keyframeMsgModified_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 id\n"
"float64 time\n"
"bool isKeyframe\n"
"sensor_msgs/Image coloredImage\n"
"# camToWorld as serialization of sophus sim(3).\n"
"# may change with keyframeGraph-updates.\n"
"float32[7] camToWorld \n"
"\n"
"\n"
"# camera parameter (fx fy cx cy), width, height\n"
"# will never change, but required for display.\n"
"float32 fx\n"
"float32 fy\n"
"float32 cx\n"
"float32 cy\n"
"uint32 height\n"
"uint32 width\n"
"\n"
"\n"
"# data as InputPointDense (float idepth, float idepth_var, uchar color[4]), width x height\n"
"# may be empty, in that case no associated pointcloud is ever shown.\n"
"uint8[] pointcloud\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/Image\n"
"# This message contains an uncompressed image\n"
"# (0, 0) is at top-left corner of image\n"
"#\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"                     # If the frame_id here and the frame_id of the CameraInfo\n"
"                     # message associated with the image conflict\n"
"                     # the behavior is undefined\n"
"\n"
"uint32 height         # image height, that is, number of rows\n"
"uint32 width          # image width, that is, number of columns\n"
"\n"
"# The legal values for encoding are in file src/image_encodings.cpp\n"
"# If you want to standardize a new string format, join\n"
"# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n"
"\n"
"string encoding       # Encoding of pixels -- channel meaning, ordering, size\n"
"                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n"
"\n"
"uint8 is_bigendian    # is this data bigendian?\n"
"uint32 step           # Full row length in bytes\n"
"uint8[] data          # actual matrix data, size is (step * rows)\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::pcl_handler::keyframeMsgModified_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.time);
      stream.next(m.isKeyframe);
      stream.next(m.coloredImage);
      stream.next(m.camToWorld);
      stream.next(m.fx);
      stream.next(m.fy);
      stream.next(m.cx);
      stream.next(m.cy);
      stream.next(m.height);
      stream.next(m.width);
      stream.next(m.pointcloud);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct keyframeMsgModified_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pcl_handler::keyframeMsgModified_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pcl_handler::keyframeMsgModified_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "time: ";
    Printer<double>::stream(s, indent + "  ", v.time);
    s << indent << "isKeyframe: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.isKeyframe);
    s << indent << "coloredImage: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.coloredImage);
    s << indent << "camToWorld[]" << std::endl;
    for (size_t i = 0; i < v.camToWorld.size(); ++i)
    {
      s << indent << "  camToWorld[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.camToWorld[i]);
    }
    s << indent << "fx: ";
    Printer<float>::stream(s, indent + "  ", v.fx);
    s << indent << "fy: ";
    Printer<float>::stream(s, indent + "  ", v.fy);
    s << indent << "cx: ";
    Printer<float>::stream(s, indent + "  ", v.cx);
    s << indent << "cy: ";
    Printer<float>::stream(s, indent + "  ", v.cy);
    s << indent << "height: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.height);
    s << indent << "width: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.width);
    s << indent << "pointcloud[]" << std::endl;
    for (size_t i = 0; i < v.pointcloud.size(); ++i)
    {
      s << indent << "  pointcloud[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.pointcloud[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PCL_HANDLER_MESSAGE_KEYFRAMEMSGMODIFIED_H
