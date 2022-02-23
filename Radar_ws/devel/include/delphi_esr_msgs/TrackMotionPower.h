// Generated by gencpp from file delphi_esr_msgs/TrackMotionPower.msg
// DO NOT EDIT!


#ifndef DELPHI_ESR_MSGS_MESSAGE_TRACKMOTIONPOWER_H
#define DELPHI_ESR_MSGS_MESSAGE_TRACKMOTIONPOWER_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace delphi_esr_msgs
{
template <class ContainerAllocator>
struct TrackMotionPower_
{
  typedef TrackMotionPower_<ContainerAllocator> Type;

  TrackMotionPower_()
    : movableFast(false)
    , movableSlow(false)
    , moving(false)
    , power(0)  {
    }
  TrackMotionPower_(const ContainerAllocator& _alloc)
    : movableFast(false)
    , movableSlow(false)
    , moving(false)
    , power(0)  {
  (void)_alloc;
    }



   typedef uint8_t _movableFast_type;
  _movableFast_type movableFast;

   typedef uint8_t _movableSlow_type;
  _movableSlow_type movableSlow;

   typedef uint8_t _moving_type;
  _moving_type moving;

   typedef int8_t _power_type;
  _power_type power;





  typedef boost::shared_ptr< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> const> ConstPtr;

}; // struct TrackMotionPower_

typedef ::delphi_esr_msgs::TrackMotionPower_<std::allocator<void> > TrackMotionPower;

typedef boost::shared_ptr< ::delphi_esr_msgs::TrackMotionPower > TrackMotionPowerPtr;
typedef boost::shared_ptr< ::delphi_esr_msgs::TrackMotionPower const> TrackMotionPowerConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator1> & lhs, const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator2> & rhs)
{
  return lhs.movableFast == rhs.movableFast &&
    lhs.movableSlow == rhs.movableSlow &&
    lhs.moving == rhs.moving &&
    lhs.power == rhs.power;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator1> & lhs, const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace delphi_esr_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bc0039fe6b619538bc897d0433ea31a8";
  }

  static const char* value(const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbc0039fe6b619538ULL;
  static const uint64_t static_value2 = 0xbc897d0433ea31a8ULL;
};

template<class ContainerAllocator>
struct DataType< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
{
  static const char* value()
  {
    return "delphi_esr_msgs/TrackMotionPower";
  }

  static const char* value(const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool  movableFast\n"
"bool  movableSlow\n"
"bool  moving\n"
"int8 power\n"
;
  }

  static const char* value(const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.movableFast);
      stream.next(m.movableSlow);
      stream.next(m.moving);
      stream.next(m.power);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TrackMotionPower_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::delphi_esr_msgs::TrackMotionPower_<ContainerAllocator>& v)
  {
    s << indent << "movableFast: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.movableFast);
    s << indent << "movableSlow: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.movableSlow);
    s << indent << "moving: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.moving);
    s << indent << "power: ";
    Printer<int8_t>::stream(s, indent + "  ", v.power);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DELPHI_ESR_MSGS_MESSAGE_TRACKMOTIONPOWER_H
