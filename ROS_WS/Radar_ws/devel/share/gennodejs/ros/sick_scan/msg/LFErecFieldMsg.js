// Auto-generated. Do not edit!

// (in-package sick_scan.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class LFErecFieldMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.version_number = null;
      this.field_index = null;
      this.sys_count = null;
      this.dist_scale_factor = null;
      this.dist_scale_offset = null;
      this.angle_scale_factor = null;
      this.angle_scale_offset = null;
      this.field_result_mrs = null;
      this.time_state = null;
      this.year = null;
      this.month = null;
      this.day = null;
      this.hour = null;
      this.minute = null;
      this.second = null;
      this.microsecond = null;
    }
    else {
      if (initObj.hasOwnProperty('version_number')) {
        this.version_number = initObj.version_number
      }
      else {
        this.version_number = 0;
      }
      if (initObj.hasOwnProperty('field_index')) {
        this.field_index = initObj.field_index
      }
      else {
        this.field_index = 0;
      }
      if (initObj.hasOwnProperty('sys_count')) {
        this.sys_count = initObj.sys_count
      }
      else {
        this.sys_count = 0;
      }
      if (initObj.hasOwnProperty('dist_scale_factor')) {
        this.dist_scale_factor = initObj.dist_scale_factor
      }
      else {
        this.dist_scale_factor = 0.0;
      }
      if (initObj.hasOwnProperty('dist_scale_offset')) {
        this.dist_scale_offset = initObj.dist_scale_offset
      }
      else {
        this.dist_scale_offset = 0.0;
      }
      if (initObj.hasOwnProperty('angle_scale_factor')) {
        this.angle_scale_factor = initObj.angle_scale_factor
      }
      else {
        this.angle_scale_factor = 0;
      }
      if (initObj.hasOwnProperty('angle_scale_offset')) {
        this.angle_scale_offset = initObj.angle_scale_offset
      }
      else {
        this.angle_scale_offset = 0;
      }
      if (initObj.hasOwnProperty('field_result_mrs')) {
        this.field_result_mrs = initObj.field_result_mrs
      }
      else {
        this.field_result_mrs = 0;
      }
      if (initObj.hasOwnProperty('time_state')) {
        this.time_state = initObj.time_state
      }
      else {
        this.time_state = 0;
      }
      if (initObj.hasOwnProperty('year')) {
        this.year = initObj.year
      }
      else {
        this.year = 0;
      }
      if (initObj.hasOwnProperty('month')) {
        this.month = initObj.month
      }
      else {
        this.month = 0;
      }
      if (initObj.hasOwnProperty('day')) {
        this.day = initObj.day
      }
      else {
        this.day = 0;
      }
      if (initObj.hasOwnProperty('hour')) {
        this.hour = initObj.hour
      }
      else {
        this.hour = 0;
      }
      if (initObj.hasOwnProperty('minute')) {
        this.minute = initObj.minute
      }
      else {
        this.minute = 0;
      }
      if (initObj.hasOwnProperty('second')) {
        this.second = initObj.second
      }
      else {
        this.second = 0;
      }
      if (initObj.hasOwnProperty('microsecond')) {
        this.microsecond = initObj.microsecond
      }
      else {
        this.microsecond = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LFErecFieldMsg
    // Serialize message field [version_number]
    bufferOffset = _serializer.uint16(obj.version_number, buffer, bufferOffset);
    // Serialize message field [field_index]
    bufferOffset = _serializer.uint8(obj.field_index, buffer, bufferOffset);
    // Serialize message field [sys_count]
    bufferOffset = _serializer.uint32(obj.sys_count, buffer, bufferOffset);
    // Serialize message field [dist_scale_factor]
    bufferOffset = _serializer.float32(obj.dist_scale_factor, buffer, bufferOffset);
    // Serialize message field [dist_scale_offset]
    bufferOffset = _serializer.float32(obj.dist_scale_offset, buffer, bufferOffset);
    // Serialize message field [angle_scale_factor]
    bufferOffset = _serializer.uint32(obj.angle_scale_factor, buffer, bufferOffset);
    // Serialize message field [angle_scale_offset]
    bufferOffset = _serializer.int32(obj.angle_scale_offset, buffer, bufferOffset);
    // Serialize message field [field_result_mrs]
    bufferOffset = _serializer.uint8(obj.field_result_mrs, buffer, bufferOffset);
    // Serialize message field [time_state]
    bufferOffset = _serializer.uint16(obj.time_state, buffer, bufferOffset);
    // Serialize message field [year]
    bufferOffset = _serializer.uint16(obj.year, buffer, bufferOffset);
    // Serialize message field [month]
    bufferOffset = _serializer.uint8(obj.month, buffer, bufferOffset);
    // Serialize message field [day]
    bufferOffset = _serializer.uint8(obj.day, buffer, bufferOffset);
    // Serialize message field [hour]
    bufferOffset = _serializer.uint8(obj.hour, buffer, bufferOffset);
    // Serialize message field [minute]
    bufferOffset = _serializer.uint8(obj.minute, buffer, bufferOffset);
    // Serialize message field [second]
    bufferOffset = _serializer.uint8(obj.second, buffer, bufferOffset);
    // Serialize message field [microsecond]
    bufferOffset = _serializer.uint32(obj.microsecond, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LFErecFieldMsg
    let len;
    let data = new LFErecFieldMsg(null);
    // Deserialize message field [version_number]
    data.version_number = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [field_index]
    data.field_index = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sys_count]
    data.sys_count = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [dist_scale_factor]
    data.dist_scale_factor = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dist_scale_offset]
    data.dist_scale_offset = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle_scale_factor]
    data.angle_scale_factor = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [angle_scale_offset]
    data.angle_scale_offset = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [field_result_mrs]
    data.field_result_mrs = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [time_state]
    data.time_state = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [year]
    data.year = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [month]
    data.month = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [day]
    data.day = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hour]
    data.hour = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [minute]
    data.minute = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [second]
    data.second = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [microsecond]
    data.microsecond = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/LFErecFieldMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '268600f47eb96b8f384e54c8bc6e18f6';
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
    const resolved = new LFErecFieldMsg(null);
    if (msg.version_number !== undefined) {
      resolved.version_number = msg.version_number;
    }
    else {
      resolved.version_number = 0
    }

    if (msg.field_index !== undefined) {
      resolved.field_index = msg.field_index;
    }
    else {
      resolved.field_index = 0
    }

    if (msg.sys_count !== undefined) {
      resolved.sys_count = msg.sys_count;
    }
    else {
      resolved.sys_count = 0
    }

    if (msg.dist_scale_factor !== undefined) {
      resolved.dist_scale_factor = msg.dist_scale_factor;
    }
    else {
      resolved.dist_scale_factor = 0.0
    }

    if (msg.dist_scale_offset !== undefined) {
      resolved.dist_scale_offset = msg.dist_scale_offset;
    }
    else {
      resolved.dist_scale_offset = 0.0
    }

    if (msg.angle_scale_factor !== undefined) {
      resolved.angle_scale_factor = msg.angle_scale_factor;
    }
    else {
      resolved.angle_scale_factor = 0
    }

    if (msg.angle_scale_offset !== undefined) {
      resolved.angle_scale_offset = msg.angle_scale_offset;
    }
    else {
      resolved.angle_scale_offset = 0
    }

    if (msg.field_result_mrs !== undefined) {
      resolved.field_result_mrs = msg.field_result_mrs;
    }
    else {
      resolved.field_result_mrs = 0
    }

    if (msg.time_state !== undefined) {
      resolved.time_state = msg.time_state;
    }
    else {
      resolved.time_state = 0
    }

    if (msg.year !== undefined) {
      resolved.year = msg.year;
    }
    else {
      resolved.year = 0
    }

    if (msg.month !== undefined) {
      resolved.month = msg.month;
    }
    else {
      resolved.month = 0
    }

    if (msg.day !== undefined) {
      resolved.day = msg.day;
    }
    else {
      resolved.day = 0
    }

    if (msg.hour !== undefined) {
      resolved.hour = msg.hour;
    }
    else {
      resolved.hour = 0
    }

    if (msg.minute !== undefined) {
      resolved.minute = msg.minute;
    }
    else {
      resolved.minute = 0
    }

    if (msg.second !== undefined) {
      resolved.second = msg.second;
    }
    else {
      resolved.second = 0
    }

    if (msg.microsecond !== undefined) {
      resolved.microsecond = msg.microsecond;
    }
    else {
      resolved.microsecond = 0
    }

    return resolved;
    }
};

module.exports = LFErecFieldMsg;
