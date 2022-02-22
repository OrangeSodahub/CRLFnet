// Generated by gencpp from file sick_scan/ColaMsgSrvRequest.msg
// DO NOT EDIT!


#ifndef SICK_SCAN_MESSAGE_COLAMSGSRVREQUEST_H
#define SICK_SCAN_MESSAGE_COLAMSGSRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sick_scan
{
template <class ContainerAllocator>
struct ColaMsgSrvRequest_
{
  typedef ColaMsgSrvRequest_<ContainerAllocator> Type;

  ColaMsgSrvRequest_()
    : request()  {
    }
  ColaMsgSrvRequest_(const ContainerAllocator& _alloc)
    : request(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _request_type;
  _request_type request;





  typedef boost::shared_ptr< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ColaMsgSrvRequest_

typedef ::sick_scan::ColaMsgSrvRequest_<std::allocator<void> > ColaMsgSrvRequest;

typedef boost::shared_ptr< ::sick_scan::ColaMsgSrvRequest > ColaMsgSrvRequestPtr;
typedef boost::shared_ptr< ::sick_scan::ColaMsgSrvRequest const> ColaMsgSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator1> & lhs, const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator2> & rhs)
{
  return lhs.request == rhs.request;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator1> & lhs, const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sick_scan

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9b13f31f7a0a36901919f7ec0d9f40d4";
  }

  static const char* value(const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9b13f31f7a0a3690ULL;
  static const uint64_t static_value2 = 0x1919f7ec0d9f40d4ULL;
};

template<class ContainerAllocator>
struct DataType< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sick_scan/ColaMsgSrvRequest";
  }

  static const char* value(const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Definition of ROS service ColaMsg for sick_scan\n"
"# Send a cola message to the Lidar\n"
"# Example call (ROS1):\n"
"# rosservice call /sick_tim_7xx/ColaMsg \"{request: 'sEN LIDoutputstate 1'}\"\n"
"# \n"
"\n"
"# \n"
"# Request (input)\n"
"# \n"
"\n"
"string request\n"
"\n"
;
  }

  static const char* value(const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.request);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ColaMsgSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sick_scan::ColaMsgSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "request: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.request);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SICK_SCAN_MESSAGE_COLAMSGSRVREQUEST_H
