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

class EsrStatus8 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.historyFault0 = null;
      this.historyFault1 = null;
      this.historyFault2 = null;
      this.historyFault3 = null;
      this.historyFault4 = null;
      this.historyFault5 = null;
      this.historyFault6 = null;
      this.historyFault7 = null;
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
      if (initObj.hasOwnProperty('historyFault0')) {
        this.historyFault0 = initObj.historyFault0
      }
      else {
        this.historyFault0 = 0;
      }
      if (initObj.hasOwnProperty('historyFault1')) {
        this.historyFault1 = initObj.historyFault1
      }
      else {
        this.historyFault1 = 0;
      }
      if (initObj.hasOwnProperty('historyFault2')) {
        this.historyFault2 = initObj.historyFault2
      }
      else {
        this.historyFault2 = 0;
      }
      if (initObj.hasOwnProperty('historyFault3')) {
        this.historyFault3 = initObj.historyFault3
      }
      else {
        this.historyFault3 = 0;
      }
      if (initObj.hasOwnProperty('historyFault4')) {
        this.historyFault4 = initObj.historyFault4
      }
      else {
        this.historyFault4 = 0;
      }
      if (initObj.hasOwnProperty('historyFault5')) {
        this.historyFault5 = initObj.historyFault5
      }
      else {
        this.historyFault5 = 0;
      }
      if (initObj.hasOwnProperty('historyFault6')) {
        this.historyFault6 = initObj.historyFault6
      }
      else {
        this.historyFault6 = 0;
      }
      if (initObj.hasOwnProperty('historyFault7')) {
        this.historyFault7 = initObj.historyFault7
      }
      else {
        this.historyFault7 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus8
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [historyFault0]
    bufferOffset = _serializer.uint8(obj.historyFault0, buffer, bufferOffset);
    // Serialize message field [historyFault1]
    bufferOffset = _serializer.uint8(obj.historyFault1, buffer, bufferOffset);
    // Serialize message field [historyFault2]
    bufferOffset = _serializer.uint8(obj.historyFault2, buffer, bufferOffset);
    // Serialize message field [historyFault3]
    bufferOffset = _serializer.uint8(obj.historyFault3, buffer, bufferOffset);
    // Serialize message field [historyFault4]
    bufferOffset = _serializer.uint8(obj.historyFault4, buffer, bufferOffset);
    // Serialize message field [historyFault5]
    bufferOffset = _serializer.uint8(obj.historyFault5, buffer, bufferOffset);
    // Serialize message field [historyFault6]
    bufferOffset = _serializer.uint8(obj.historyFault6, buffer, bufferOffset);
    // Serialize message field [historyFault7]
    bufferOffset = _serializer.uint8(obj.historyFault7, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus8
    let len;
    let data = new EsrStatus8(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [historyFault0]
    data.historyFault0 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault1]
    data.historyFault1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault2]
    data.historyFault2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault3]
    data.historyFault3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault4]
    data.historyFault4 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault5]
    data.historyFault5 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault6]
    data.historyFault6 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [historyFault7]
    data.historyFault7 = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus8';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cf0bfab7682c50ee2545f1e97677b621';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status8
    string      canmsg
    uint8       historyFault0
    uint8       historyFault1
    uint8       historyFault2
    uint8       historyFault3
    uint8       historyFault4
    uint8       historyFault5
    uint8       historyFault6
    uint8       historyFault7
    
    
    
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
    const resolved = new EsrStatus8(null);
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

    if (msg.historyFault0 !== undefined) {
      resolved.historyFault0 = msg.historyFault0;
    }
    else {
      resolved.historyFault0 = 0
    }

    if (msg.historyFault1 !== undefined) {
      resolved.historyFault1 = msg.historyFault1;
    }
    else {
      resolved.historyFault1 = 0
    }

    if (msg.historyFault2 !== undefined) {
      resolved.historyFault2 = msg.historyFault2;
    }
    else {
      resolved.historyFault2 = 0
    }

    if (msg.historyFault3 !== undefined) {
      resolved.historyFault3 = msg.historyFault3;
    }
    else {
      resolved.historyFault3 = 0
    }

    if (msg.historyFault4 !== undefined) {
      resolved.historyFault4 = msg.historyFault4;
    }
    else {
      resolved.historyFault4 = 0
    }

    if (msg.historyFault5 !== undefined) {
      resolved.historyFault5 = msg.historyFault5;
    }
    else {
      resolved.historyFault5 = 0
    }

    if (msg.historyFault6 !== undefined) {
      resolved.historyFault6 = msg.historyFault6;
    }
    else {
      resolved.historyFault6 = 0
    }

    if (msg.historyFault7 !== undefined) {
      resolved.historyFault7 = msg.historyFault7;
    }
    else {
      resolved.historyFault7 = 0
    }

    return resolved;
    }
};

module.exports = EsrStatus8;
