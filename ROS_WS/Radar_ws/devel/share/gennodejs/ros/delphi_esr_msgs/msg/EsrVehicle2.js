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

class EsrVehicle2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.scan_index_ack = null;
      this.use_angle_misalignment = null;
      this.clear_faults = null;
      this.high_yaw_angle = null;
      this.mr_only_transmit = null;
      this.lr_only_transmit = null;
      this.angle_misalignment = null;
      this.lateral_mounting_offset = null;
      this.radar_cmd_radiate = null;
      this.blockage_disable = null;
      this.maximum_tracks = null;
      this.turn_signal_status = null;
      this.vehicle_speed_valid = null;
      this.mmr_upside_down = null;
      this.grouping_mode = null;
      this.wiper_status = null;
      this.raw_data_enabled = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('scan_index_ack')) {
        this.scan_index_ack = initObj.scan_index_ack
      }
      else {
        this.scan_index_ack = 0;
      }
      if (initObj.hasOwnProperty('use_angle_misalignment')) {
        this.use_angle_misalignment = initObj.use_angle_misalignment
      }
      else {
        this.use_angle_misalignment = false;
      }
      if (initObj.hasOwnProperty('clear_faults')) {
        this.clear_faults = initObj.clear_faults
      }
      else {
        this.clear_faults = false;
      }
      if (initObj.hasOwnProperty('high_yaw_angle')) {
        this.high_yaw_angle = initObj.high_yaw_angle
      }
      else {
        this.high_yaw_angle = 0;
      }
      if (initObj.hasOwnProperty('mr_only_transmit')) {
        this.mr_only_transmit = initObj.mr_only_transmit
      }
      else {
        this.mr_only_transmit = false;
      }
      if (initObj.hasOwnProperty('lr_only_transmit')) {
        this.lr_only_transmit = initObj.lr_only_transmit
      }
      else {
        this.lr_only_transmit = false;
      }
      if (initObj.hasOwnProperty('angle_misalignment')) {
        this.angle_misalignment = initObj.angle_misalignment
      }
      else {
        this.angle_misalignment = 0.0;
      }
      if (initObj.hasOwnProperty('lateral_mounting_offset')) {
        this.lateral_mounting_offset = initObj.lateral_mounting_offset
      }
      else {
        this.lateral_mounting_offset = 0.0;
      }
      if (initObj.hasOwnProperty('radar_cmd_radiate')) {
        this.radar_cmd_radiate = initObj.radar_cmd_radiate
      }
      else {
        this.radar_cmd_radiate = false;
      }
      if (initObj.hasOwnProperty('blockage_disable')) {
        this.blockage_disable = initObj.blockage_disable
      }
      else {
        this.blockage_disable = false;
      }
      if (initObj.hasOwnProperty('maximum_tracks')) {
        this.maximum_tracks = initObj.maximum_tracks
      }
      else {
        this.maximum_tracks = 0;
      }
      if (initObj.hasOwnProperty('turn_signal_status')) {
        this.turn_signal_status = initObj.turn_signal_status
      }
      else {
        this.turn_signal_status = 0;
      }
      if (initObj.hasOwnProperty('vehicle_speed_valid')) {
        this.vehicle_speed_valid = initObj.vehicle_speed_valid
      }
      else {
        this.vehicle_speed_valid = false;
      }
      if (initObj.hasOwnProperty('mmr_upside_down')) {
        this.mmr_upside_down = initObj.mmr_upside_down
      }
      else {
        this.mmr_upside_down = false;
      }
      if (initObj.hasOwnProperty('grouping_mode')) {
        this.grouping_mode = initObj.grouping_mode
      }
      else {
        this.grouping_mode = 0;
      }
      if (initObj.hasOwnProperty('wiper_status')) {
        this.wiper_status = initObj.wiper_status
      }
      else {
        this.wiper_status = false;
      }
      if (initObj.hasOwnProperty('raw_data_enabled')) {
        this.raw_data_enabled = initObj.raw_data_enabled
      }
      else {
        this.raw_data_enabled = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrVehicle2
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [scan_index_ack]
    bufferOffset = _serializer.uint16(obj.scan_index_ack, buffer, bufferOffset);
    // Serialize message field [use_angle_misalignment]
    bufferOffset = _serializer.bool(obj.use_angle_misalignment, buffer, bufferOffset);
    // Serialize message field [clear_faults]
    bufferOffset = _serializer.bool(obj.clear_faults, buffer, bufferOffset);
    // Serialize message field [high_yaw_angle]
    bufferOffset = _serializer.int8(obj.high_yaw_angle, buffer, bufferOffset);
    // Serialize message field [mr_only_transmit]
    bufferOffset = _serializer.bool(obj.mr_only_transmit, buffer, bufferOffset);
    // Serialize message field [lr_only_transmit]
    bufferOffset = _serializer.bool(obj.lr_only_transmit, buffer, bufferOffset);
    // Serialize message field [angle_misalignment]
    bufferOffset = _serializer.float32(obj.angle_misalignment, buffer, bufferOffset);
    // Serialize message field [lateral_mounting_offset]
    bufferOffset = _serializer.float32(obj.lateral_mounting_offset, buffer, bufferOffset);
    // Serialize message field [radar_cmd_radiate]
    bufferOffset = _serializer.bool(obj.radar_cmd_radiate, buffer, bufferOffset);
    // Serialize message field [blockage_disable]
    bufferOffset = _serializer.bool(obj.blockage_disable, buffer, bufferOffset);
    // Serialize message field [maximum_tracks]
    bufferOffset = _serializer.uint8(obj.maximum_tracks, buffer, bufferOffset);
    // Serialize message field [turn_signal_status]
    bufferOffset = _serializer.uint8(obj.turn_signal_status, buffer, bufferOffset);
    // Serialize message field [vehicle_speed_valid]
    bufferOffset = _serializer.bool(obj.vehicle_speed_valid, buffer, bufferOffset);
    // Serialize message field [mmr_upside_down]
    bufferOffset = _serializer.bool(obj.mmr_upside_down, buffer, bufferOffset);
    // Serialize message field [grouping_mode]
    bufferOffset = _serializer.uint8(obj.grouping_mode, buffer, bufferOffset);
    // Serialize message field [wiper_status]
    bufferOffset = _serializer.bool(obj.wiper_status, buffer, bufferOffset);
    // Serialize message field [raw_data_enabled]
    bufferOffset = _serializer.bool(obj.raw_data_enabled, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrVehicle2
    let len;
    let data = new EsrVehicle2(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [scan_index_ack]
    data.scan_index_ack = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [use_angle_misalignment]
    data.use_angle_misalignment = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [clear_faults]
    data.clear_faults = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [high_yaw_angle]
    data.high_yaw_angle = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [mr_only_transmit]
    data.mr_only_transmit = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [lr_only_transmit]
    data.lr_only_transmit = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [angle_misalignment]
    data.angle_misalignment = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateral_mounting_offset]
    data.lateral_mounting_offset = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [radar_cmd_radiate]
    data.radar_cmd_radiate = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [blockage_disable]
    data.blockage_disable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [maximum_tracks]
    data.maximum_tracks = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [turn_signal_status]
    data.turn_signal_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vehicle_speed_valid]
    data.vehicle_speed_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mmr_upside_down]
    data.mmr_upside_down = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [grouping_mode]
    data.grouping_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [wiper_status]
    data.wiper_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [raw_data_enabled]
    data.raw_data_enabled = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrVehicle2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '034f7a7ed6d34122e2b7d043548b7f0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR vehicle2
    uint16      scan_index_ack
    bool        use_angle_misalignment
    bool        clear_faults
    int8        high_yaw_angle
    bool        mr_only_transmit
    bool        lr_only_transmit
    float32     angle_misalignment
    float32     lateral_mounting_offset
    bool        radar_cmd_radiate
    bool        blockage_disable
    uint8       maximum_tracks
    uint8       turn_signal_status
    bool        vehicle_speed_valid
    bool        mmr_upside_down
    uint8       grouping_mode
    bool        wiper_status
    bool        raw_data_enabled
    
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
    const resolved = new EsrVehicle2(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.scan_index_ack !== undefined) {
      resolved.scan_index_ack = msg.scan_index_ack;
    }
    else {
      resolved.scan_index_ack = 0
    }

    if (msg.use_angle_misalignment !== undefined) {
      resolved.use_angle_misalignment = msg.use_angle_misalignment;
    }
    else {
      resolved.use_angle_misalignment = false
    }

    if (msg.clear_faults !== undefined) {
      resolved.clear_faults = msg.clear_faults;
    }
    else {
      resolved.clear_faults = false
    }

    if (msg.high_yaw_angle !== undefined) {
      resolved.high_yaw_angle = msg.high_yaw_angle;
    }
    else {
      resolved.high_yaw_angle = 0
    }

    if (msg.mr_only_transmit !== undefined) {
      resolved.mr_only_transmit = msg.mr_only_transmit;
    }
    else {
      resolved.mr_only_transmit = false
    }

    if (msg.lr_only_transmit !== undefined) {
      resolved.lr_only_transmit = msg.lr_only_transmit;
    }
    else {
      resolved.lr_only_transmit = false
    }

    if (msg.angle_misalignment !== undefined) {
      resolved.angle_misalignment = msg.angle_misalignment;
    }
    else {
      resolved.angle_misalignment = 0.0
    }

    if (msg.lateral_mounting_offset !== undefined) {
      resolved.lateral_mounting_offset = msg.lateral_mounting_offset;
    }
    else {
      resolved.lateral_mounting_offset = 0.0
    }

    if (msg.radar_cmd_radiate !== undefined) {
      resolved.radar_cmd_radiate = msg.radar_cmd_radiate;
    }
    else {
      resolved.radar_cmd_radiate = false
    }

    if (msg.blockage_disable !== undefined) {
      resolved.blockage_disable = msg.blockage_disable;
    }
    else {
      resolved.blockage_disable = false
    }

    if (msg.maximum_tracks !== undefined) {
      resolved.maximum_tracks = msg.maximum_tracks;
    }
    else {
      resolved.maximum_tracks = 0
    }

    if (msg.turn_signal_status !== undefined) {
      resolved.turn_signal_status = msg.turn_signal_status;
    }
    else {
      resolved.turn_signal_status = 0
    }

    if (msg.vehicle_speed_valid !== undefined) {
      resolved.vehicle_speed_valid = msg.vehicle_speed_valid;
    }
    else {
      resolved.vehicle_speed_valid = false
    }

    if (msg.mmr_upside_down !== undefined) {
      resolved.mmr_upside_down = msg.mmr_upside_down;
    }
    else {
      resolved.mmr_upside_down = false
    }

    if (msg.grouping_mode !== undefined) {
      resolved.grouping_mode = msg.grouping_mode;
    }
    else {
      resolved.grouping_mode = 0
    }

    if (msg.wiper_status !== undefined) {
      resolved.wiper_status = msg.wiper_status;
    }
    else {
      resolved.wiper_status = false
    }

    if (msg.raw_data_enabled !== undefined) {
      resolved.raw_data_enabled = msg.raw_data_enabled;
    }
    else {
      resolved.raw_data_enabled = false
    }

    return resolved;
    }
};

module.exports = EsrVehicle2;
