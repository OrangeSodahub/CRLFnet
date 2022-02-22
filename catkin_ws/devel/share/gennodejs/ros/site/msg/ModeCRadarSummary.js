// Auto-generated. Do not edit!

// (in-package site.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ModeCRadar = require('./ModeCRadar.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ModeCRadarSummary {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.contacts = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('contacts')) {
        this.contacts = initObj.contacts
      }
      else {
        this.contacts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModeCRadarSummary
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [contacts]
    // Serialize the length for message field [contacts]
    bufferOffset = _serializer.uint32(obj.contacts.length, buffer, bufferOffset);
    obj.contacts.forEach((val) => {
      bufferOffset = ModeCRadar.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModeCRadarSummary
    let len;
    let data = new ModeCRadarSummary(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [contacts]
    // Deserialize array length for message field [contacts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.contacts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.contacts[i] = ModeCRadar.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.contacts.forEach((val) => {
      length += ModeCRadar.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'site/ModeCRadarSummary';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '98cae80bd5cdf50d70e731ef44eb76ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    ModeCRadar[] contacts
    
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
    
    ================================================================================
    MSG: site/ModeCRadar
    Header header
    float32 range  # meters
    float32 bearing  # radians clockwise about Z axis of header frame
    float32 altitude  # Pressure altitude (m)
    uint16 code # Transponder code
    bool ident  # If ident button was pressed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModeCRadarSummary(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.contacts !== undefined) {
      resolved.contacts = new Array(msg.contacts.length);
      for (let i = 0; i < resolved.contacts.length; ++i) {
        resolved.contacts[i] = ModeCRadar.Resolve(msg.contacts[i]);
      }
    }
    else {
      resolved.contacts = []
    }

    return resolved;
    }
};

module.exports = ModeCRadarSummary;
