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

class LaserPacket {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Azimuth = null;
      this.distance = null;
      this.timestamp = null;
      this.id_num = null;
    }
    else {
      if (initObj.hasOwnProperty('Azimuth')) {
        this.Azimuth = initObj.Azimuth
      }
      else {
        this.Azimuth = new Array(12).fill(0);
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = new Array(192).fill(0);
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
    // Serializes a message object of type LaserPacket
    // Check that the constant length array field [Azimuth] has the right length
    if (obj.Azimuth.length !== 12) {
      throw new Error('Unable to serialize array field Azimuth - length must be 12')
    }
    // Serialize message field [Azimuth]
    bufferOffset = _arraySerializer.float32(obj.Azimuth, buffer, bufferOffset, 12);
    // Check that the constant length array field [distance] has the right length
    if (obj.distance.length !== 192) {
      throw new Error('Unable to serialize array field distance - length must be 192')
    }
    // Serialize message field [distance]
    bufferOffset = _arraySerializer.float32(obj.distance, buffer, bufferOffset, 192);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [id_num]
    bufferOffset = _serializer.uint64(obj.id_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaserPacket
    let len;
    let data = new LaserPacket(null);
    // Deserialize message field [Azimuth]
    data.Azimuth = _arrayDeserializer.float32(buffer, bufferOffset, 12)
    // Deserialize message field [distance]
    data.distance = _arrayDeserializer.float32(buffer, bufferOffset, 192)
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [id_num]
    data.id_num = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 832;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lidar_msgs/LaserPacket';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '61992e7cac699d037e7a874f2eedcf02';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[12] Azimuth
    float32[192] distance
    uint64 timestamp
    uint64 id_num
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LaserPacket(null);
    if (msg.Azimuth !== undefined) {
      resolved.Azimuth = msg.Azimuth;
    }
    else {
      resolved.Azimuth = new Array(12).fill(0)
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = new Array(192).fill(0)
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

module.exports = LaserPacket;
