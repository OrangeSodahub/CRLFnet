// Auto-generated. Do not edit!

// (in-package sick_scan.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RadarPreHeaderEncoderBlock {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.udiEncoderPos = null;
      this.iEncoderSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('udiEncoderPos')) {
        this.udiEncoderPos = initObj.udiEncoderPos
      }
      else {
        this.udiEncoderPos = 0;
      }
      if (initObj.hasOwnProperty('iEncoderSpeed')) {
        this.iEncoderSpeed = initObj.iEncoderSpeed
      }
      else {
        this.iEncoderSpeed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarPreHeaderEncoderBlock
    // Serialize message field [udiEncoderPos]
    bufferOffset = _serializer.uint32(obj.udiEncoderPos, buffer, bufferOffset);
    // Serialize message field [iEncoderSpeed]
    bufferOffset = _serializer.int16(obj.iEncoderSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarPreHeaderEncoderBlock
    let len;
    let data = new RadarPreHeaderEncoderBlock(null);
    // Deserialize message field [udiEncoderPos]
    data.udiEncoderPos = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [iEncoderSpeed]
    data.iEncoderSpeed = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/RadarPreHeaderEncoderBlock';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5af720e8adc927dc42f34b3cd0d0e8e9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Array with connected encoder sensors
    uint32 udiEncoderPos  # encoder position [inc]
    int16 iEncoderSpeed   # encoder speed [inc/mm]
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarPreHeaderEncoderBlock(null);
    if (msg.udiEncoderPos !== undefined) {
      resolved.udiEncoderPos = msg.udiEncoderPos;
    }
    else {
      resolved.udiEncoderPos = 0
    }

    if (msg.iEncoderSpeed !== undefined) {
      resolved.iEncoderSpeed = msg.iEncoderSpeed;
    }
    else {
      resolved.iEncoderSpeed = 0
    }

    return resolved;
    }
};

module.exports = RadarPreHeaderEncoderBlock;
