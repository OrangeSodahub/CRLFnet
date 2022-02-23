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

class EsrVehicle3 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.long_accel_valid = null;
      this.lat_accel_valid = null;
      this.lat_accel = null;
      this.long_accel = null;
      this.radar_fov_lr = null;
      this.radar_fov_mr = null;
      this.auto_align_disable = null;
      this.radar_height = null;
      this.serv_align_type = null;
      this.serv_align_enable = null;
      this.align_avg_ctr_total = null;
      this.auto_align_converged = null;
      this.wheel_slip = null;
      this.serv_align_updates_need = null;
      this.angle_mounting_offset = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('long_accel_valid')) {
        this.long_accel_valid = initObj.long_accel_valid
      }
      else {
        this.long_accel_valid = false;
      }
      if (initObj.hasOwnProperty('lat_accel_valid')) {
        this.lat_accel_valid = initObj.lat_accel_valid
      }
      else {
        this.lat_accel_valid = false;
      }
      if (initObj.hasOwnProperty('lat_accel')) {
        this.lat_accel = initObj.lat_accel
      }
      else {
        this.lat_accel = 0.0;
      }
      if (initObj.hasOwnProperty('long_accel')) {
        this.long_accel = initObj.long_accel
      }
      else {
        this.long_accel = 0.0;
      }
      if (initObj.hasOwnProperty('radar_fov_lr')) {
        this.radar_fov_lr = initObj.radar_fov_lr
      }
      else {
        this.radar_fov_lr = 0;
      }
      if (initObj.hasOwnProperty('radar_fov_mr')) {
        this.radar_fov_mr = initObj.radar_fov_mr
      }
      else {
        this.radar_fov_mr = 0;
      }
      if (initObj.hasOwnProperty('auto_align_disable')) {
        this.auto_align_disable = initObj.auto_align_disable
      }
      else {
        this.auto_align_disable = false;
      }
      if (initObj.hasOwnProperty('radar_height')) {
        this.radar_height = initObj.radar_height
      }
      else {
        this.radar_height = 0;
      }
      if (initObj.hasOwnProperty('serv_align_type')) {
        this.serv_align_type = initObj.serv_align_type
      }
      else {
        this.serv_align_type = false;
      }
      if (initObj.hasOwnProperty('serv_align_enable')) {
        this.serv_align_enable = initObj.serv_align_enable
      }
      else {
        this.serv_align_enable = false;
      }
      if (initObj.hasOwnProperty('align_avg_ctr_total')) {
        this.align_avg_ctr_total = initObj.align_avg_ctr_total
      }
      else {
        this.align_avg_ctr_total = 0;
      }
      if (initObj.hasOwnProperty('auto_align_converged')) {
        this.auto_align_converged = initObj.auto_align_converged
      }
      else {
        this.auto_align_converged = false;
      }
      if (initObj.hasOwnProperty('wheel_slip')) {
        this.wheel_slip = initObj.wheel_slip
      }
      else {
        this.wheel_slip = 0;
      }
      if (initObj.hasOwnProperty('serv_align_updates_need')) {
        this.serv_align_updates_need = initObj.serv_align_updates_need
      }
      else {
        this.serv_align_updates_need = 0;
      }
      if (initObj.hasOwnProperty('angle_mounting_offset')) {
        this.angle_mounting_offset = initObj.angle_mounting_offset
      }
      else {
        this.angle_mounting_offset = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrVehicle3
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [long_accel_valid]
    bufferOffset = _serializer.bool(obj.long_accel_valid, buffer, bufferOffset);
    // Serialize message field [lat_accel_valid]
    bufferOffset = _serializer.bool(obj.lat_accel_valid, buffer, bufferOffset);
    // Serialize message field [lat_accel]
    bufferOffset = _serializer.float32(obj.lat_accel, buffer, bufferOffset);
    // Serialize message field [long_accel]
    bufferOffset = _serializer.float32(obj.long_accel, buffer, bufferOffset);
    // Serialize message field [radar_fov_lr]
    bufferOffset = _serializer.uint8(obj.radar_fov_lr, buffer, bufferOffset);
    // Serialize message field [radar_fov_mr]
    bufferOffset = _serializer.uint8(obj.radar_fov_mr, buffer, bufferOffset);
    // Serialize message field [auto_align_disable]
    bufferOffset = _serializer.bool(obj.auto_align_disable, buffer, bufferOffset);
    // Serialize message field [radar_height]
    bufferOffset = _serializer.uint8(obj.radar_height, buffer, bufferOffset);
    // Serialize message field [serv_align_type]
    bufferOffset = _serializer.bool(obj.serv_align_type, buffer, bufferOffset);
    // Serialize message field [serv_align_enable]
    bufferOffset = _serializer.bool(obj.serv_align_enable, buffer, bufferOffset);
    // Serialize message field [align_avg_ctr_total]
    bufferOffset = _serializer.uint16(obj.align_avg_ctr_total, buffer, bufferOffset);
    // Serialize message field [auto_align_converged]
    bufferOffset = _serializer.bool(obj.auto_align_converged, buffer, bufferOffset);
    // Serialize message field [wheel_slip]
    bufferOffset = _serializer.uint8(obj.wheel_slip, buffer, bufferOffset);
    // Serialize message field [serv_align_updates_need]
    bufferOffset = _serializer.uint8(obj.serv_align_updates_need, buffer, bufferOffset);
    // Serialize message field [angle_mounting_offset]
    bufferOffset = _serializer.int8(obj.angle_mounting_offset, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrVehicle3
    let len;
    let data = new EsrVehicle3(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [long_accel_valid]
    data.long_accel_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [lat_accel_valid]
    data.lat_accel_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [lat_accel]
    data.lat_accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [long_accel]
    data.long_accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [radar_fov_lr]
    data.radar_fov_lr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radar_fov_mr]
    data.radar_fov_mr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [auto_align_disable]
    data.auto_align_disable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [radar_height]
    data.radar_height = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [serv_align_type]
    data.serv_align_type = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [serv_align_enable]
    data.serv_align_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [align_avg_ctr_total]
    data.align_avg_ctr_total = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [auto_align_converged]
    data.auto_align_converged = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [wheel_slip]
    data.wheel_slip = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [serv_align_updates_need]
    data.serv_align_updates_need = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [angle_mounting_offset]
    data.angle_mounting_offset = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrVehicle3';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0833bf12f4f5dda6a3b6915054c197ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR vehicle3
    bool        long_accel_valid
    bool        lat_accel_valid
    float32     lat_accel
    float32     long_accel
    uint8       radar_fov_lr
    uint8       radar_fov_mr
    bool        auto_align_disable
    uint8       radar_height
    bool        serv_align_type
    bool        serv_align_enable
    uint16      align_avg_ctr_total
    bool        auto_align_converged
    uint8       wheel_slip
    uint8       serv_align_updates_need
    int8        angle_mounting_offset
    
    
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
    const resolved = new EsrVehicle3(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.long_accel_valid !== undefined) {
      resolved.long_accel_valid = msg.long_accel_valid;
    }
    else {
      resolved.long_accel_valid = false
    }

    if (msg.lat_accel_valid !== undefined) {
      resolved.lat_accel_valid = msg.lat_accel_valid;
    }
    else {
      resolved.lat_accel_valid = false
    }

    if (msg.lat_accel !== undefined) {
      resolved.lat_accel = msg.lat_accel;
    }
    else {
      resolved.lat_accel = 0.0
    }

    if (msg.long_accel !== undefined) {
      resolved.long_accel = msg.long_accel;
    }
    else {
      resolved.long_accel = 0.0
    }

    if (msg.radar_fov_lr !== undefined) {
      resolved.radar_fov_lr = msg.radar_fov_lr;
    }
    else {
      resolved.radar_fov_lr = 0
    }

    if (msg.radar_fov_mr !== undefined) {
      resolved.radar_fov_mr = msg.radar_fov_mr;
    }
    else {
      resolved.radar_fov_mr = 0
    }

    if (msg.auto_align_disable !== undefined) {
      resolved.auto_align_disable = msg.auto_align_disable;
    }
    else {
      resolved.auto_align_disable = false
    }

    if (msg.radar_height !== undefined) {
      resolved.radar_height = msg.radar_height;
    }
    else {
      resolved.radar_height = 0
    }

    if (msg.serv_align_type !== undefined) {
      resolved.serv_align_type = msg.serv_align_type;
    }
    else {
      resolved.serv_align_type = false
    }

    if (msg.serv_align_enable !== undefined) {
      resolved.serv_align_enable = msg.serv_align_enable;
    }
    else {
      resolved.serv_align_enable = false
    }

    if (msg.align_avg_ctr_total !== undefined) {
      resolved.align_avg_ctr_total = msg.align_avg_ctr_total;
    }
    else {
      resolved.align_avg_ctr_total = 0
    }

    if (msg.auto_align_converged !== undefined) {
      resolved.auto_align_converged = msg.auto_align_converged;
    }
    else {
      resolved.auto_align_converged = false
    }

    if (msg.wheel_slip !== undefined) {
      resolved.wheel_slip = msg.wheel_slip;
    }
    else {
      resolved.wheel_slip = 0
    }

    if (msg.serv_align_updates_need !== undefined) {
      resolved.serv_align_updates_need = msg.serv_align_updates_need;
    }
    else {
      resolved.serv_align_updates_need = 0
    }

    if (msg.angle_mounting_offset !== undefined) {
      resolved.angle_mounting_offset = msg.angle_mounting_offset;
    }
    else {
      resolved.angle_mounting_offset = 0
    }

    return resolved;
    }
};

module.exports = EsrVehicle3;
