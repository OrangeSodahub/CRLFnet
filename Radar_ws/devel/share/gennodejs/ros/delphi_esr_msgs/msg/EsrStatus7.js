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

class EsrStatus7 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.activeFault0 = null;
      this.activeFault1 = null;
      this.activeFault2 = null;
      this.activeFault3 = null;
      this.activeFault4 = null;
      this.activeFault5 = null;
      this.activeFault6 = null;
      this.activeFault7 = null;
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
      if (initObj.hasOwnProperty('activeFault0')) {
        this.activeFault0 = initObj.activeFault0
      }
      else {
        this.activeFault0 = 0;
      }
      if (initObj.hasOwnProperty('activeFault1')) {
        this.activeFault1 = initObj.activeFault1
      }
      else {
        this.activeFault1 = 0;
      }
      if (initObj.hasOwnProperty('activeFault2')) {
        this.activeFault2 = initObj.activeFault2
      }
      else {
        this.activeFault2 = 0;
      }
      if (initObj.hasOwnProperty('activeFault3')) {
        this.activeFault3 = initObj.activeFault3
      }
      else {
        this.activeFault3 = 0;
      }
      if (initObj.hasOwnProperty('activeFault4')) {
        this.activeFault4 = initObj.activeFault4
      }
      else {
        this.activeFault4 = 0;
      }
      if (initObj.hasOwnProperty('activeFault5')) {
        this.activeFault5 = initObj.activeFault5
      }
      else {
        this.activeFault5 = 0;
      }
      if (initObj.hasOwnProperty('activeFault6')) {
        this.activeFault6 = initObj.activeFault6
      }
      else {
        this.activeFault6 = 0;
      }
      if (initObj.hasOwnProperty('activeFault7')) {
        this.activeFault7 = initObj.activeFault7
      }
      else {
        this.activeFault7 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus7
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [activeFault0]
    bufferOffset = _serializer.uint8(obj.activeFault0, buffer, bufferOffset);
    // Serialize message field [activeFault1]
    bufferOffset = _serializer.uint8(obj.activeFault1, buffer, bufferOffset);
    // Serialize message field [activeFault2]
    bufferOffset = _serializer.uint8(obj.activeFault2, buffer, bufferOffset);
    // Serialize message field [activeFault3]
    bufferOffset = _serializer.uint8(obj.activeFault3, buffer, bufferOffset);
    // Serialize message field [activeFault4]
    bufferOffset = _serializer.uint8(obj.activeFault4, buffer, bufferOffset);
    // Serialize message field [activeFault5]
    bufferOffset = _serializer.uint8(obj.activeFault5, buffer, bufferOffset);
    // Serialize message field [activeFault6]
    bufferOffset = _serializer.uint8(obj.activeFault6, buffer, bufferOffset);
    // Serialize message field [activeFault7]
    bufferOffset = _serializer.uint8(obj.activeFault7, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus7
    let len;
    let data = new EsrStatus7(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [activeFault0]
    data.activeFault0 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault1]
    data.activeFault1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault2]
    data.activeFault2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault3]
    data.activeFault3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault4]
    data.activeFault4 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault5]
    data.activeFault5 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault6]
    data.activeFault6 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [activeFault7]
    data.activeFault7 = _deserializer.uint8(buffer, bufferOffset);
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
    return 'delphi_esr_msgs/EsrStatus7';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b04af575c0721e778fa727e03d332233';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status7
    string      canmsg
    uint8       activeFault0
    uint8       activeFault1
    uint8       activeFault2
    uint8       activeFault3
    uint8       activeFault4
    uint8       activeFault5
    uint8       activeFault6
    uint8       activeFault7
    
    
    
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
    const resolved = new EsrStatus7(null);
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

    if (msg.activeFault0 !== undefined) {
      resolved.activeFault0 = msg.activeFault0;
    }
    else {
      resolved.activeFault0 = 0
    }

    if (msg.activeFault1 !== undefined) {
      resolved.activeFault1 = msg.activeFault1;
    }
    else {
      resolved.activeFault1 = 0
    }

    if (msg.activeFault2 !== undefined) {
      resolved.activeFault2 = msg.activeFault2;
    }
    else {
      resolved.activeFault2 = 0
    }

    if (msg.activeFault3 !== undefined) {
      resolved.activeFault3 = msg.activeFault3;
    }
    else {
      resolved.activeFault3 = 0
    }

    if (msg.activeFault4 !== undefined) {
      resolved.activeFault4 = msg.activeFault4;
    }
    else {
      resolved.activeFault4 = 0
    }

    if (msg.activeFault5 !== undefined) {
      resolved.activeFault5 = msg.activeFault5;
    }
    else {
      resolved.activeFault5 = 0
    }

    if (msg.activeFault6 !== undefined) {
      resolved.activeFault6 = msg.activeFault6;
    }
    else {
      resolved.activeFault6 = 0
    }

    if (msg.activeFault7 !== undefined) {
      resolved.activeFault7 = msg.activeFault7;
    }
    else {
      resolved.activeFault7 = 0
    }

    return resolved;
    }
};

module.exports = EsrStatus7;
