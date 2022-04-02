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

class RadarPreHeaderDeviceBlock {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.uiIdent = null;
      this.udiSerialNo = null;
      this.bDeviceError = null;
      this.bContaminationWarning = null;
      this.bContaminationError = null;
    }
    else {
      if (initObj.hasOwnProperty('uiIdent')) {
        this.uiIdent = initObj.uiIdent
      }
      else {
        this.uiIdent = 0;
      }
      if (initObj.hasOwnProperty('udiSerialNo')) {
        this.udiSerialNo = initObj.udiSerialNo
      }
      else {
        this.udiSerialNo = 0;
      }
      if (initObj.hasOwnProperty('bDeviceError')) {
        this.bDeviceError = initObj.bDeviceError
      }
      else {
        this.bDeviceError = false;
      }
      if (initObj.hasOwnProperty('bContaminationWarning')) {
        this.bContaminationWarning = initObj.bContaminationWarning
      }
      else {
        this.bContaminationWarning = false;
      }
      if (initObj.hasOwnProperty('bContaminationError')) {
        this.bContaminationError = initObj.bContaminationError
      }
      else {
        this.bContaminationError = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarPreHeaderDeviceBlock
    // Serialize message field [uiIdent]
    bufferOffset = _serializer.uint32(obj.uiIdent, buffer, bufferOffset);
    // Serialize message field [udiSerialNo]
    bufferOffset = _serializer.uint32(obj.udiSerialNo, buffer, bufferOffset);
    // Serialize message field [bDeviceError]
    bufferOffset = _serializer.bool(obj.bDeviceError, buffer, bufferOffset);
    // Serialize message field [bContaminationWarning]
    bufferOffset = _serializer.bool(obj.bContaminationWarning, buffer, bufferOffset);
    // Serialize message field [bContaminationError]
    bufferOffset = _serializer.bool(obj.bContaminationError, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarPreHeaderDeviceBlock
    let len;
    let data = new RadarPreHeaderDeviceBlock(null);
    // Deserialize message field [uiIdent]
    data.uiIdent = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [udiSerialNo]
    data.udiSerialNo = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [bDeviceError]
    data.bDeviceError = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [bContaminationWarning]
    data.bContaminationWarning = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [bContaminationError]
    data.bContaminationError = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/RadarPreHeaderDeviceBlock';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c1dc3fa07dfb079c66dfaa39765f5a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarPreHeaderDeviceBlock(null);
    if (msg.uiIdent !== undefined) {
      resolved.uiIdent = msg.uiIdent;
    }
    else {
      resolved.uiIdent = 0
    }

    if (msg.udiSerialNo !== undefined) {
      resolved.udiSerialNo = msg.udiSerialNo;
    }
    else {
      resolved.udiSerialNo = 0
    }

    if (msg.bDeviceError !== undefined) {
      resolved.bDeviceError = msg.bDeviceError;
    }
    else {
      resolved.bDeviceError = false
    }

    if (msg.bContaminationWarning !== undefined) {
      resolved.bContaminationWarning = msg.bContaminationWarning;
    }
    else {
      resolved.bContaminationWarning = false
    }

    if (msg.bContaminationError !== undefined) {
      resolved.bContaminationError = msg.bContaminationError;
    }
    else {
      resolved.bContaminationError = false
    }

    return resolved;
    }
};

module.exports = RadarPreHeaderDeviceBlock;
