// Auto-generated. Do not edit!

// (in-package pb_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ClusterList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nof_targetsnear = null;
      this.nof_targetsfar = null;
      this.meas_counter = null;
      this.interface_version = null;
    }
    else {
      if (initObj.hasOwnProperty('nof_targetsnear')) {
        this.nof_targetsnear = initObj.nof_targetsnear
      }
      else {
        this.nof_targetsnear = 0;
      }
      if (initObj.hasOwnProperty('nof_targetsfar')) {
        this.nof_targetsfar = initObj.nof_targetsfar
      }
      else {
        this.nof_targetsfar = 0;
      }
      if (initObj.hasOwnProperty('meas_counter')) {
        this.meas_counter = initObj.meas_counter
      }
      else {
        this.meas_counter = 0;
      }
      if (initObj.hasOwnProperty('interface_version')) {
        this.interface_version = initObj.interface_version
      }
      else {
        this.interface_version = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ClusterList
    // Serialize message field [nof_targetsnear]
    bufferOffset = _serializer.uint8(obj.nof_targetsnear, buffer, bufferOffset);
    // Serialize message field [nof_targetsfar]
    bufferOffset = _serializer.uint8(obj.nof_targetsfar, buffer, bufferOffset);
    // Serialize message field [meas_counter]
    bufferOffset = _serializer.uint32(obj.meas_counter, buffer, bufferOffset);
    // Serialize message field [interface_version]
    bufferOffset = _serializer.uint8(obj.interface_version, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClusterList
    let len;
    let data = new ClusterList(null);
    // Deserialize message field [nof_targetsnear]
    data.nof_targetsnear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [nof_targetsfar]
    data.nof_targetsfar = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [meas_counter]
    data.meas_counter = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [interface_version]
    data.interface_version = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pb_msgs/ClusterList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95a654931a9c98d760080cd397e1011c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 nof_targetsnear
    uint8 nof_targetsfar
    uint32 meas_counter
    uint8 interface_version
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ClusterList(null);
    if (msg.nof_targetsnear !== undefined) {
      resolved.nof_targetsnear = msg.nof_targetsnear;
    }
    else {
      resolved.nof_targetsnear = 0
    }

    if (msg.nof_targetsfar !== undefined) {
      resolved.nof_targetsfar = msg.nof_targetsfar;
    }
    else {
      resolved.nof_targetsfar = 0
    }

    if (msg.meas_counter !== undefined) {
      resolved.meas_counter = msg.meas_counter;
    }
    else {
      resolved.meas_counter = 0
    }

    if (msg.interface_version !== undefined) {
      resolved.interface_version = msg.interface_version;
    }
    else {
      resolved.interface_version = 0
    }

    return resolved;
    }
};

module.exports = ClusterList;
