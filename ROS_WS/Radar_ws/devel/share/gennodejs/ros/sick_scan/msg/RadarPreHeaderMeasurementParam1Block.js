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

class RadarPreHeaderMeasurementParam1Block {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.uiCycleDuration = null;
      this.uiNoiseLevel = null;
    }
    else {
      if (initObj.hasOwnProperty('uiCycleDuration')) {
        this.uiCycleDuration = initObj.uiCycleDuration
      }
      else {
        this.uiCycleDuration = 0;
      }
      if (initObj.hasOwnProperty('uiNoiseLevel')) {
        this.uiNoiseLevel = initObj.uiNoiseLevel
      }
      else {
        this.uiNoiseLevel = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarPreHeaderMeasurementParam1Block
    // Serialize message field [uiCycleDuration]
    bufferOffset = _serializer.uint32(obj.uiCycleDuration, buffer, bufferOffset);
    // Serialize message field [uiNoiseLevel]
    bufferOffset = _serializer.uint32(obj.uiNoiseLevel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarPreHeaderMeasurementParam1Block
    let len;
    let data = new RadarPreHeaderMeasurementParam1Block(null);
    // Deserialize message field [uiCycleDuration]
    data.uiCycleDuration = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [uiNoiseLevel]
    data.uiNoiseLevel = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/RadarPreHeaderMeasurementParam1Block';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '34fa13bb693fa69fead0a46da987eb62';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 uiCycleDuration # Time in microseconds to detect this items
    uint32 uiNoiseLevel # [1/100dB]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarPreHeaderMeasurementParam1Block(null);
    if (msg.uiCycleDuration !== undefined) {
      resolved.uiCycleDuration = msg.uiCycleDuration;
    }
    else {
      resolved.uiCycleDuration = 0
    }

    if (msg.uiNoiseLevel !== undefined) {
      resolved.uiNoiseLevel = msg.uiNoiseLevel;
    }
    else {
      resolved.uiNoiseLevel = 0
    }

    return resolved;
    }
};

module.exports = RadarPreHeaderMeasurementParam1Block;
