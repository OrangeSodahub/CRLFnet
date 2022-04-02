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

class EsrVehicle5 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.oversteer_understeer = null;
      this.yaw_rate_bias_shift = null;
      this.beamwidth_vert = null;
      this.funnel_offset_left = null;
      this.funnel_offset_right = null;
      this.cw_blockage_threshold = null;
      this.distance_rear_axle = null;
      this.wheel_base = null;
      this.steering_gear_ratio = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('oversteer_understeer')) {
        this.oversteer_understeer = initObj.oversteer_understeer
      }
      else {
        this.oversteer_understeer = 0;
      }
      if (initObj.hasOwnProperty('yaw_rate_bias_shift')) {
        this.yaw_rate_bias_shift = initObj.yaw_rate_bias_shift
      }
      else {
        this.yaw_rate_bias_shift = false;
      }
      if (initObj.hasOwnProperty('beamwidth_vert')) {
        this.beamwidth_vert = initObj.beamwidth_vert
      }
      else {
        this.beamwidth_vert = 0.0;
      }
      if (initObj.hasOwnProperty('funnel_offset_left')) {
        this.funnel_offset_left = initObj.funnel_offset_left
      }
      else {
        this.funnel_offset_left = 0.0;
      }
      if (initObj.hasOwnProperty('funnel_offset_right')) {
        this.funnel_offset_right = initObj.funnel_offset_right
      }
      else {
        this.funnel_offset_right = 0.0;
      }
      if (initObj.hasOwnProperty('cw_blockage_threshold')) {
        this.cw_blockage_threshold = initObj.cw_blockage_threshold
      }
      else {
        this.cw_blockage_threshold = 0.0;
      }
      if (initObj.hasOwnProperty('distance_rear_axle')) {
        this.distance_rear_axle = initObj.distance_rear_axle
      }
      else {
        this.distance_rear_axle = 0;
      }
      if (initObj.hasOwnProperty('wheel_base')) {
        this.wheel_base = initObj.wheel_base
      }
      else {
        this.wheel_base = 0;
      }
      if (initObj.hasOwnProperty('steering_gear_ratio')) {
        this.steering_gear_ratio = initObj.steering_gear_ratio
      }
      else {
        this.steering_gear_ratio = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrVehicle5
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [oversteer_understeer]
    bufferOffset = _serializer.int8(obj.oversteer_understeer, buffer, bufferOffset);
    // Serialize message field [yaw_rate_bias_shift]
    bufferOffset = _serializer.bool(obj.yaw_rate_bias_shift, buffer, bufferOffset);
    // Serialize message field [beamwidth_vert]
    bufferOffset = _serializer.float32(obj.beamwidth_vert, buffer, bufferOffset);
    // Serialize message field [funnel_offset_left]
    bufferOffset = _serializer.float32(obj.funnel_offset_left, buffer, bufferOffset);
    // Serialize message field [funnel_offset_right]
    bufferOffset = _serializer.float32(obj.funnel_offset_right, buffer, bufferOffset);
    // Serialize message field [cw_blockage_threshold]
    bufferOffset = _serializer.float32(obj.cw_blockage_threshold, buffer, bufferOffset);
    // Serialize message field [distance_rear_axle]
    bufferOffset = _serializer.uint16(obj.distance_rear_axle, buffer, bufferOffset);
    // Serialize message field [wheel_base]
    bufferOffset = _serializer.uint16(obj.wheel_base, buffer, bufferOffset);
    // Serialize message field [steering_gear_ratio]
    bufferOffset = _serializer.float32(obj.steering_gear_ratio, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrVehicle5
    let len;
    let data = new EsrVehicle5(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [oversteer_understeer]
    data.oversteer_understeer = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [yaw_rate_bias_shift]
    data.yaw_rate_bias_shift = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [beamwidth_vert]
    data.beamwidth_vert = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [funnel_offset_left]
    data.funnel_offset_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [funnel_offset_right]
    data.funnel_offset_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cw_blockage_threshold]
    data.cw_blockage_threshold = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance_rear_axle]
    data.distance_rear_axle = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [wheel_base]
    data.wheel_base = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [steering_gear_ratio]
    data.steering_gear_ratio = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrVehicle5';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4135fc6914a28e2c947a8270cd84b22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR vehicle5
    int8        oversteer_understeer
    bool        yaw_rate_bias_shift
    float32     beamwidth_vert
    float32     funnel_offset_left
    float32     funnel_offset_right
    float32     cw_blockage_threshold
    uint16      distance_rear_axle
    uint16      wheel_base
    float32     steering_gear_ratio       
    
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
    const resolved = new EsrVehicle5(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.oversteer_understeer !== undefined) {
      resolved.oversteer_understeer = msg.oversteer_understeer;
    }
    else {
      resolved.oversteer_understeer = 0
    }

    if (msg.yaw_rate_bias_shift !== undefined) {
      resolved.yaw_rate_bias_shift = msg.yaw_rate_bias_shift;
    }
    else {
      resolved.yaw_rate_bias_shift = false
    }

    if (msg.beamwidth_vert !== undefined) {
      resolved.beamwidth_vert = msg.beamwidth_vert;
    }
    else {
      resolved.beamwidth_vert = 0.0
    }

    if (msg.funnel_offset_left !== undefined) {
      resolved.funnel_offset_left = msg.funnel_offset_left;
    }
    else {
      resolved.funnel_offset_left = 0.0
    }

    if (msg.funnel_offset_right !== undefined) {
      resolved.funnel_offset_right = msg.funnel_offset_right;
    }
    else {
      resolved.funnel_offset_right = 0.0
    }

    if (msg.cw_blockage_threshold !== undefined) {
      resolved.cw_blockage_threshold = msg.cw_blockage_threshold;
    }
    else {
      resolved.cw_blockage_threshold = 0.0
    }

    if (msg.distance_rear_axle !== undefined) {
      resolved.distance_rear_axle = msg.distance_rear_axle;
    }
    else {
      resolved.distance_rear_axle = 0
    }

    if (msg.wheel_base !== undefined) {
      resolved.wheel_base = msg.wheel_base;
    }
    else {
      resolved.wheel_base = 0
    }

    if (msg.steering_gear_ratio !== undefined) {
      resolved.steering_gear_ratio = msg.steering_gear_ratio;
    }
    else {
      resolved.steering_gear_ratio = 0.0
    }

    return resolved;
    }
};

module.exports = EsrVehicle5;
