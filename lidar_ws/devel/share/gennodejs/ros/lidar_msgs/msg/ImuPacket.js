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

class ImuPacket {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.imu_gyro = null;
      this.imu_accel = null;
      this.imu_magn = null;
      this.imu_euler = null;
      this.timestamp = null;
      this.id_num = null;
    }
    else {
      if (initObj.hasOwnProperty('imu_gyro')) {
        this.imu_gyro = initObj.imu_gyro
      }
      else {
        this.imu_gyro = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('imu_accel')) {
        this.imu_accel = initObj.imu_accel
      }
      else {
        this.imu_accel = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('imu_magn')) {
        this.imu_magn = initObj.imu_magn
      }
      else {
        this.imu_magn = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('imu_euler')) {
        this.imu_euler = initObj.imu_euler
      }
      else {
        this.imu_euler = new Array(3).fill(0);
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
    // Serializes a message object of type ImuPacket
    // Check that the constant length array field [imu_gyro] has the right length
    if (obj.imu_gyro.length !== 3) {
      throw new Error('Unable to serialize array field imu_gyro - length must be 3')
    }
    // Serialize message field [imu_gyro]
    bufferOffset = _arraySerializer.float32(obj.imu_gyro, buffer, bufferOffset, 3);
    // Check that the constant length array field [imu_accel] has the right length
    if (obj.imu_accel.length !== 3) {
      throw new Error('Unable to serialize array field imu_accel - length must be 3')
    }
    // Serialize message field [imu_accel]
    bufferOffset = _arraySerializer.float32(obj.imu_accel, buffer, bufferOffset, 3);
    // Check that the constant length array field [imu_magn] has the right length
    if (obj.imu_magn.length !== 3) {
      throw new Error('Unable to serialize array field imu_magn - length must be 3')
    }
    // Serialize message field [imu_magn]
    bufferOffset = _arraySerializer.float32(obj.imu_magn, buffer, bufferOffset, 3);
    // Check that the constant length array field [imu_euler] has the right length
    if (obj.imu_euler.length !== 3) {
      throw new Error('Unable to serialize array field imu_euler - length must be 3')
    }
    // Serialize message field [imu_euler]
    bufferOffset = _arraySerializer.float32(obj.imu_euler, buffer, bufferOffset, 3);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [id_num]
    bufferOffset = _serializer.uint64(obj.id_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImuPacket
    let len;
    let data = new ImuPacket(null);
    // Deserialize message field [imu_gyro]
    data.imu_gyro = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [imu_accel]
    data.imu_accel = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [imu_magn]
    data.imu_magn = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [imu_euler]
    data.imu_euler = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [id_num]
    data.id_num = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lidar_msgs/ImuPacket';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8ec3aca7e5b627e23bc444ef30e8bcd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[3] imu_gyro
    float32[3] imu_accel
    float32[3] imu_magn
    float32[3] imu_euler
    uint64 timestamp
    uint64 id_num
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImuPacket(null);
    if (msg.imu_gyro !== undefined) {
      resolved.imu_gyro = msg.imu_gyro;
    }
    else {
      resolved.imu_gyro = new Array(3).fill(0)
    }

    if (msg.imu_accel !== undefined) {
      resolved.imu_accel = msg.imu_accel;
    }
    else {
      resolved.imu_accel = new Array(3).fill(0)
    }

    if (msg.imu_magn !== undefined) {
      resolved.imu_magn = msg.imu_magn;
    }
    else {
      resolved.imu_magn = new Array(3).fill(0)
    }

    if (msg.imu_euler !== undefined) {
      resolved.imu_euler = msg.imu_euler;
    }
    else {
      resolved.imu_euler = new Array(3).fill(0)
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

module.exports = ImuPacket;
