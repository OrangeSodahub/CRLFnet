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

class ContiList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nof_objects = null;
      this.meas_counter = null;
      this.interface_version = null;
    }
    else {
      if (initObj.hasOwnProperty('nof_objects')) {
        this.nof_objects = initObj.nof_objects
      }
      else {
        this.nof_objects = 0;
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
    // Serializes a message object of type ContiList
    // Serialize message field [nof_objects]
    bufferOffset = _serializer.uint8(obj.nof_objects, buffer, bufferOffset);
    // Serialize message field [meas_counter]
    bufferOffset = _serializer.uint32(obj.meas_counter, buffer, bufferOffset);
    // Serialize message field [interface_version]
    bufferOffset = _serializer.uint8(obj.interface_version, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ContiList
    let len;
    let data = new ContiList(null);
    // Deserialize message field [nof_objects]
    data.nof_objects = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [meas_counter]
    data.meas_counter = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [interface_version]
    data.interface_version = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pb_msgs/ContiList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2a28291b0d17e16489f6a48ab5e30241';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 nof_objects
    uint32 meas_counter
    uint8 interface_version
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ContiList(null);
    if (msg.nof_objects !== undefined) {
      resolved.nof_objects = msg.nof_objects;
    }
    else {
      resolved.nof_objects = 0
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

module.exports = ContiList;
