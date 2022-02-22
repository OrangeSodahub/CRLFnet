// Generated by gencpp from file site/ModeCRadarSummary.msg
// DO NOT EDIT!


#ifndef SITE_MESSAGE_MODECRADARSUMMARY_H
#define SITE_MESSAGE_MODECRADARSUMMARY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <site/ModeCRadar.h>

namespace site
{
template <class ContainerAllocator>
struct ModeCRadarSummary_
{
  typedef ModeCRadarSummary_<ContainerAllocator> Type;

  ModeCRadarSummary_()
    : header()
    , contacts()  {
    }
  ModeCRadarSummary_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , contacts(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::site::ModeCRadar_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::site::ModeCRadar_<ContainerAllocator> >::other >  _contacts_type;
  _contacts_type contacts;





  typedef boost::shared_ptr< ::site::ModeCRadarSummary_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::site::ModeCRadarSummary_<ContainerAllocator> const> ConstPtr;

}; // struct ModeCRadarSummary_

typedef ::site::ModeCRadarSummary_<std::allocator<void> > ModeCRadarSummary;

typedef boost::shared_ptr< ::site::ModeCRadarSummary > ModeCRadarSummaryPtr;
typedef boost::shared_ptr< ::site::ModeCRadarSummary const> ModeCRadarSummaryConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::site::ModeCRadarSummary_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::site::ModeCRadarSummary_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::site::ModeCRadarSummary_<ContainerAllocator1> & lhs, const ::site::ModeCRadarSummary_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.contacts == rhs.contacts;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::site::ModeCRadarSummary_<ContainerAllocator1> & lhs, const ::site::ModeCRadarSummary_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace site

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::site::ModeCRadarSummary_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::site::ModeCRadarSummary_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::site::ModeCRadarSummary_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::site::ModeCRadarSummary_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::site::ModeCRadarSummary_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::site::ModeCRadarSummary_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::site::ModeCRadarSummary_<ContainerAllocator> >
{
  static const char* value()
  {
    return "98cae80bd5cdf50d70e731ef44eb76ea";
  }

  static const char* value(const ::site::ModeCRadarSummary_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x98cae80bd5cdf50dULL;
  static const uint64_t static_value2 = 0x70e731ef44eb76eaULL;
};

template<class ContainerAllocator>
struct DataType< ::site::ModeCRadarSummary_<ContainerAllocator> >
{
  static const char* value()
  {
    return "site/ModeCRadarSummary";
  }

  static const char* value(const ::site::ModeCRadarSummary_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::site::ModeCRadarSummary_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"ModeCRadar[] contacts\n"
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
"\n"
"================================================================================\n"
"MSG: site/ModeCRadar\n"
"Header header\n"
"float32 range  # meters\n"
"float32 bearing  # radians clockwise about Z axis of header frame\n"
"float32 altitude  # Pressure altitude (m)\n"
"uint16 code # Transponder code\n"
"bool ident  # If ident button was pressed\n"
;
  }

  static const char* value(const ::site::ModeCRadarSummary_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::site::ModeCRadarSummary_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.contacts);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ModeCRadarSummary_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::site::ModeCRadarSummary_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::site::ModeCRadarSummary_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "contacts[]" << std::endl;
    for (size_t i = 0; i < v.contacts.size(); ++i)
    {
      s << indent << "  contacts[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::site::ModeCRadar_<ContainerAllocator> >::stream(s, indent + "    ", v.contacts[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SITE_MESSAGE_MODECRADARSUMMARY_H
