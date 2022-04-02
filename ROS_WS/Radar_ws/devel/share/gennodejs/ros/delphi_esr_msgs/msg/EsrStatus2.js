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

class EsrStatus2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.rollingCount2 = null;
      this.maxTrackAck = null;
      this.overheatError = null;
      this.rangePerfError = null;
      this.internalError = null;
      this.xcvrOperational = null;
      this.rawDataMode = null;
      this.steerAngleAck = null;
      this.temperature = null;
      this.spdCompFactor = null;
      this.groupingMode = null;
      this.yawRateBias = null;
      this.swVersionDSP = null;
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
      if (initObj.hasOwnProperty('rollingCount2')) {
        this.rollingCount2 = initObj.rollingCount2
      }
      else {
        this.rollingCount2 = 0;
      }
      if (initObj.hasOwnProperty('maxTrackAck')) {
        this.maxTrackAck = initObj.maxTrackAck
      }
      else {
        this.maxTrackAck = 0;
      }
      if (initObj.hasOwnProperty('overheatError')) {
        this.overheatError = initObj.overheatError
      }
      else {
        this.overheatError = false;
      }
      if (initObj.hasOwnProperty('rangePerfError')) {
        this.rangePerfError = initObj.rangePerfError
      }
      else {
        this.rangePerfError = false;
      }
      if (initObj.hasOwnProperty('internalError')) {
        this.internalError = initObj.internalError
      }
      else {
        this.internalError = false;
      }
      if (initObj.hasOwnProperty('xcvrOperational')) {
        this.xcvrOperational = initObj.xcvrOperational
      }
      else {
        this.xcvrOperational = false;
      }
      if (initObj.hasOwnProperty('rawDataMode')) {
        this.rawDataMode = initObj.rawDataMode
      }
      else {
        this.rawDataMode = false;
      }
      if (initObj.hasOwnProperty('steerAngleAck')) {
        this.steerAngleAck = initObj.steerAngleAck
      }
      else {
        this.steerAngleAck = 0;
      }
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0;
      }
      if (initObj.hasOwnProperty('spdCompFactor')) {
        this.spdCompFactor = initObj.spdCompFactor
      }
      else {
        this.spdCompFactor = 0.0;
      }
      if (initObj.hasOwnProperty('groupingMode')) {
        this.groupingMode = initObj.groupingMode
      }
      else {
        this.groupingMode = 0;
      }
      if (initObj.hasOwnProperty('yawRateBias')) {
        this.yawRateBias = initObj.yawRateBias
      }
      else {
        this.yawRateBias = 0.0;
      }
      if (initObj.hasOwnProperty('swVersionDSP')) {
        this.swVersionDSP = initObj.swVersionDSP
      }
      else {
        this.swVersionDSP = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus2
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [rollingCount2]
    bufferOffset = _serializer.uint8(obj.rollingCount2, buffer, bufferOffset);
    // Serialize message field [maxTrackAck]
    bufferOffset = _serializer.uint8(obj.maxTrackAck, buffer, bufferOffset);
    // Serialize message field [overheatError]
    bufferOffset = _serializer.bool(obj.overheatError, buffer, bufferOffset);
    // Serialize message field [rangePerfError]
    bufferOffset = _serializer.bool(obj.rangePerfError, buffer, bufferOffset);
    // Serialize message field [internalError]
    bufferOffset = _serializer.bool(obj.internalError, buffer, bufferOffset);
    // Serialize message field [xcvrOperational]
    bufferOffset = _serializer.bool(obj.xcvrOperational, buffer, bufferOffset);
    // Serialize message field [rawDataMode]
    bufferOffset = _serializer.bool(obj.rawDataMode, buffer, bufferOffset);
    // Serialize message field [steerAngleAck]
    bufferOffset = _serializer.uint16(obj.steerAngleAck, buffer, bufferOffset);
    // Serialize message field [temperature]
    bufferOffset = _serializer.int8(obj.temperature, buffer, bufferOffset);
    // Serialize message field [spdCompFactor]
    bufferOffset = _serializer.float32(obj.spdCompFactor, buffer, bufferOffset);
    // Serialize message field [groupingMode]
    bufferOffset = _serializer.uint8(obj.groupingMode, buffer, bufferOffset);
    // Serialize message field [yawRateBias]
    bufferOffset = _serializer.float32(obj.yawRateBias, buffer, bufferOffset);
    // Serialize message field [swVersionDSP]
    bufferOffset = _serializer.string(obj.swVersionDSP, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus2
    let len;
    let data = new EsrStatus2(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rollingCount2]
    data.rollingCount2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [maxTrackAck]
    data.maxTrackAck = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [overheatError]
    data.overheatError = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rangePerfError]
    data.rangePerfError = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [internalError]
    data.internalError = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [xcvrOperational]
    data.xcvrOperational = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rawDataMode]
    data.rawDataMode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [steerAngleAck]
    data.steerAngleAck = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [spdCompFactor]
    data.spdCompFactor = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [groupingMode]
    data.groupingMode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [yawRateBias]
    data.yawRateBias = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [swVersionDSP]
    data.swVersionDSP = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    length += _getByteLength(object.swVersionDSP);
    return length + 27;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bcf53fd3f623189a15116de844ce9791';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status2
    string      canmsg
    uint8       rollingCount2
    uint8       maxTrackAck
    bool        overheatError
    bool        rangePerfError
    bool        internalError
    bool        xcvrOperational
    bool        rawDataMode
    uint16      steerAngleAck
    int8        temperature
    float32     spdCompFactor
    uint8       groupingMode
    float32     yawRateBias
    string      swVersionDSP     
    
    
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
    const resolved = new EsrStatus2(null);
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

    if (msg.rollingCount2 !== undefined) {
      resolved.rollingCount2 = msg.rollingCount2;
    }
    else {
      resolved.rollingCount2 = 0
    }

    if (msg.maxTrackAck !== undefined) {
      resolved.maxTrackAck = msg.maxTrackAck;
    }
    else {
      resolved.maxTrackAck = 0
    }

    if (msg.overheatError !== undefined) {
      resolved.overheatError = msg.overheatError;
    }
    else {
      resolved.overheatError = false
    }

    if (msg.rangePerfError !== undefined) {
      resolved.rangePerfError = msg.rangePerfError;
    }
    else {
      resolved.rangePerfError = false
    }

    if (msg.internalError !== undefined) {
      resolved.internalError = msg.internalError;
    }
    else {
      resolved.internalError = false
    }

    if (msg.xcvrOperational !== undefined) {
      resolved.xcvrOperational = msg.xcvrOperational;
    }
    else {
      resolved.xcvrOperational = false
    }

    if (msg.rawDataMode !== undefined) {
      resolved.rawDataMode = msg.rawDataMode;
    }
    else {
      resolved.rawDataMode = false
    }

    if (msg.steerAngleAck !== undefined) {
      resolved.steerAngleAck = msg.steerAngleAck;
    }
    else {
      resolved.steerAngleAck = 0
    }

    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0
    }

    if (msg.spdCompFactor !== undefined) {
      resolved.spdCompFactor = msg.spdCompFactor;
    }
    else {
      resolved.spdCompFactor = 0.0
    }

    if (msg.groupingMode !== undefined) {
      resolved.groupingMode = msg.groupingMode;
    }
    else {
      resolved.groupingMode = 0
    }

    if (msg.yawRateBias !== undefined) {
      resolved.yawRateBias = msg.yawRateBias;
    }
    else {
      resolved.yawRateBias = 0.0
    }

    if (msg.swVersionDSP !== undefined) {
      resolved.swVersionDSP = msg.swVersionDSP;
    }
    else {
      resolved.swVersionDSP = ''
    }

    return resolved;
    }
};

module.exports = EsrStatus2;
