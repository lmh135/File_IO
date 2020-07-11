// Auto-generated. Do not edit!

// (in-package lidar_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GPSPacket {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ned_xyz = null;
      this.ned_uvw = null;
      this.heading = null;
      this.gps_sats = null;
      this.gps_mod = null;
      this.timestamp = null;
      this.id_num = null;
    }
    else {
      if (initObj.hasOwnProperty('ned_xyz')) {
        this.ned_xyz = initObj.ned_xyz
      }
      else {
        this.ned_xyz = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('ned_uvw')) {
        this.ned_uvw = initObj.ned_uvw
      }
      else {
        this.ned_uvw = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('gps_sats')) {
        this.gps_sats = initObj.gps_sats
      }
      else {
        this.gps_sats = 0;
      }
      if (initObj.hasOwnProperty('gps_mod')) {
        this.gps_mod = initObj.gps_mod
      }
      else {
        this.gps_mod = 0;
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('id_num')) {
        this.id_num = initObj.id_num
      }
      else {
        this.id_num = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPSPacket
    // Check that the constant length array field [ned_xyz] has the right length
    if (obj.ned_xyz.length !== 3) {
      throw new Error('Unable to serialize array field ned_xyz - length must be 3')
    }
    // Serialize message field [ned_xyz]
    bufferOffset = _arraySerializer.float64(obj.ned_xyz, buffer, bufferOffset, 3);
    // Check that the constant length array field [ned_uvw] has the right length
    if (obj.ned_uvw.length !== 3) {
      throw new Error('Unable to serialize array field ned_uvw - length must be 3')
    }
    // Serialize message field [ned_uvw]
    bufferOffset = _arraySerializer.float64(obj.ned_uvw, buffer, bufferOffset, 3);
    // Serialize message field [heading]
    bufferOffset = _serializer.float64(obj.heading, buffer, bufferOffset);
    // Serialize message field [gps_sats]
    bufferOffset = _serializer.uint8(obj.gps_sats, buffer, bufferOffset);
    // Serialize message field [gps_mod]
    bufferOffset = _serializer.uint8(obj.gps_mod, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [id_num]
    bufferOffset = _serializer.uint64(obj.id_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPSPacket
    let len;
    let data = new GPSPacket(null);
    // Deserialize message field [ned_xyz]
    data.ned_xyz = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [ned_uvw]
    data.ned_uvw = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [heading]
    data.heading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gps_sats]
    data.gps_sats = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gps_mod]
    data.gps_mod = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [id_num]
    data.id_num = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 74;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lidar_msgs/GPSPacket';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a75c55dfb0f58e67e04612fa1aa9ed1e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new GPSPacket(null);
    if (msg.ned_xyz !== undefined) {
      resolved.ned_xyz = msg.ned_xyz;
    }
    else {
      resolved.ned_xyz = new Array(3).fill(0)
    }

    if (msg.ned_uvw !== undefined) {
      resolved.ned_uvw = msg.ned_uvw;
    }
    else {
      resolved.ned_uvw = new Array(3).fill(0)
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.gps_sats !== undefined) {
      resolved.gps_sats = msg.gps_sats;
    }
    else {
      resolved.gps_sats = 0
    }

    if (msg.gps_mod !== undefined) {
      resolved.gps_mod = msg.gps_mod;
    }
    else {
      resolved.gps_mod = 0
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.id_num !== undefined) {
      resolved.id_num = msg.id_num;
    }
    else {
      resolved.id_num = 0
    }

    return resolved;
    }
};

module.exports = GPSPacket;
