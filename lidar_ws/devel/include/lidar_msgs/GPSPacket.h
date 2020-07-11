// Generated by gencpp from file lidar_msgs/GPSPacket.msg
// DO NOT EDIT!


#ifndef LIDAR_MSGS_MESSAGE_GPSPACKET_H
#define LIDAR_MSGS_MESSAGE_GPSPACKET_H


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
struct GPSPacket_
{
  typedef GPSPacket_<ContainerAllocator> Type;

  GPSPacket_()
    : ned_xyz()
    , ned_uvw()
    , heading(0.0)
    , gps_sats(0)
    , gps_mod(0)
    , timestamp(0)
    , id_num(0)  {
      ned_xyz.assign(0.0);

      ned_uvw.assign(0.0);
  }
  GPSPacket_(const ContainerAllocator& _alloc)
    : ned_xyz()
    , ned_uvw()
    , heading(0.0)
    , gps_sats(0)
    , gps_mod(0)
    , timestamp(0)
    , id_num(0)  {
  (void)_alloc;
      ned_xyz.assign(0.0);

      ned_uvw.assign(0.0);
  }



   typedef boost::array<double, 3>  _ned_xyz_type;
  _ned_xyz_type ned_xyz;

   typedef boost::array<double, 3>  _ned_uvw_type;
  _ned_uvw_type ned_uvw;

   typedef double _heading_type;
  _heading_type heading;

   typedef uint8_t _gps_sats_type;
  _gps_sats_type gps_sats;

   typedef uint8_t _gps_mod_type;
  _gps_mod_type gps_mod;

   typedef uint64_t _timestamp_type;
  _timestamp_type timestamp;

   typedef uint64_t _id_num_type;
  _id_num_type id_num;





  typedef boost::shared_ptr< ::lidar_msgs::GPSPacket_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lidar_msgs::GPSPacket_<ContainerAllocator> const> ConstPtr;

}; // struct GPSPacket_

typedef ::lidar_msgs::GPSPacket_<std::allocator<void> > GPSPacket;

typedef boost::shared_ptr< ::lidar_msgs::GPSPacket > GPSPacketPtr;
typedef boost::shared_ptr< ::lidar_msgs::GPSPacket const> GPSPacketConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lidar_msgs::GPSPacket_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lidar_msgs::GPSPacket_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lidar_msgs::GPSPacket_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lidar_msgs::GPSPacket_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lidar_msgs::GPSPacket_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a75c55dfb0f58e67e04612fa1aa9ed1e";
  }

  static const char* value(const ::lidar_msgs::GPSPacket_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa75c55dfb0f58e67ULL;
  static const uint64_t static_value2 = 0xe04612fa1aa9ed1eULL;
};

template<class ContainerAllocator>
struct DataType< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lidar_msgs/GPSPacket";
  }

  static const char* value(const ::lidar_msgs::GPSPacket_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[3] ned_xyz\n\
float64[3] ned_uvw\n\
float64 heading\n\
uint8 gps_sats\n\
uint8 gps_mod\n\
uint64 timestamp\n\
uint64 id_num\n\
";
  }

  static const char* value(const ::lidar_msgs::GPSPacket_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ned_xyz);
      stream.next(m.ned_uvw);
      stream.next(m.heading);
      stream.next(m.gps_sats);
      stream.next(m.gps_mod);
      stream.next(m.timestamp);
      stream.next(m.id_num);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GPSPacket_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lidar_msgs::GPSPacket_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lidar_msgs::GPSPacket_<ContainerAllocator>& v)
  {
    s << indent << "ned_xyz[]" << std::endl;
    for (size_t i = 0; i < v.ned_xyz.size(); ++i)
    {
      s << indent << "  ned_xyz[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.ned_xyz[i]);
    }
    s << indent << "ned_uvw[]" << std::endl;
    for (size_t i = 0; i < v.ned_uvw.size(); ++i)
    {
      s << indent << "  ned_uvw[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.ned_uvw[i]);
    }
    s << indent << "heading: ";
    Printer<double>::stream(s, indent + "  ", v.heading);
    s << indent << "gps_sats: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gps_sats);
    s << indent << "gps_mod: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gps_mod);
    s << indent << "timestamp: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.timestamp);
    s << indent << "id_num: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.id_num);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LIDAR_MSGS_MESSAGE_GPSPACKET_H