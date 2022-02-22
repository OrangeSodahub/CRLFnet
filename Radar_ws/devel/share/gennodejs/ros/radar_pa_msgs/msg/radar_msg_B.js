// Auto-generated. Do not edit!

// (in-package radar_pa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class radar_msg_B {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.message = null;
      this.ID = null;
      this.distance_deviation = null;
      this.velocity_deviation = null;
      this.angle_deviation = null;
      this.proability_target = null;
      this.counter = null;
    }
    else {
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = 0;
      }
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('distance_deviation')) {
        this.distance_deviation = initObj.distance_deviation
      }
      else {
        this.distance_deviation = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_deviation')) {
        this.velocity_deviation = initObj.velocity_deviation
      }
      else {
        this.velocity_deviation = 0.0;
      }
      if (initObj.hasOwnProperty('angle_deviation')) {
        this.angle_deviation = initObj.angle_deviation
      }
      else {
        this.angle_deviation = 0.0;
      }
      if (initObj.hasOwnProperty('proability_target')) {
        this.proability_target = initObj.proability_target
      }
      else {
        this.proability_target = 0.0;
      }
      if (initObj.hasOwnProperty('counter')) {
        this.counter = initObj.counter
      }
      else {
        this.counter = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type radar_msg_B
    // Serialize message field [message]
    bufferOffset = _serializer.uint8(obj.message, buffer, bufferOffset);
    // Serialize message field [ID]
    bufferOffset = _serializer.uint32(obj.ID, buffer, bufferOffset);
    // Serialize message field [distance_deviation]
    bufferOffset = _serializer.float32(obj.distance_deviation, buffer, bufferOffset);
    // Serialize message field [velocity_deviation]
    bufferOffset = _serializer.float32(obj.velocity_deviation, buffer, bufferOffset);
    // Serialize message field [angle_deviation]
    bufferOffset = _serializer.float32(obj.angle_deviation, buffer, bufferOffset);
    // Serialize message field [proability_target]
    bufferOffset = _serializer.float32(obj.proability_target, buffer, bufferOffset);
    // Serialize message field [counter]
    bufferOffset = _serializer.uint8(obj.counter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type radar_msg_B
    let len;
    let data = new radar_msg_B(null);
    // Deserialize message field [message]
    data.message = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [distance_deviation]
    data.distance_deviation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity_deviation]
    data.velocity_deviation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle_deviation]
    data.angle_deviation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proability_target]
    data.proability_target = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [counter]
    data.counter = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'radar_pa_msgs/radar_msg_B';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '596d24d33b8a883eb8423004f314ff5f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   message
    uint32  ID
    float32 distance_deviation
    float32 velocity_deviation
    float32 angle_deviation
    float32 proability_target
    uint8   counter
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new radar_msg_B(null);
    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = 0
    }

    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.distance_deviation !== undefined) {
      resolved.distance_deviation = msg.distance_deviation;
    }
    else {
      resolved.distance_deviation = 0.0
    }

    if (msg.velocity_deviation !== undefined) {
      resolved.velocity_deviation = msg.velocity_deviation;
    }
    else {
      resolved.velocity_deviation = 0.0
    }

    if (msg.angle_deviation !== undefined) {
      resolved.angle_deviation = msg.angle_deviation;
    }
    else {
      resolved.angle_deviation = 0.0
    }

    if (msg.proability_target !== undefined) {
      resolved.proability_target = msg.proability_target;
    }
    else {
      resolved.proability_target = 0.0
    }

    if (msg.counter !== undefined) {
      resolved.counter = msg.counter;
    }
    else {
      resolved.counter = 0
    }

    return resolved;
    }
};

module.exports = radar_msg_B;
