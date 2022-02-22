// Auto-generated. Do not edit!

// (in-package sick_scan.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LFErecFieldMsg = require('./LFErecFieldMsg.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LFErecMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.fields_number = null;
      this.fields = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('fields_number')) {
        this.fields_number = initObj.fields_number
      }
      else {
        this.fields_number = 0;
      }
      if (initObj.hasOwnProperty('fields')) {
        this.fields = initObj.fields
      }
      else {
        this.fields = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LFErecMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [fields_number]
    bufferOffset = _serializer.uint16(obj.fields_number, buffer, bufferOffset);
    // Serialize message field [fields]
    // Serialize the length for message field [fields]
    bufferOffset = _serializer.uint32(obj.fields.length, buffer, bufferOffset);
    obj.fields.forEach((val) => {
      bufferOffset = LFErecFieldMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LFErecMsg
    let len;
    let data = new LFErecMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [fields_number]
    data.fields_number = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [fields]
    // Deserialize array length for message field [fields]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.fields = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.fields[i] = LFErecFieldMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 37 * object.fields.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/LFErecMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '41b1ad74a61b1c63ee0183843d182e5b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains a single field of a "sSN LFErec" message of a Sick laser scanner as an ros message.
    # See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.
    # Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
    # Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have
    # output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)
    # output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
    # output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
    
    Header header
    
    uint16 fields_number # number of fields
    sick_scan/LFErecFieldMsg[] fields # 3 fields for TiM871S
    
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
    MSG: sick_scan/LFErecFieldMsg
    # This message contains a single field of a "sSN LFErec" message of a Sick laser scanner as an ros message.
    # See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.
    # Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
    # Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have
    # output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)
    # output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
    # output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
    
    uint16 version_number
    uint8 field_index
    uint32 sys_count
    float32 dist_scale_factor
    float32 dist_scale_offset
    uint32 angle_scale_factor
    int32 angle_scale_offset
    uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
    # Time block
    uint16 time_state  # No time data: 0, Time data: 1
    uint16 year        # f.e. 2021
    uint8 month        # 1 ... 12
    uint8 day          # 1 ... 31
    uint8 hour         # 0 ... 23
    uint8 minute       # 0 ... 59
    uint8 second       # 0 ... 59
    uint32 microsecond # 0 ... 999999
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LFErecMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.fields_number !== undefined) {
      resolved.fields_number = msg.fields_number;
    }
    else {
      resolved.fields_number = 0
    }

    if (msg.fields !== undefined) {
      resolved.fields = new Array(msg.fields.length);
      for (let i = 0; i < resolved.fields.length; ++i) {
        resolved.fields[i] = LFErecFieldMsg.Resolve(msg.fields[i]);
      }
    }
    else {
      resolved.fields = []
    }

    return resolved;
    }
};

module.exports = LFErecMsg;
