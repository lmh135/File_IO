// Generated by gencpp from file lidar_msgs/LaserPacket.msg
// DO NOT EDIT!


#ifndef LIDAR_MSGS_MESSAGE_LASERPACKET_H
#define LIDAR_MSGS_MESSAGE_LASERPACKET_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace lidar_msgs
{
template <class ContainerAllocator>
struct LaserPacket_
{
  typedef LaserPacket_<ContainerAllocator> Type;

  LaserPacket_()
    : Azimuth()
    , distance()
    , timestamp(0)
    , id_num(0)  {
      Azimuth.assign(0.0);

      distance.assign(0.0);
  }
  LaserPacket_(const ContainerAllocator& _alloc)
    : Azimuth()
    , distance()
    , timestamp(0)
    , id_num(0)  {
  (void)_alloc;
      Azimuth.assign(0.0);

      distance.assign(0.0);
  }



   typedef boost::array<float, 12>  _Azimuth_type;
  _Azimuth_type Azimuth;

   typedef boost::array<float, 192>  _distance_type;
  _distance_type distance;

   typedef uint64_t _timestamp_type;
  _timestamp_type timestamp;

   typedef uint64_t _id_num_type;
  _id_num_type id_num;





  typedef boost::shared_ptr< ::lidar_msgs::LaserPacket_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lidar_msgs::LaserPacket_<ContainerAllocator> const> ConstPtr;

}; // struct LaserPacket_

typedef ::lidar_msgs::LaserPacket_<std::allocator<void> > LaserPacket;

typedef boost::shared_ptr< ::lidar_msgs::LaserPacket > LaserPacketPtr;
typedef boost::shared_ptr< ::lidar_msgs::LaserPacket const> LaserPacketConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lidar_msgs::LaserPacket_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lidar_msgs::LaserPacket_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace lidar_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'lidar_msgs': ['/home/longmen/lidar_ws/src/lidar_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lidar_msgs::LaserPacket_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lidar_msgs::LaserPacket_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lidar_msgs::LaserPacket_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
{
  static const char* value()
  {
    return "61992e7cac699d037e7a874f2eedcf02";
  }

  static const char* value(const ::lidar_msgs::LaserPacket_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x61992e7cac699d03ULL;
  static const uint64_t static_value2 = 0x7e7a874f2eedcf02ULL;
};

template<class ContainerAllocator>
struct DataType< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lidar_msgs/LaserPacket";
  }

  static const char* value(const ::lidar_msgs::LaserPacket_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[12] Azimuth\n\
float32[192] distance\n\
uint64 timestamp\n\
uint64 id_num\n\
";
  }

  static const char* value(const ::lidar_msgs::LaserPacket_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Azimuth);
      stream.next(m.distance);
      stream.next(m.timestamp);
      stream.next(m.id_num);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LaserPacket_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lidar_msgs::LaserPacket_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lidar_msgs::LaserPacket_<ContainerAllocator>& v)
  {
    s << indent << "Azimuth[]" << std::endl;
    for (size_t i = 0; i < v.Azimuth.size(); ++i)
    {
      s << indent << "  Azimuth[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.Azimuth[i]);
    }
    s << indent << "distance[]" << std::endl;
    for (size_t i = 0; i < v.distance.size(); ++i)
    {
      s << indent << "  distance[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.distance[i]);
    }
    s << indent << "timestamp: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.timestamp);
    s << indent << "id_num: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.id_num);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LIDAR_MSGS_MESSAGE_LASERPACKET_H
