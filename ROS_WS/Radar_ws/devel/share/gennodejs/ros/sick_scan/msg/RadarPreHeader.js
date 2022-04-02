// Auto-generated. Do not edit!

// (in-package sick_scan.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RadarPreHeaderDeviceBlock = require('./RadarPreHeaderDeviceBlock.js');
let RadarPreHeaderStatusBlock = require('./RadarPreHeaderStatusBlock.js');
let RadarPreHeaderMeasurementParam1Block = require('./RadarPreHeaderMeasurementParam1Block.js');
let RadarPreHeaderEncoderBlock = require('./RadarPreHeaderEncoderBlock.js');

//-----------------------------------------------------------

class RadarPreHeader {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.uiVersionNo = null;
      this.radarPreHeaderDeviceBlock = null;
      this.radarPreHeaderStatusBlock = null;
      this.radarPreHeaderMeasurementParam1Block = null;
      this.radarPreHeaderArrayEncoderBlock = null;
    }
    else {
      if (initObj.hasOwnProperty('uiVersionNo')) {
        this.uiVersionNo = initObj.uiVersionNo
      }
      else {
        this.uiVersionNo = 0;
      }
      if (initObj.hasOwnProperty('radarPreHeaderDeviceBlock')) {
        this.radarPreHeaderDeviceBlock = initObj.radarPreHeaderDeviceBlock
      }
      else {
        this.radarPreHeaderDeviceBlock = new RadarPreHeaderDeviceBlock();
      }
      if (initObj.hasOwnProperty('radarPreHeaderStatusBlock')) {
        this.radarPreHeaderStatusBlock = initObj.radarPreHeaderStatusBlock
      }
      else {
        this.radarPreHeaderStatusBlock = new RadarPreHeaderStatusBlock();
      }
      if (initObj.hasOwnProperty('radarPreHeaderMeasurementParam1Block')) {
        this.radarPreHeaderMeasurementParam1Block = initObj.radarPreHeaderMeasurementParam1Block
      }
      else {
        this.radarPreHeaderMeasurementParam1Block = new RadarPreHeaderMeasurementParam1Block();
      }
      if (initObj.hasOwnProperty('radarPreHeaderArrayEncoderBlock')) {
        this.radarPreHeaderArrayEncoderBlock = initObj.radarPreHeaderArrayEncoderBlock
      }
      else {
        this.radarPreHeaderArrayEncoderBlock = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarPreHeader
    // Serialize message field [uiVersionNo]
    bufferOffset = _serializer.uint16(obj.uiVersionNo, buffer, bufferOffset);
    // Serialize message field [radarPreHeaderDeviceBlock]
    bufferOffset = RadarPreHeaderDeviceBlock.serialize(obj.radarPreHeaderDeviceBlock, buffer, bufferOffset);
    // Serialize message field [radarPreHeaderStatusBlock]
    bufferOffset = RadarPreHeaderStatusBlock.serialize(obj.radarPreHeaderStatusBlock, buffer, bufferOffset);
    // Serialize message field [radarPreHeaderMeasurementParam1Block]
    bufferOffset = RadarPreHeaderMeasurementParam1Block.serialize(obj.radarPreHeaderMeasurementParam1Block, buffer, bufferOffset);
    // Serialize message field [radarPreHeaderArrayEncoderBlock]
    // Serialize the length for message field [radarPreHeaderArrayEncoderBlock]
    bufferOffset = _serializer.uint32(obj.radarPreHeaderArrayEncoderBlock.length, buffer, bufferOffset);
    obj.radarPreHeaderArrayEncoderBlock.forEach((val) => {
      bufferOffset = RadarPreHeaderEncoderBlock.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarPreHeader
    let len;
    let data = new RadarPreHeader(null);
    // Deserialize message field [uiVersionNo]
    data.uiVersionNo = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [radarPreHeaderDeviceBlock]
    data.radarPreHeaderDeviceBlock = RadarPreHeaderDeviceBlock.deserialize(buffer, bufferOffset);
    // Deserialize message field [radarPreHeaderStatusBlock]
    data.radarPreHeaderStatusBlock = RadarPreHeaderStatusBlock.deserialize(buffer, bufferOffset);
    // Deserialize message field [radarPreHeaderMeasurementParam1Block]
    data.radarPreHeaderMeasurementParam1Block = RadarPreHeaderMeasurementParam1Block.deserialize(buffer, bufferOffset);
    // Deserialize message field [radarPreHeaderArrayEncoderBlock]
    // Deserialize array length for message field [radarPreHeaderArrayEncoderBlock]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.radarPreHeaderArrayEncoderBlock = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.radarPreHeaderArrayEncoderBlock[i] = RadarPreHeaderEncoderBlock.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 6 * object.radarPreHeaderArrayEncoderBlock.length;
    return length + 45;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/RadarPreHeader';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2b96d942f26bd5b00da7e631bf199685';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Version information for this whole structure (MeasurementData)
    uint16 uiVersionNo
    sick_scan/RadarPreHeaderDeviceBlock radarPreHeaderDeviceBlock
    sick_scan/RadarPreHeaderStatusBlock radarPreHeaderStatusBlock
    sick_scan/RadarPreHeaderMeasurementParam1Block radarPreHeaderMeasurementParam1Block
    sick_scan/RadarPreHeaderEncoderBlock[] radarPreHeaderArrayEncoderBlock
    
    
    ================================================================================
    MSG: sick_scan/RadarPreHeaderDeviceBlock
    #
    #
    #
    #
    
    # Logical number of the device"
    uint32 uiIdent
    # Serial number of the device
    uint32 udiSerialNo
    # State of the device
    bool bDeviceError
    # Contamination Warning
    bool bContaminationWarning
    # Contamination Error
    bool bContaminationError
    ================================================================================
    MSG: sick_scan/RadarPreHeaderStatusBlock
    #
    #
    #
    uint32 uiTelegramCount # telegram number
    uint32 uiCycleCount # "scan number"
    uint32 udiSystemCountScan # system time since power on of scan gen. [us]
    uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]
    uint16 uiInputs # state of digital inputs
    uint16 uiOutputs # state of digital outputs
    
    ================================================================================
    MSG: sick_scan/RadarPreHeaderMeasurementParam1Block
    uint32 uiCycleDuration # Time in microseconds to detect this items
    uint32 uiNoiseLevel # [1/100dB]
    
    ================================================================================
    MSG: sick_scan/RadarPreHeaderEncoderBlock
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
    const resolved = new RadarPreHeader(null);
    if (msg.uiVersionNo !== undefined) {
      resolved.uiVersionNo = msg.uiVersionNo;
    }
    else {
      resolved.uiVersionNo = 0
    }

    if (msg.radarPreHeaderDeviceBlock !== undefined) {
      resolved.radarPreHeaderDeviceBlock = RadarPreHeaderDeviceBlock.Resolve(msg.radarPreHeaderDeviceBlock)
    }
    else {
      resolved.radarPreHeaderDeviceBlock = new RadarPreHeaderDeviceBlock()
    }

    if (msg.radarPreHeaderStatusBlock !== undefined) {
      resolved.radarPreHeaderStatusBlock = RadarPreHeaderStatusBlock.Resolve(msg.radarPreHeaderStatusBlock)
    }
    else {
      resolved.radarPreHeaderStatusBlock = new RadarPreHeaderStatusBlock()
    }

    if (msg.radarPreHeaderMeasurementParam1Block !== undefined) {
      resolved.radarPreHeaderMeasurementParam1Block = RadarPreHeaderMeasurementParam1Block.Resolve(msg.radarPreHeaderMeasurementParam1Block)
    }
    else {
      resolved.radarPreHeaderMeasurementParam1Block = new RadarPreHeaderMeasurementParam1Block()
    }

    if (msg.radarPreHeaderArrayEncoderBlock !== undefined) {
      resolved.radarPreHeaderArrayEncoderBlock = new Array(msg.radarPreHeaderArrayEncoderBlock.length);
      for (let i = 0; i < resolved.radarPreHeaderArrayEncoderBlock.length; ++i) {
        resolved.radarPreHeaderArrayEncoderBlock[i] = RadarPreHeaderEncoderBlock.Resolve(msg.radarPreHeaderArrayEncoderBlock[i]);
      }
    }
    else {
      resolved.radarPreHeaderArrayEncoderBlock = []
    }

    return resolved;
    }
};

module.exports = RadarPreHeader;
