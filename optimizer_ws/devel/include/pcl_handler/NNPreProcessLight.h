// Generated by gencpp from file pcl_handler/NNPreProcessLight.msg
// DO NOT EDIT!


#ifndef PCL_HANDLER_MESSAGE_NNPREPROCESSLIGHT_H
#define PCL_HANDLER_MESSAGE_NNPREPROCESSLIGHT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Vector3.h>
#include <std_msgs/Header.h>
#include <sensor_msgs/CompressedImage.h>

namespace pcl_handler
{
template <class ContainerAllocator>
struct NNPreProcessLight_
{
  typedef NNPreProcessLight_<ContainerAllocator> Type;

  NNPreProcessLight_()
    : vector()
    , header()
    , RGBImage()  {
    }
  NNPreProcessLight_(const ContainerAllocator& _alloc)
    : vector(_alloc)
    , header(_alloc)
    , RGBImage(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::geometry_msgs::Vector3_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Vector3_<ContainerAllocator> >::other >  _vector_type;
  _vector_type vector;

   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::sensor_msgs::CompressedImage_<ContainerAllocator>  _RGBImage_type;
  _RGBImage_type RGBImage;





  typedef boost::shared_ptr< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> const> ConstPtr;

}; // struct NNPreProcessLight_

typedef ::pcl_handler::NNPreProcessLight_<std::allocator<void> > NNPreProcessLight;

typedef boost::shared_ptr< ::pcl_handler::NNPreProcessLight > NNPreProcessLightPtr;
typedef boost::shared_ptr< ::pcl_handler::NNPreProcessLight const> NNPreProcessLightConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pcl_handler::NNPreProcessLight_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pcl_handler::NNPreProcessLight_<ContainerAllocator1> & lhs, const ::pcl_handler::NNPreProcessLight_<ContainerAllocator2> & rhs)
{
  return lhs.vector == rhs.vector &&
    lhs.header == rhs.header &&
    lhs.RGBImage == rhs.RGBImage;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pcl_handler::NNPreProcessLight_<ContainerAllocator1> & lhs, const ::pcl_handler::NNPreProcessLight_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pcl_handler

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
{
  static const char* value()
  {
    return "de922429bcb55d706bc2e38daa8f534b";
  }

  static const char* value(const ::pcl_handler::NNPreProcessLight_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xde922429bcb55d70ULL;
  static const uint64_t static_value2 = 0x6bc2e38daa8f534bULL;
};

template<class ContainerAllocator>
struct DataType< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pcl_handler/NNPreProcessLight";
  }

  static const char* value(const ::pcl_handler::NNPreProcessLight_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Vector3[] vector\n"
"Header header\n"
"sensor_msgs/CompressedImage RGBImage\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
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
"\n"
"================================================================================\n"
"MSG: sensor_msgs/CompressedImage\n"
"# This message contains a compressed image\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"\n"
"string format        # Specifies the format of the data\n"
"                     #   Acceptable values:\n"
"                     #     jpeg, png\n"
"uint8[] data         # Compressed image buffer\n"
;
  }

  static const char* value(const ::pcl_handler::NNPreProcessLight_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vector);
      stream.next(m.header);
      stream.next(m.RGBImage);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NNPreProcessLight_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pcl_handler::NNPreProcessLight_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pcl_handler::NNPreProcessLight_<ContainerAllocator>& v)
  {
    s << indent << "vector[]" << std::endl;
    for (size_t i = 0; i < v.vector.size(); ++i)
    {
      s << indent << "  vector[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "    ", v.vector[i]);
    }
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "RGBImage: ";
    s << std::endl;
    Printer< ::sensor_msgs::CompressedImage_<ContainerAllocator> >::stream(s, indent + "  ", v.RGBImage);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PCL_HANDLER_MESSAGE_NNPREPROCESSLIGHT_H
