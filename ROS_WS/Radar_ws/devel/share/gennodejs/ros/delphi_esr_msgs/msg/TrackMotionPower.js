// Auto-generated. Do not edit!

// (in-package delphi_esr_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrackMotionPower {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.movableFast = null;
      this.movableSlow = null;
      this.moving = null;
      this.power = null;
    }
    else {
      if (initObj.hasOwnProperty('movableFast')) {
        this.movableFast = initObj.movableFast
      }
      else {
        this.movableFast = false;
      }
      if (initObj.hasOwnProperty('movableSlow')) {
        this.movableSlow = initObj.movableSlow
      }
      else {
        this.movableSlow = false;
      }
      if (initObj.hasOwnProperty('moving')) {
        this.moving = initObj.moving
      }
      else {
        this.moving = false;
      }
      if (initObj.hasOwnProperty('power')) {
        this.power = initObj.power
      }
      else {
        this.power = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackMotionPower
    // Serialize message field [movableFast]
    bufferOffset = _serializer.bool(obj.movableFast, buffer, bufferOffset);
    // Serialize message field [movableSlow]
    bufferOffset = _serializer.bool(obj.movableSlow, buffer, bufferOffset);
    // Serialize message field [moving]
    bufferOffset = _serializer.bool(obj.moving, buffer, bufferOffset);
    // Serialize message field [power]
    bufferOffset = _serializer.int8(obj.power, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackMotionPower
    let len;
    let data = new TrackMotionPower(null);
    // Deserialize message field [movableFast]
    data.movableFast = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [movableSlow]
    data.movableSlow = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [moving]
    data.moving = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [power]
    data.power = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/TrackMotionPower';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc0039fe6b619538bc897d0433ea31a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool  movableFast
    bool  movableSlow
    bool  moving
    int8 power
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackMotionPower(null);
    if (msg.movableFast !== undefined) {
      resolved.movableFast = msg.movableFast;
    }
    else {
      resolved.movableFast = false
    }

    if (msg.movableSlow !== undefined) {
      resolved.movableSlow = msg.movableSlow;
    }
    else {
      resolved.movableSlow = false
    }

    if (msg.moving !== undefined) {
      resolved.moving = msg.moving;
    }
    else {
      resolved.moving = false
    }

    if (msg.power !== undefined) {
      resolved.power = msg.power;
    }
    else {
      resolved.power = 0
    }

    return resolved;
    }
};

module.exports = TrackMotionPower;
