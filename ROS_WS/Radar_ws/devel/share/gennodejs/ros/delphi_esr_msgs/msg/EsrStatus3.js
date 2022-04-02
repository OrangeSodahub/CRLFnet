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

class EsrStatus3 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.hwVersion = null;
      this.interfaceVersion = null;
      this.swVersionPld = null;
      this.swVersionHost = null;
      this.serialNum = null;
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
      if (initObj.hasOwnProperty('hwVersion')) {
        this.hwVersion = initObj.hwVersion
      }
      else {
        this.hwVersion = 0;
      }
      if (initObj.hasOwnProperty('interfaceVersion')) {
        this.interfaceVersion = initObj.interfaceVersion
      }
      else {
        this.interfaceVersion = 0;
      }
      if (initObj.hasOwnProperty('swVersionPld')) {
        this.swVersionPld = initObj.swVersionPld
      }
      else {
        this.swVersionPld = 0;
      }
      if (initObj.hasOwnProperty('swVersionHost')) {
        this.swVersionHost = initObj.swVersionHost
      }
      else {
        this.swVersionHost = '';
      }
      if (initObj.hasOwnProperty('serialNum')) {
        this.serialNum = initObj.serialNum
      }
      else {
        this.serialNum = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus3
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [hwVersion]
    bufferOffset = _serializer.uint8(obj.hwVersion, buffer, bufferOffset);
    // Serialize message field [interfaceVersion]
    bufferOffset = _serializer.uint8(obj.interfaceVersion, buffer, bufferOffset);
    // Serialize message field [swVersionPld]
    bufferOffset = _serializer.uint8(obj.swVersionPld, buffer, bufferOffset);
    // Serialize message field [swVersionHost]
    bufferOffset = _serializer.string(obj.swVersionHost, buffer, bufferOffset);
    // Serialize message field [serialNum]
    bufferOffset = _serializer.string(obj.serialNum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus3
    let len;
    let data = new EsrStatus3(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [hwVersion]
    data.hwVersion = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [interfaceVersion]
    data.interfaceVersion = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swVersionPld]
    data.swVersionPld = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swVersionHost]
    data.swVersionHost = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [serialNum]
    data.serialNum = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    length += _getByteLength(object.swVersionHost);
    length += _getByteLength(object.serialNum);
    return length + 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus3';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd267bafb7654adc3b6ab9a341e242e48';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status3
    string      canmsg
    uint8      hwVersion
    uint8      interfaceVersion
    uint8      swVersionPld
    string      swVersionHost
    string      serialNum
    
    
    
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
    const resolved = new EsrStatus3(null);
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

    if (msg.hwVersion !== undefined) {
      resolved.hwVersion = msg.hwVersion;
    }
    else {
      resolved.hwVersion = 0
    }

    if (msg.interfaceVersion !== undefined) {
      resolved.interfaceVersion = msg.interfaceVersion;
    }
    else {
      resolved.interfaceVersion = 0
    }

    if (msg.swVersionPld !== undefined) {
      resolved.swVersionPld = msg.swVersionPld;
    }
    else {
      resolved.swVersionPld = 0
    }

    if (msg.swVersionHost !== undefined) {
      resolved.swVersionHost = msg.swVersionHost;
    }
    else {
      resolved.swVersionHost = ''
    }

    if (msg.serialNum !== undefined) {
      resolved.serialNum = msg.serialNum;
    }
    else {
      resolved.serialNum = ''
    }

    return resolved;
    }
};

module.exports = EsrStatus3;
