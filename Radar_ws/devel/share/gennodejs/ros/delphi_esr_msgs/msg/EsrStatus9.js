// Auto-generated. Do not edit!

// (in-package delphi_esr_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EsrStatus9 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.avgPwrCwblkg = null;
      this.sideSlipAngle = null;
      this.serialNum3rdByte = null;
      this.waterSprayTargetID = null;
      this.filteredXohpAccCIPV = null;
      this.pathIDACC2 = null;
      this.pathIDACC3 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('canmsg')) {
        this.canmsg = initObj.canmsg
      }
      else {
        this.canmsg = '';
      }
      if (initObj.hasOwnProperty('avgPwrCwblkg')) {
        this.avgPwrCwblkg = initObj.avgPwrCwblkg
      }
      else {
        this.avgPwrCwblkg = 0;
      }
      if (initObj.hasOwnProperty('sideSlipAngle')) {
        this.sideSlipAngle = initObj.sideSlipAngle
      }
      else {
        this.sideSlipAngle = 0.0;
      }
      if (initObj.hasOwnProperty('serialNum3rdByte')) {
        this.serialNum3rdByte = initObj.serialNum3rdByte
      }
      else {
        this.serialNum3rdByte = 0;
      }
      if (initObj.hasOwnProperty('waterSprayTargetID')) {
        this.waterSprayTargetID = initObj.waterSprayTargetID
      }
      else {
        this.waterSprayTargetID = 0;
      }
      if (initObj.hasOwnProperty('filteredXohpAccCIPV')) {
        this.filteredXohpAccCIPV = initObj.filteredXohpAccCIPV
      }
      else {
        this.filteredXohpAccCIPV = 0.0;
      }
      if (initObj.hasOwnProperty('pathIDACC2')) {
        this.pathIDACC2 = initObj.pathIDACC2
      }
      else {
        this.pathIDACC2 = 0;
      }
      if (initObj.hasOwnProperty('pathIDACC3')) {
        this.pathIDACC3 = initObj.pathIDACC3
      }
      else {
        this.pathIDACC3 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus9
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [avgPwrCwblkg]
    bufferOffset = _serializer.uint16(obj.avgPwrCwblkg, buffer, bufferOffset);
    // Serialize message field [sideSlipAngle]
    bufferOffset = _serializer.float32(obj.sideSlipAngle, buffer, bufferOffset);
    // Serialize message field [serialNum3rdByte]
    bufferOffset = _serializer.uint8(obj.serialNum3rdByte, buffer, bufferOffset);
    // Serialize message field [waterSprayTargetID]
    bufferOffset = _serializer.uint8(obj.waterSprayTargetID, buffer, bufferOffset);
    // Serialize message field [filteredXohpAccCIPV]
    bufferOffset = _serializer.float32(obj.filteredXohpAccCIPV, buffer, bufferOffset);
    // Serialize message field [pathIDACC2]
    bufferOffset = _serializer.uint8(obj.pathIDACC2, buffer, bufferOffset);
    // Serialize message field [pathIDACC3]
    bufferOffset = _serializer.uint8(obj.pathIDACC3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus9
    let len;
    let data = new EsrStatus9(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [avgPwrCwblkg]
    data.avgPwrCwblkg = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [sideSlipAngle]
    data.sideSlipAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [serialNum3rdByte]
    data.serialNum3rdByte = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [waterSprayTargetID]
    data.waterSprayTargetID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [filteredXohpAccCIPV]
    data.filteredXohpAccCIPV = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pathIDACC2]
    data.pathIDACC2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pathIDACC3]
    data.pathIDACC3 = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    return length + 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus9';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fc4ded94c686bdf234c4ceb10632e67c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status9
    string      canmsg
    uint16      avgPwrCwblkg
    float32     sideSlipAngle
    uint8       serialNum3rdByte
    uint8       waterSprayTargetID
    float32     filteredXohpAccCIPV
    uint8       pathIDACC2
    uint8       pathIDACC3
    
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EsrStatus9(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.canmsg !== undefined) {
      resolved.canmsg = msg.canmsg;
    }
    else {
      resolved.canmsg = ''
    }

    if (msg.avgPwrCwblkg !== undefined) {
      resolved.avgPwrCwblkg = msg.avgPwrCwblkg;
    }
    else {
      resolved.avgPwrCwblkg = 0
    }

    if (msg.sideSlipAngle !== undefined) {
      resolved.sideSlipAngle = msg.sideSlipAngle;
    }
    else {
      resolved.sideSlipAngle = 0.0
    }

    if (msg.serialNum3rdByte !== undefined) {
      resolved.serialNum3rdByte = msg.serialNum3rdByte;
    }
    else {
      resolved.serialNum3rdByte = 0
    }

    if (msg.waterSprayTargetID !== undefined) {
      resolved.waterSprayTargetID = msg.waterSprayTargetID;
    }
    else {
      resolved.waterSprayTargetID = 0
    }

    if (msg.filteredXohpAccCIPV !== undefined) {
      resolved.filteredXohpAccCIPV = msg.filteredXohpAccCIPV;
    }
    else {
      resolved.filteredXohpAccCIPV = 0.0
    }

    if (msg.pathIDACC2 !== undefined) {
      resolved.pathIDACC2 = msg.pathIDACC2;
    }
    else {
      resolved.pathIDACC2 = 0
    }

    if (msg.pathIDACC3 !== undefined) {
      resolved.pathIDACC3 = msg.pathIDACC3;
    }
    else {
      resolved.pathIDACC3 = 0
    }

    return resolved;
    }
};

module.exports = EsrStatus9;
