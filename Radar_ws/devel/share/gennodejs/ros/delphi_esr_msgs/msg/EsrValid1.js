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

class EsrValid1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.lrSN = null;
      this.lrRange = null;
      this.lrRangeRate = null;
      this.lrAngle = null;
      this.lrPower = null;
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
      if (initObj.hasOwnProperty('lrSN')) {
        this.lrSN = initObj.lrSN
      }
      else {
        this.lrSN = 0;
      }
      if (initObj.hasOwnProperty('lrRange')) {
        this.lrRange = initObj.lrRange
      }
      else {
        this.lrRange = 0.0;
      }
      if (initObj.hasOwnProperty('lrRangeRate')) {
        this.lrRangeRate = initObj.lrRangeRate
      }
      else {
        this.lrRangeRate = 0.0;
      }
      if (initObj.hasOwnProperty('lrAngle')) {
        this.lrAngle = initObj.lrAngle
      }
      else {
        this.lrAngle = 0.0;
      }
      if (initObj.hasOwnProperty('lrPower')) {
        this.lrPower = initObj.lrPower
      }
      else {
        this.lrPower = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrValid1
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [lrSN]
    bufferOffset = _serializer.uint8(obj.lrSN, buffer, bufferOffset);
    // Serialize message field [lrRange]
    bufferOffset = _serializer.float32(obj.lrRange, buffer, bufferOffset);
    // Serialize message field [lrRangeRate]
    bufferOffset = _serializer.float32(obj.lrRangeRate, buffer, bufferOffset);
    // Serialize message field [lrAngle]
    bufferOffset = _serializer.float32(obj.lrAngle, buffer, bufferOffset);
    // Serialize message field [lrPower]
    bufferOffset = _serializer.int8(obj.lrPower, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrValid1
    let len;
    let data = new EsrValid1(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [lrSN]
    data.lrSN = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [lrRange]
    data.lrRange = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lrRangeRate]
    data.lrRangeRate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lrAngle]
    data.lrAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lrPower]
    data.lrPower = _deserializer.int8(buffer, bufferOffset);
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
    return 'delphi_esr_msgs/EsrValid1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c4abfbd505e6dac4796d76d198d45785';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR valid1
    string      canmsg
    uint8       lrSN
    float32     lrRange
    float32     lrRangeRate
    float32     lrAngle
    int8        lrPower
    
    
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
    const resolved = new EsrValid1(null);
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

    if (msg.lrSN !== undefined) {
      resolved.lrSN = msg.lrSN;
    }
    else {
      resolved.lrSN = 0
    }

    if (msg.lrRange !== undefined) {
      resolved.lrRange = msg.lrRange;
    }
    else {
      resolved.lrRange = 0.0
    }

    if (msg.lrRangeRate !== undefined) {
      resolved.lrRangeRate = msg.lrRangeRate;
    }
    else {
      resolved.lrRangeRate = 0.0
    }

    if (msg.lrAngle !== undefined) {
      resolved.lrAngle = msg.lrAngle;
    }
    else {
      resolved.lrAngle = 0.0
    }

    if (msg.lrPower !== undefined) {
      resolved.lrPower = msg.lrPower;
    }
    else {
      resolved.lrPower = 0
    }

    return resolved;
    }
};

module.exports = EsrValid1;
