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

class RadarPreHeaderStatusBlock {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.uiTelegramCount = null;
      this.uiCycleCount = null;
      this.udiSystemCountScan = null;
      this.udiSystemCountTransmit = null;
      this.uiInputs = null;
      this.uiOutputs = null;
    }
    else {
      if (initObj.hasOwnProperty('uiTelegramCount')) {
        this.uiTelegramCount = initObj.uiTelegramCount
      }
      else {
        this.uiTelegramCount = 0;
      }
      if (initObj.hasOwnProperty('uiCycleCount')) {
        this.uiCycleCount = initObj.uiCycleCount
      }
      else {
        this.uiCycleCount = 0;
      }
      if (initObj.hasOwnProperty('udiSystemCountScan')) {
        this.udiSystemCountScan = initObj.udiSystemCountScan
      }
      else {
        this.udiSystemCountScan = 0;
      }
      if (initObj.hasOwnProperty('udiSystemCountTransmit')) {
        this.udiSystemCountTransmit = initObj.udiSystemCountTransmit
      }
      else {
        this.udiSystemCountTransmit = 0;
      }
      if (initObj.hasOwnProperty('uiInputs')) {
        this.uiInputs = initObj.uiInputs
      }
      else {
        this.uiInputs = 0;
      }
      if (initObj.hasOwnProperty('uiOutputs')) {
        this.uiOutputs = initObj.uiOutputs
      }
      else {
        this.uiOutputs = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarPreHeaderStatusBlock
    // Serialize message field [uiTelegramCount]
    bufferOffset = _serializer.uint32(obj.uiTelegramCount, buffer, bufferOffset);
    // Serialize message field [uiCycleCount]
    bufferOffset = _serializer.uint32(obj.uiCycleCount, buffer, bufferOffset);
    // Serialize message field [udiSystemCountScan]
    bufferOffset = _serializer.uint32(obj.udiSystemCountScan, buffer, bufferOffset);
    // Serialize message field [udiSystemCountTransmit]
    bufferOffset = _serializer.uint32(obj.udiSystemCountTransmit, buffer, bufferOffset);
    // Serialize message field [uiInputs]
    bufferOffset = _serializer.uint16(obj.uiInputs, buffer, bufferOffset);
    // Serialize message field [uiOutputs]
    bufferOffset = _serializer.uint16(obj.uiOutputs, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarPreHeaderStatusBlock
    let len;
    let data = new RadarPreHeaderStatusBlock(null);
    // Deserialize message field [uiTelegramCount]
    data.uiTelegramCount = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [uiCycleCount]
    data.uiCycleCount = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [udiSystemCountScan]
    data.udiSystemCountScan = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [udiSystemCountTransmit]
    data.udiSystemCountTransmit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [uiInputs]
    data.uiInputs = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [uiOutputs]
    data.uiOutputs = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/RadarPreHeaderStatusBlock';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fa00447ba5857e64792524ca30b37274';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    #
    #
    uint32 uiTelegramCount # telegram number
    uint32 uiCycleCount # "scan number"
    uint32 udiSystemCountScan # system time since power on of scan gen. [us]
    uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]
    uint16 uiInputs # state of digital inputs
    uint16 uiOutputs # state of digital outputs
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarPreHeaderStatusBlock(null);
    if (msg.uiTelegramCount !== undefined) {
      resolved.uiTelegramCount = msg.uiTelegramCount;
    }
    else {
      resolved.uiTelegramCount = 0
    }

    if (msg.uiCycleCount !== undefined) {
      resolved.uiCycleCount = msg.uiCycleCount;
    }
    else {
      resolved.uiCycleCount = 0
    }

    if (msg.udiSystemCountScan !== undefined) {
      resolved.udiSystemCountScan = msg.udiSystemCountScan;
    }
    else {
      resolved.udiSystemCountScan = 0
    }

    if (msg.udiSystemCountTransmit !== undefined) {
      resolved.udiSystemCountTransmit = msg.udiSystemCountTransmit;
    }
    else {
      resolved.udiSystemCountTransmit = 0
    }

    if (msg.uiInputs !== undefined) {
      resolved.uiInputs = msg.uiInputs;
    }
    else {
      resolved.uiInputs = 0
    }

    if (msg.uiOutputs !== undefined) {
      resolved.uiOutputs = msg.uiOutputs;
    }
    else {
      resolved.uiOutputs = 0
    }

    return resolved;
    }
};

module.exports = RadarPreHeaderStatusBlock;
