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

class EsrStatus5 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.swbattA2D = null;
      this.ignpA2D = null;
      this.temp1A2D = null;
      this.temp2A2D = null;
      this.supply5VA = null;
      this.supply5VDX = null;
      this.supply53P3V = null;
      this.supply10V = null;
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
      if (initObj.hasOwnProperty('swbattA2D')) {
        this.swbattA2D = initObj.swbattA2D
      }
      else {
        this.swbattA2D = 0;
      }
      if (initObj.hasOwnProperty('ignpA2D')) {
        this.ignpA2D = initObj.ignpA2D
      }
      else {
        this.ignpA2D = 0;
      }
      if (initObj.hasOwnProperty('temp1A2D')) {
        this.temp1A2D = initObj.temp1A2D
      }
      else {
        this.temp1A2D = 0;
      }
      if (initObj.hasOwnProperty('temp2A2D')) {
        this.temp2A2D = initObj.temp2A2D
      }
      else {
        this.temp2A2D = 0;
      }
      if (initObj.hasOwnProperty('supply5VA')) {
        this.supply5VA = initObj.supply5VA
      }
      else {
        this.supply5VA = 0;
      }
      if (initObj.hasOwnProperty('supply5VDX')) {
        this.supply5VDX = initObj.supply5VDX
      }
      else {
        this.supply5VDX = 0;
      }
      if (initObj.hasOwnProperty('supply53P3V')) {
        this.supply53P3V = initObj.supply53P3V
      }
      else {
        this.supply53P3V = 0;
      }
      if (initObj.hasOwnProperty('supply10V')) {
        this.supply10V = initObj.supply10V
      }
      else {
        this.supply10V = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus5
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [swbattA2D]
    bufferOffset = _serializer.uint8(obj.swbattA2D, buffer, bufferOffset);
    // Serialize message field [ignpA2D]
    bufferOffset = _serializer.uint8(obj.ignpA2D, buffer, bufferOffset);
    // Serialize message field [temp1A2D]
    bufferOffset = _serializer.uint8(obj.temp1A2D, buffer, bufferOffset);
    // Serialize message field [temp2A2D]
    bufferOffset = _serializer.uint8(obj.temp2A2D, buffer, bufferOffset);
    // Serialize message field [supply5VA]
    bufferOffset = _serializer.uint8(obj.supply5VA, buffer, bufferOffset);
    // Serialize message field [supply5VDX]
    bufferOffset = _serializer.uint8(obj.supply5VDX, buffer, bufferOffset);
    // Serialize message field [supply53P3V]
    bufferOffset = _serializer.uint8(obj.supply53P3V, buffer, bufferOffset);
    // Serialize message field [supply10V]
    bufferOffset = _serializer.uint8(obj.supply10V, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus5
    let len;
    let data = new EsrStatus5(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [swbattA2D]
    data.swbattA2D = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ignpA2D]
    data.ignpA2D = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [temp1A2D]
    data.temp1A2D = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [temp2A2D]
    data.temp2A2D = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [supply5VA]
    data.supply5VA = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [supply5VDX]
    data.supply5VDX = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [supply53P3V]
    data.supply53P3V = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [supply10V]
    data.supply10V = _deserializer.uint8(buffer, bufferOffset);
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
    return 'delphi_esr_msgs/EsrStatus5';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aae12ba774492012b782362919f8cb63';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status5
    string      canmsg
    uint8       swbattA2D
    uint8       ignpA2D
    uint8       temp1A2D
    uint8       temp2A2D
    uint8       supply5VA
    uint8       supply5VDX
    uint8       supply53P3V
    uint8       supply10V
    
    
    
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
    const resolved = new EsrStatus5(null);
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

    if (msg.swbattA2D !== undefined) {
      resolved.swbattA2D = msg.swbattA2D;
    }
    else {
      resolved.swbattA2D = 0
    }

    if (msg.ignpA2D !== undefined) {
      resolved.ignpA2D = msg.ignpA2D;
    }
    else {
      resolved.ignpA2D = 0
    }

    if (msg.temp1A2D !== undefined) {
      resolved.temp1A2D = msg.temp1A2D;
    }
    else {
      resolved.temp1A2D = 0
    }

    if (msg.temp2A2D !== undefined) {
      resolved.temp2A2D = msg.temp2A2D;
    }
    else {
      resolved.temp2A2D = 0
    }

    if (msg.supply5VA !== undefined) {
      resolved.supply5VA = msg.supply5VA;
    }
    else {
      resolved.supply5VA = 0
    }

    if (msg.supply5VDX !== undefined) {
      resolved.supply5VDX = msg.supply5VDX;
    }
    else {
      resolved.supply5VDX = 0
    }

    if (msg.supply53P3V !== undefined) {
      resolved.supply53P3V = msg.supply53P3V;
    }
    else {
      resolved.supply53P3V = 0
    }

    if (msg.supply10V !== undefined) {
      resolved.supply10V = msg.supply10V;
    }
    else {
      resolved.supply10V = 0
    }

    return resolved;
    }
};

module.exports = EsrStatus5;
