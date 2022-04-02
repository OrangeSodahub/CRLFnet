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

class EsrEthTx {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.xcp_format_version = null;
      this.scan_index = null;
      this.tcp_size = null;
      this.xcp_scan_type = null;
      this.look_index = null;
      this.mmr_scan_index = null;
      this.target_report_host_speed = null;
      this.target_report_host_yaw_rate = null;
      this.xcp_timestamp = null;
      this.release_revision = null;
      this.promote_revision = null;
      this.field_revision = null;
      this.target_report_count = null;
      this.target_report_range = null;
      this.target_report_range_rate = null;
      this.target_report_theta = null;
      this.target_report_amplitude = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('xcp_format_version')) {
        this.xcp_format_version = initObj.xcp_format_version
      }
      else {
        this.xcp_format_version = 0;
      }
      if (initObj.hasOwnProperty('scan_index')) {
        this.scan_index = initObj.scan_index
      }
      else {
        this.scan_index = 0;
      }
      if (initObj.hasOwnProperty('tcp_size')) {
        this.tcp_size = initObj.tcp_size
      }
      else {
        this.tcp_size = 0;
      }
      if (initObj.hasOwnProperty('xcp_scan_type')) {
        this.xcp_scan_type = initObj.xcp_scan_type
      }
      else {
        this.xcp_scan_type = 0;
      }
      if (initObj.hasOwnProperty('look_index')) {
        this.look_index = initObj.look_index
      }
      else {
        this.look_index = 0;
      }
      if (initObj.hasOwnProperty('mmr_scan_index')) {
        this.mmr_scan_index = initObj.mmr_scan_index
      }
      else {
        this.mmr_scan_index = 0;
      }
      if (initObj.hasOwnProperty('target_report_host_speed')) {
        this.target_report_host_speed = initObj.target_report_host_speed
      }
      else {
        this.target_report_host_speed = 0.0;
      }
      if (initObj.hasOwnProperty('target_report_host_yaw_rate')) {
        this.target_report_host_yaw_rate = initObj.target_report_host_yaw_rate
      }
      else {
        this.target_report_host_yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('xcp_timestamp')) {
        this.xcp_timestamp = initObj.xcp_timestamp
      }
      else {
        this.xcp_timestamp = 0;
      }
      if (initObj.hasOwnProperty('release_revision')) {
        this.release_revision = initObj.release_revision
      }
      else {
        this.release_revision = 0;
      }
      if (initObj.hasOwnProperty('promote_revision')) {
        this.promote_revision = initObj.promote_revision
      }
      else {
        this.promote_revision = 0;
      }
      if (initObj.hasOwnProperty('field_revision')) {
        this.field_revision = initObj.field_revision
      }
      else {
        this.field_revision = 0;
      }
      if (initObj.hasOwnProperty('target_report_count')) {
        this.target_report_count = initObj.target_report_count
      }
      else {
        this.target_report_count = 0;
      }
      if (initObj.hasOwnProperty('target_report_range')) {
        this.target_report_range = initObj.target_report_range
      }
      else {
        this.target_report_range = new Array(64).fill(0);
      }
      if (initObj.hasOwnProperty('target_report_range_rate')) {
        this.target_report_range_rate = initObj.target_report_range_rate
      }
      else {
        this.target_report_range_rate = new Array(64).fill(0);
      }
      if (initObj.hasOwnProperty('target_report_theta')) {
        this.target_report_theta = initObj.target_report_theta
      }
      else {
        this.target_report_theta = new Array(64).fill(0);
      }
      if (initObj.hasOwnProperty('target_report_amplitude')) {
        this.target_report_amplitude = initObj.target_report_amplitude
      }
      else {
        this.target_report_amplitude = new Array(64).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrEthTx
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [xcp_format_version]
    bufferOffset = _serializer.uint16(obj.xcp_format_version, buffer, bufferOffset);
    // Serialize message field [scan_index]
    bufferOffset = _serializer.uint16(obj.scan_index, buffer, bufferOffset);
    // Serialize message field [tcp_size]
    bufferOffset = _serializer.uint16(obj.tcp_size, buffer, bufferOffset);
    // Serialize message field [xcp_scan_type]
    bufferOffset = _serializer.uint8(obj.xcp_scan_type, buffer, bufferOffset);
    // Serialize message field [look_index]
    bufferOffset = _serializer.uint16(obj.look_index, buffer, bufferOffset);
    // Serialize message field [mmr_scan_index]
    bufferOffset = _serializer.uint16(obj.mmr_scan_index, buffer, bufferOffset);
    // Serialize message field [target_report_host_speed]
    bufferOffset = _serializer.float32(obj.target_report_host_speed, buffer, bufferOffset);
    // Serialize message field [target_report_host_yaw_rate]
    bufferOffset = _serializer.float32(obj.target_report_host_yaw_rate, buffer, bufferOffset);
    // Serialize message field [xcp_timestamp]
    bufferOffset = _serializer.uint32(obj.xcp_timestamp, buffer, bufferOffset);
    // Serialize message field [release_revision]
    bufferOffset = _serializer.uint8(obj.release_revision, buffer, bufferOffset);
    // Serialize message field [promote_revision]
    bufferOffset = _serializer.uint8(obj.promote_revision, buffer, bufferOffset);
    // Serialize message field [field_revision]
    bufferOffset = _serializer.uint8(obj.field_revision, buffer, bufferOffset);
    // Serialize message field [target_report_count]
    bufferOffset = _serializer.uint8(obj.target_report_count, buffer, bufferOffset);
    // Check that the constant length array field [target_report_range] has the right length
    if (obj.target_report_range.length !== 64) {
      throw new Error('Unable to serialize array field target_report_range - length must be 64')
    }
    // Serialize message field [target_report_range]
    bufferOffset = _arraySerializer.float32(obj.target_report_range, buffer, bufferOffset, 64);
    // Check that the constant length array field [target_report_range_rate] has the right length
    if (obj.target_report_range_rate.length !== 64) {
      throw new Error('Unable to serialize array field target_report_range_rate - length must be 64')
    }
    // Serialize message field [target_report_range_rate]
    bufferOffset = _arraySerializer.float32(obj.target_report_range_rate, buffer, bufferOffset, 64);
    // Check that the constant length array field [target_report_theta] has the right length
    if (obj.target_report_theta.length !== 64) {
      throw new Error('Unable to serialize array field target_report_theta - length must be 64')
    }
    // Serialize message field [target_report_theta]
    bufferOffset = _arraySerializer.float32(obj.target_report_theta, buffer, bufferOffset, 64);
    // Check that the constant length array field [target_report_amplitude] has the right length
    if (obj.target_report_amplitude.length !== 64) {
      throw new Error('Unable to serialize array field target_report_amplitude - length must be 64')
    }
    // Serialize message field [target_report_amplitude]
    bufferOffset = _arraySerializer.float32(obj.target_report_amplitude, buffer, bufferOffset, 64);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrEthTx
    let len;
    let data = new EsrEthTx(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [xcp_format_version]
    data.xcp_format_version = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [scan_index]
    data.scan_index = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [tcp_size]
    data.tcp_size = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [xcp_scan_type]
    data.xcp_scan_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [look_index]
    data.look_index = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [mmr_scan_index]
    data.mmr_scan_index = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [target_report_host_speed]
    data.target_report_host_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [target_report_host_yaw_rate]
    data.target_report_host_yaw_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xcp_timestamp]
    data.xcp_timestamp = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [release_revision]
    data.release_revision = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [promote_revision]
    data.promote_revision = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [field_revision]
    data.field_revision = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [target_report_count]
    data.target_report_count = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [target_report_range]
    data.target_report_range = _arrayDeserializer.float32(buffer, bufferOffset, 64)
    // Deserialize message field [target_report_range_rate]
    data.target_report_range_rate = _arrayDeserializer.float32(buffer, bufferOffset, 64)
    // Deserialize message field [target_report_theta]
    data.target_report_theta = _arrayDeserializer.float32(buffer, bufferOffset, 64)
    // Deserialize message field [target_report_amplitude]
    data.target_report_amplitude = _arrayDeserializer.float32(buffer, bufferOffset, 64)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 1051;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrEthTx';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea522dc4f556d335d7b446f66f5ac1d2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR Track Msg
    uint16	      xcp_format_version
    uint16        scan_index
    uint16        tcp_size
    uint8         xcp_scan_type
    uint16        look_index
    uint16        mmr_scan_index
    float32         target_report_host_speed
    float32         target_report_host_yaw_rate
    uint32        xcp_timestamp
    uint8         release_revision
    uint8         promote_revision
    uint8         field_revision
    uint8        target_report_count
    float32[64]       target_report_range
    float32[64]       target_report_range_rate
    float32[64]       target_report_theta
    float32[64]       target_report_amplitude
    
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
    const resolved = new EsrEthTx(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.xcp_format_version !== undefined) {
      resolved.xcp_format_version = msg.xcp_format_version;
    }
    else {
      resolved.xcp_format_version = 0
    }

    if (msg.scan_index !== undefined) {
      resolved.scan_index = msg.scan_index;
    }
    else {
      resolved.scan_index = 0
    }

    if (msg.tcp_size !== undefined) {
      resolved.tcp_size = msg.tcp_size;
    }
    else {
      resolved.tcp_size = 0
    }

    if (msg.xcp_scan_type !== undefined) {
      resolved.xcp_scan_type = msg.xcp_scan_type;
    }
    else {
      resolved.xcp_scan_type = 0
    }

    if (msg.look_index !== undefined) {
      resolved.look_index = msg.look_index;
    }
    else {
      resolved.look_index = 0
    }

    if (msg.mmr_scan_index !== undefined) {
      resolved.mmr_scan_index = msg.mmr_scan_index;
    }
    else {
      resolved.mmr_scan_index = 0
    }

    if (msg.target_report_host_speed !== undefined) {
      resolved.target_report_host_speed = msg.target_report_host_speed;
    }
    else {
      resolved.target_report_host_speed = 0.0
    }

    if (msg.target_report_host_yaw_rate !== undefined) {
      resolved.target_report_host_yaw_rate = msg.target_report_host_yaw_rate;
    }
    else {
      resolved.target_report_host_yaw_rate = 0.0
    }

    if (msg.xcp_timestamp !== undefined) {
      resolved.xcp_timestamp = msg.xcp_timestamp;
    }
    else {
      resolved.xcp_timestamp = 0
    }

    if (msg.release_revision !== undefined) {
      resolved.release_revision = msg.release_revision;
    }
    else {
      resolved.release_revision = 0
    }

    if (msg.promote_revision !== undefined) {
      resolved.promote_revision = msg.promote_revision;
    }
    else {
      resolved.promote_revision = 0
    }

    if (msg.field_revision !== undefined) {
      resolved.field_revision = msg.field_revision;
    }
    else {
      resolved.field_revision = 0
    }

    if (msg.target_report_count !== undefined) {
      resolved.target_report_count = msg.target_report_count;
    }
    else {
      resolved.target_report_count = 0
    }

    if (msg.target_report_range !== undefined) {
      resolved.target_report_range = msg.target_report_range;
    }
    else {
      resolved.target_report_range = new Array(64).fill(0)
    }

    if (msg.target_report_range_rate !== undefined) {
      resolved.target_report_range_rate = msg.target_report_range_rate;
    }
    else {
      resolved.target_report_range_rate = new Array(64).fill(0)
    }

    if (msg.target_report_theta !== undefined) {
      resolved.target_report_theta = msg.target_report_theta;
    }
    else {
      resolved.target_report_theta = new Array(64).fill(0)
    }

    if (msg.target_report_amplitude !== undefined) {
      resolved.target_report_amplitude = msg.target_report_amplitude;
    }
    else {
      resolved.target_report_amplitude = new Array(64).fill(0)
    }

    return resolved;
    }
};

module.exports = EsrEthTx;
