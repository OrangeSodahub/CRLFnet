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

class EsrStatus1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.timeStamp = null;
      this.rollingCount = null;
      this.commError = null;
      this.curvature = null;
      this.scanId = null;
      this.yawRate = null;
      this.vehicleSpeedCalc = null;
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
      if (initObj.hasOwnProperty('timeStamp')) {
        this.timeStamp = initObj.timeStamp
      }
      else {
        this.timeStamp = 0;
      }
      if (initObj.hasOwnProperty('rollingCount')) {
        this.rollingCount = initObj.rollingCount
      }
      else {
        this.rollingCount = 0;
      }
      if (initObj.hasOwnProperty('commError')) {
        this.commError = initObj.commError
      }
      else {
        this.commError = false;
      }
      if (initObj.hasOwnProperty('curvature')) {
        this.curvature = initObj.curvature
      }
      else {
        this.curvature = 0;
      }
      if (initObj.hasOwnProperty('scanId')) {
        this.scanId = initObj.scanId
      }
      else {
        this.scanId = 0;
      }
      if (initObj.hasOwnProperty('yawRate')) {
        this.yawRate = initObj.yawRate
      }
      else {
        this.yawRate = 0.0;
      }
      if (initObj.hasOwnProperty('vehicleSpeedCalc')) {
        this.vehicleSpeedCalc = initObj.vehicleSpeedCalc
      }
      else {
        this.vehicleSpeedCalc = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus1
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [timeStamp]
    bufferOffset = _serializer.uint8(obj.timeStamp, buffer, bufferOffset);
    // Serialize message field [rollingCount]
    bufferOffset = _serializer.uint8(obj.rollingCount, buffer, bufferOffset);
    // Serialize message field [commError]
    bufferOffset = _serializer.bool(obj.commError, buffer, bufferOffset);
    // Serialize message field [curvature]
    bufferOffset = _serializer.int16(obj.curvature, buffer, bufferOffset);
    // Serialize message field [scanId]
    bufferOffset = _serializer.uint16(obj.scanId, buffer, bufferOffset);
    // Serialize message field [yawRate]
    bufferOffset = _serializer.float32(obj.yawRate, buffer, bufferOffset);
    // Serialize message field [vehicleSpeedCalc]
    bufferOffset = _serializer.float32(obj.vehicleSpeedCalc, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus1
    let len;
    let data = new EsrStatus1(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [timeStamp]
    data.timeStamp = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [rollingCount]
    data.rollingCount = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [commError]
    data.commError = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [curvature]
    data.curvature = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [scanId]
    data.scanId = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [yawRate]
    data.yawRate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vehicleSpeedCalc]
    data.vehicleSpeedCalc = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    return length + 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2bab6477be87782f9154c54c75ec5117';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status1
    string      canmsg
    uint8       timeStamp
    uint8       rollingCount
    bool        commError
    int16       curvature
    uint16      scanId
    float32     yawRate
    float32     vehicleSpeedCalc
    
    
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
    const resolved = new EsrStatus1(null);
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

    if (msg.timeStamp !== undefined) {
      resolved.timeStamp = msg.timeStamp;
    }
    else {
      resolved.timeStamp = 0
    }

    if (msg.rollingCount !== undefined) {
      resolved.rollingCount = msg.rollingCount;
    }
    else {
      resolved.rollingCount = 0
    }

    if (msg.commError !== undefined) {
      resolved.commError = msg.commError;
    }
    else {
      resolved.commError = false
    }

    if (msg.curvature !== undefined) {
      resolved.curvature = msg.curvature;
    }
    else {
      resolved.curvature = 0
    }

    if (msg.scanId !== undefined) {
      resolved.scanId = msg.scanId;
    }
    else {
      resolved.scanId = 0
    }

    if (msg.yawRate !== undefined) {
      resolved.yawRate = msg.yawRate;
    }
    else {
      resolved.yawRate = 0.0
    }

    if (msg.vehicleSpeedCalc !== undefined) {
      resolved.vehicleSpeedCalc = msg.vehicleSpeedCalc;
    }
    else {
      resolved.vehicleSpeedCalc = 0.0
    }

    return resolved;
    }
};

module.exports = EsrStatus1;
