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

class EsrValid2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.mrSN = null;
      this.mrRange = null;
      this.mrRangeRate = null;
      this.mrAngle = null;
      this.mrPower = null;
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
      if (initObj.hasOwnProperty('mrSN')) {
        this.mrSN = initObj.mrSN
      }
      else {
        this.mrSN = 0;
      }
      if (initObj.hasOwnProperty('mrRange')) {
        this.mrRange = initObj.mrRange
      }
      else {
        this.mrRange = 0.0;
      }
      if (initObj.hasOwnProperty('mrRangeRate')) {
        this.mrRangeRate = initObj.mrRangeRate
      }
      else {
        this.mrRangeRate = 0.0;
      }
      if (initObj.hasOwnProperty('mrAngle')) {
        this.mrAngle = initObj.mrAngle
      }
      else {
        this.mrAngle = 0.0;
      }
      if (initObj.hasOwnProperty('mrPower')) {
        this.mrPower = initObj.mrPower
      }
      else {
        this.mrPower = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrValid2
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [mrSN]
    bufferOffset = _serializer.uint8(obj.mrSN, buffer, bufferOffset);
    // Serialize message field [mrRange]
    bufferOffset = _serializer.float32(obj.mrRange, buffer, bufferOffset);
    // Serialize message field [mrRangeRate]
    bufferOffset = _serializer.float32(obj.mrRangeRate, buffer, bufferOffset);
    // Serialize message field [mrAngle]
    bufferOffset = _serializer.float32(obj.mrAngle, buffer, bufferOffset);
    // Serialize message field [mrPower]
    bufferOffset = _serializer.int8(obj.mrPower, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrValid2
    let len;
    let data = new EsrValid2(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [mrSN]
    data.mrSN = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mrRange]
    data.mrRange = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mrRangeRate]
    data.mrRangeRate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mrAngle]
    data.mrAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mrPower]
    data.mrPower = _deserializer.int8(buffer, bufferOffset);
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
    return 'delphi_esr_msgs/EsrValid2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9358feca721eb3835f63862d71ddc71c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR valid2
    string      canmsg
    uint8       mrSN
    float32     mrRange
    float32     mrRangeRate
    float32     mrAngle
    int8        mrPower
    
    
    
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
    const resolved = new EsrValid2(null);
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

    if (msg.mrSN !== undefined) {
      resolved.mrSN = msg.mrSN;
    }
    else {
      resolved.mrSN = 0
    }

    if (msg.mrRange !== undefined) {
      resolved.mrRange = msg.mrRange;
    }
    else {
      resolved.mrRange = 0.0
    }

    if (msg.mrRangeRate !== undefined) {
      resolved.mrRangeRate = msg.mrRangeRate;
    }
    else {
      resolved.mrRangeRate = 0.0
    }

    if (msg.mrAngle !== undefined) {
      resolved.mrAngle = msg.mrAngle;
    }
    else {
      resolved.mrAngle = 0.0
    }

    if (msg.mrPower !== undefined) {
      resolved.mrPower = msg.mrPower;
    }
    else {
      resolved.mrPower = 0
    }

    return resolved;
    }
};

module.exports = EsrValid2;
