// Auto-generated. Do not edit!

// (in-package lidar_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LaserPacket = require('./LaserPacket.js');
let ImuPacket = require('./ImuPacket.js');
let GPSPacket = require('./GPSPacket.js');

//-----------------------------------------------------------

class SynchrPacket {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.laserpkt = null;
      this.imupkt = null;
      this.gpspkt = null;
    }
    else {
      if (initObj.hasOwnProperty('laserpkt')) {
        this.laserpkt = initObj.laserpkt
      }
      else {
        this.laserpkt = new LaserPacket();
      }
      if (initObj.hasOwnProperty('imupkt')) {
        this.imupkt = initObj.imupkt
      }
      else {
        this.imupkt = new Array(12).fill(new ImuPacket());
      }
      if (initObj.hasOwnProperty('gpspkt')) {
        this.gpspkt = initObj.gpspkt
      }
      else {
        this.gpspkt = new GPSPacket();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SynchrPacket
    // Serialize message field [laserpkt]
    bufferOffset = LaserPacket.serialize(obj.laserpkt, buffer, bufferOffset);
    // Check that the constant length array field [imupkt] has the right length
    if (obj.imupkt.length !== 12) {
      throw new Error('Unable to serialize array field imupkt - length must be 12')
    }
    // Serialize message field [imupkt]
    obj.imupkt.forEach((val) => {
      bufferOffset = ImuPacket.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [gpspkt]
    bufferOffset = GPSPacket.serialize(obj.gpspkt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SynchrPacket
    let len;
    let data = new SynchrPacket(null);
    // Deserialize message field [laserpkt]
    data.laserpkt = LaserPacket.deserialize(buffer, bufferOffset);
    // Deserialize message field [imupkt]
    len = 12;
    data.imupkt = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.imupkt[i] = ImuPacket.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [gpspkt]
    data.gpspkt = GPSPacket.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 970;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lidar_msgs/SynchrPacket';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '78587254adf0ff3522b94defe9027af8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    LaserPacket laserpkt
    ImuPacket[12] imupkt
    GPSPacket gpspkt
    
    ================================================================================
    MSG: lidar_msgs/LaserPacket
    float32[12] Azimuth
    float32[192] distance
    uint64 timestamp
    uint64 id_num
    
    ================================================================================
    MSG: lidar_msgs/ImuPacket
    float32[3] imu_gyro
    float32[3] imu_accel
    float32[3] imu_magn
    float32[3] imu_euler
    uint64 timestamp
    uint64 id_num
    
    ================================================================================
    MSG: lidar_msgs/GPSPacket
    float64[3] ned_xyz
    float64[3] ned_uvw
    float64 heading
    uint8 gps_sats
    uint8 gps_mod
    uint64 timestamp
    uint64 id_num
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SynchrPacket(null);
    if (msg.laserpkt !== undefined) {
      resolved.laserpkt = LaserPacket.Resolve(msg.laserpkt)
    }
    else {
      resolved.laserpkt = new LaserPacket()
    }

    if (msg.imupkt !== undefined) {
      resolved.imupkt = new Array(12)
      for (let i = 0; i < resolved.imupkt.length; ++i) {
        if (msg.imupkt.length > i) {
          resolved.imupkt[i] = ImuPacket.Resolve(msg.imupkt[i]);
        }
        else {
          resolved.imupkt[i] = new ImuPacket();
        }
      }
    }
    else {
      resolved.imupkt = new Array(12).fill(new ImuPacket())
    }

    if (msg.gpspkt !== undefined) {
      resolved.gpspkt = GPSPacket.Resolve(msg.gpspkt)
    }
    else {
      resolved.gpspkt = new GPSPacket()
    }

    return resolved;
    }
};

module.exports = SynchrPacket;
