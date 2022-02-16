// Generated by gencpp from file pb_msgs/ContiList.msg
// DO NOT EDIT!


#ifndef PB_MSGS_MESSAGE_CONTILIST_H
#define PB_MSGS_MESSAGE_CONTILIST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pb_msgs
{
template <class ContainerAllocator>
struct ContiList_
{
  typedef ContiList_<ContainerAllocator> Type;

  ContiList_()
    : nof_objects(0)
    , meas_counter(0)
    , interface_version(0)  {
    }
  ContiList_(const ContainerAllocator& _alloc)
    : nof_objects(0)
    , meas_counter(0)
    , interface_version(0)  {
  (void)_alloc;
    }



   typedef uint8_t _nof_objects_type;
  _nof_objects_type nof_objects;

   typedef uint32_t _meas_counter_type;
  _meas_counter_type meas_counter;

   typedef uint8_t _interface_version_type;
  _interface_version_type interface_version;





  typedef boost::shared_ptr< ::pb_msgs::ContiList_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pb_msgs::ContiList_<ContainerAllocator> const> ConstPtr;

}; // struct ContiList_

typedef ::pb_msgs::ContiList_<std::allocator<void> > ContiList;

typedef boost::shared_ptr< ::pb_msgs::ContiList > ContiListPtr;
typedef boost::shared_ptr< ::pb_msgs::ContiList const> ContiListConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pb_msgs::ContiList_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pb_msgs::ContiList_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pb_msgs::ContiList_<ContainerAllocator1> & lhs, const ::pb_msgs::ContiList_<ContainerAllocator2> & rhs)
{
  return lhs.nof_objects == rhs.nof_objects &&
    lhs.meas_counter == rhs.meas_counter &&
    lhs.interface_version == rhs.interface_version;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pb_msgs::ContiList_<ContainerAllocator1> & lhs, const ::pb_msgs::ContiList_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pb_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::pb_msgs::ContiList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pb_msgs::ContiList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pb_msgs::ContiList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pb_msgs::ContiList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pb_msgs::ContiList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pb_msgs::ContiList_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pb_msgs::ContiList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2a28291b0d17e16489f6a48ab5e30241";
  }

  static const char* value(const ::pb_msgs::ContiList_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2a28291b0d17e164ULL;
  static const uint64_t static_value2 = 0x89f6a48ab5e30241ULL;
};

template<class ContainerAllocator>
struct DataType< ::pb_msgs::ContiList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pb_msgs/ContiList";
  }

  static const char* value(const ::pb_msgs::ContiList_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pb_msgs::ContiList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 nof_objects\n"
"uint32 meas_counter\n"
"uint8 interface_version\n"
;
  }

  static const char* value(const ::pb_msgs::ContiList_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pb_msgs::ContiList_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nof_objects);
      stream.next(m.meas_counter);
      stream.next(m.interface_version);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ContiList_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pb_msgs::ContiList_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pb_msgs::ContiList_<ContainerAllocator>& v)
  {
    s << indent << "nof_objects: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.nof_objects);
    s << indent << "meas_counter: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.meas_counter);
    s << indent << "interface_version: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.interface_version);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PB_MSGS_MESSAGE_CONTILIST_H
