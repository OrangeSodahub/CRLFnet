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

class EsrVehicle4 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.fac_align_cmd_1 = null;
      this.fac_align_cmd_2 = null;
      this.fac_align_max_nt = null;
      this.fac_align_samp_req = null;
      this.fac_tgt_mtg_offset = null;
      this.fac_tgt_mtg_space_hor = null;
      this.fac_tgt_mtg_space_ver = null;
      this.fac_tgt_range_1 = null;
      this.fac_tgt_range_r2m = null;
      this.fac_tgt_range_m2t = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('fac_align_cmd_1')) {
        this.fac_align_cmd_1 = initObj.fac_align_cmd_1
      }
      else {
        this.fac_align_cmd_1 = false;
      }
      if (initObj.hasOwnProperty('fac_align_cmd_2')) {
        this.fac_align_cmd_2 = initObj.fac_align_cmd_2
      }
      else {
        this.fac_align_cmd_2 = false;
      }
      if (initObj.hasOwnProperty('fac_align_max_nt')) {
        this.fac_align_max_nt = initObj.fac_align_max_nt
      }
      else {
        this.fac_align_max_nt = 0;
      }
      if (initObj.hasOwnProperty('fac_align_samp_req')) {
        this.fac_align_samp_req = initObj.fac_align_samp_req
      }
      else {
        this.fac_align_samp_req = 0;
      }
      if (initObj.hasOwnProperty('fac_tgt_mtg_offset')) {
        this.fac_tgt_mtg_offset = initObj.fac_tgt_mtg_offset
      }
      else {
        this.fac_tgt_mtg_offset = 0;
      }
      if (initObj.hasOwnProperty('fac_tgt_mtg_space_hor')) {
        this.fac_tgt_mtg_space_hor = initObj.fac_tgt_mtg_space_hor
      }
      else {
        this.fac_tgt_mtg_space_hor = 0;
      }
      if (initObj.hasOwnProperty('fac_tgt_mtg_space_ver')) {
        this.fac_tgt_mtg_space_ver = initObj.fac_tgt_mtg_space_ver
      }
      else {
        this.fac_tgt_mtg_space_ver = 0;
      }
      if (initObj.hasOwnProperty('fac_tgt_range_1')) {
        this.fac_tgt_range_1 = initObj.fac_tgt_range_1
      }
      else {
        this.fac_tgt_range_1 = 0.0;
      }
      if (initObj.hasOwnProperty('fac_tgt_range_r2m')) {
        this.fac_tgt_range_r2m = initObj.fac_tgt_range_r2m
      }
      else {
        this.fac_tgt_range_r2m = 0.0;
      }
      if (initObj.hasOwnProperty('fac_tgt_range_m2t')) {
        this.fac_tgt_range_m2t = initObj.fac_tgt_range_m2t
      }
      else {
        this.fac_tgt_range_m2t = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrVehicle4
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [fac_align_cmd_1]
    bufferOffset = _serializer.bool(obj.fac_align_cmd_1, buffer, bufferOffset);
    // Serialize message field [fac_align_cmd_2]
    bufferOffset = _serializer.bool(obj.fac_align_cmd_2, buffer, bufferOffset);
    // Serialize message field [fac_align_max_nt]
    bufferOffset = _serializer.uint8(obj.fac_align_max_nt, buffer, bufferOffset);
    // Serialize message field [fac_align_samp_req]
    bufferOffset = _serializer.uint8(obj.fac_align_samp_req, buffer, bufferOffset);
    // Serialize message field [fac_tgt_mtg_offset]
    bufferOffset = _serializer.int8(obj.fac_tgt_mtg_offset, buffer, bufferOffset);
    // Serialize message field [fac_tgt_mtg_space_hor]
    bufferOffset = _serializer.int8(obj.fac_tgt_mtg_space_hor, buffer, bufferOffset);
    // Serialize message field [fac_tgt_mtg_space_ver]
    bufferOffset = _serializer.int8(obj.fac_tgt_mtg_space_ver, buffer, bufferOffset);
    // Serialize message field [fac_tgt_range_1]
    bufferOffset = _serializer.float32(obj.fac_tgt_range_1, buffer, bufferOffset);
    // Serialize message field [fac_tgt_range_r2m]
    bufferOffset = _serializer.float32(obj.fac_tgt_range_r2m, buffer, bufferOffset);
    // Serialize message field [fac_tgt_range_m2t]
    bufferOffset = _serializer.float32(obj.fac_tgt_range_m2t, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrVehicle4
    let len;
    let data = new EsrVehicle4(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [fac_align_cmd_1]
    data.fac_align_cmd_1 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [fac_align_cmd_2]
    data.fac_align_cmd_2 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [fac_align_max_nt]
    data.fac_align_max_nt = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fac_align_samp_req]
    data.fac_align_samp_req = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fac_tgt_mtg_offset]
    data.fac_tgt_mtg_offset = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [fac_tgt_mtg_space_hor]
    data.fac_tgt_mtg_space_hor = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [fac_tgt_mtg_space_ver]
    data.fac_tgt_mtg_space_ver = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [fac_tgt_range_1]
    data.fac_tgt_range_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fac_tgt_range_r2m]
    data.fac_tgt_range_r2m = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fac_tgt_range_m2t]
    data.fac_tgt_range_m2t = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrVehicle4';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0805b9094a6d63c8c5d196257252ccdb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR vehicle4
    bool        fac_align_cmd_1
    bool        fac_align_cmd_2
    uint8       fac_align_max_nt
    uint8       fac_align_samp_req
    int8        fac_tgt_mtg_offset
    int8        fac_tgt_mtg_space_hor
    int8        fac_tgt_mtg_space_ver
    float32     fac_tgt_range_1
    float32     fac_tgt_range_r2m
    float32     fac_tgt_range_m2t
    
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
    const resolved = new EsrVehicle4(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.fac_align_cmd_1 !== undefined) {
      resolved.fac_align_cmd_1 = msg.fac_align_cmd_1;
    }
    else {
      resolved.fac_align_cmd_1 = false
    }

    if (msg.fac_align_cmd_2 !== undefined) {
      resolved.fac_align_cmd_2 = msg.fac_align_cmd_2;
    }
    else {
      resolved.fac_align_cmd_2 = false
    }

    if (msg.fac_align_max_nt !== undefined) {
      resolved.fac_align_max_nt = msg.fac_align_max_nt;
    }
    else {
      resolved.fac_align_max_nt = 0
    }

    if (msg.fac_align_samp_req !== undefined) {
      resolved.fac_align_samp_req = msg.fac_align_samp_req;
    }
    else {
      resolved.fac_align_samp_req = 0
    }

    if (msg.fac_tgt_mtg_offset !== undefined) {
      resolved.fac_tgt_mtg_offset = msg.fac_tgt_mtg_offset;
    }
    else {
      resolved.fac_tgt_mtg_offset = 0
    }

    if (msg.fac_tgt_mtg_space_hor !== undefined) {
      resolved.fac_tgt_mtg_space_hor = msg.fac_tgt_mtg_space_hor;
    }
    else {
      resolved.fac_tgt_mtg_space_hor = 0
    }

    if (msg.fac_tgt_mtg_space_ver !== undefined) {
      resolved.fac_tgt_mtg_space_ver = msg.fac_tgt_mtg_space_ver;
    }
    else {
      resolved.fac_tgt_mtg_space_ver = 0
    }

    if (msg.fac_tgt_range_1 !== undefined) {
      resolved.fac_tgt_range_1 = msg.fac_tgt_range_1;
    }
    else {
      resolved.fac_tgt_range_1 = 0.0
    }

    if (msg.fac_tgt_range_r2m !== undefined) {
      resolved.fac_tgt_range_r2m = msg.fac_tgt_range_r2m;
    }
    else {
      resolved.fac_tgt_range_r2m = 0.0
    }

    if (msg.fac_tgt_range_m2t !== undefined) {
      resolved.fac_tgt_range_m2t = msg.fac_tgt_range_m2t;
    }
    else {
      resolved.fac_tgt_range_m2t = 0.0
    }

    return resolved;
    }
};

module.exports = EsrVehicle4;
