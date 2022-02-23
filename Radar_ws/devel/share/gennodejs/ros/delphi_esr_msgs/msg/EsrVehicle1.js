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

class EsrVehicle1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vehicle_speed = null;
      this.speed_direction = null;
      this.yaw_rate = null;
      this.yaw_rate_valid = null;
      this.radius_curvature = null;
      this.steering_angle_valid = null;
      this.steering_angle_sign = null;
      this.steering_angle = null;
      this.steering_angle_rate = null;
      this.steering_angle_rate_sign = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vehicle_speed')) {
        this.vehicle_speed = initObj.vehicle_speed
      }
      else {
        this.vehicle_speed = 0.0;
      }
      if (initObj.hasOwnProperty('speed_direction')) {
        this.speed_direction = initObj.speed_direction
      }
      else {
        this.speed_direction = false;
      }
      if (initObj.hasOwnProperty('yaw_rate')) {
        this.yaw_rate = initObj.yaw_rate
      }
      else {
        this.yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_rate_valid')) {
        this.yaw_rate_valid = initObj.yaw_rate_valid
      }
      else {
        this.yaw_rate_valid = false;
      }
      if (initObj.hasOwnProperty('radius_curvature')) {
        this.radius_curvature = initObj.radius_curvature
      }
      else {
        this.radius_curvature = 0;
      }
      if (initObj.hasOwnProperty('steering_angle_valid')) {
        this.steering_angle_valid = initObj.steering_angle_valid
      }
      else {
        this.steering_angle_valid = false;
      }
      if (initObj.hasOwnProperty('steering_angle_sign')) {
        this.steering_angle_sign = initObj.steering_angle_sign
      }
      else {
        this.steering_angle_sign = false;
      }
      if (initObj.hasOwnProperty('steering_angle')) {
        this.steering_angle = initObj.steering_angle
      }
      else {
        this.steering_angle = 0;
      }
      if (initObj.hasOwnProperty('steering_angle_rate')) {
        this.steering_angle_rate = initObj.steering_angle_rate
      }
      else {
        this.steering_angle_rate = 0;
      }
      if (initObj.hasOwnProperty('steering_angle_rate_sign')) {
        this.steering_angle_rate_sign = initObj.steering_angle_rate_sign
      }
      else {
        this.steering_angle_rate_sign = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrVehicle1
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vehicle_speed]
    bufferOffset = _serializer.float32(obj.vehicle_speed, buffer, bufferOffset);
    // Serialize message field [speed_direction]
    bufferOffset = _serializer.bool(obj.speed_direction, buffer, bufferOffset);
    // Serialize message field [yaw_rate]
    bufferOffset = _serializer.float32(obj.yaw_rate, buffer, bufferOffset);
    // Serialize message field [yaw_rate_valid]
    bufferOffset = _serializer.bool(obj.yaw_rate_valid, buffer, bufferOffset);
    // Serialize message field [radius_curvature]
    bufferOffset = _serializer.int16(obj.radius_curvature, buffer, bufferOffset);
    // Serialize message field [steering_angle_valid]
    bufferOffset = _serializer.bool(obj.steering_angle_valid, buffer, bufferOffset);
    // Serialize message field [steering_angle_sign]
    bufferOffset = _serializer.bool(obj.steering_angle_sign, buffer, bufferOffset);
    // Serialize message field [steering_angle]
    bufferOffset = _serializer.uint16(obj.steering_angle, buffer, bufferOffset);
    // Serialize message field [steering_angle_rate]
    bufferOffset = _serializer.uint16(obj.steering_angle_rate, buffer, bufferOffset);
    // Serialize message field [steering_angle_rate_sign]
    bufferOffset = _serializer.bool(obj.steering_angle_rate_sign, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrVehicle1
    let len;
    let data = new EsrVehicle1(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vehicle_speed]
    data.vehicle_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_direction]
    data.speed_direction = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [yaw_rate]
    data.yaw_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_rate_valid]
    data.yaw_rate_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [radius_curvature]
    data.radius_curvature = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [steering_angle_valid]
    data.steering_angle_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [steering_angle_sign]
    data.steering_angle_sign = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [steering_angle]
    data.steering_angle = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [steering_angle_rate]
    data.steering_angle_rate = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [steering_angle_rate_sign]
    data.steering_angle_rate_sign = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrVehicle1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ccab5c3c9c182cced0afa3db1f83373f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR vehicle1
    float32     vehicle_speed
    bool        speed_direction
    float32     yaw_rate
    bool        yaw_rate_valid
    int16       radius_curvature
    bool        steering_angle_valid
    bool        steering_angle_sign
    uint16      steering_angle
    uint16      steering_angle_rate
    bool        steering_angle_rate_sign
    
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
    const resolved = new EsrVehicle1(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vehicle_speed !== undefined) {
      resolved.vehicle_speed = msg.vehicle_speed;
    }
    else {
      resolved.vehicle_speed = 0.0
    }

    if (msg.speed_direction !== undefined) {
      resolved.speed_direction = msg.speed_direction;
    }
    else {
      resolved.speed_direction = false
    }

    if (msg.yaw_rate !== undefined) {
      resolved.yaw_rate = msg.yaw_rate;
    }
    else {
      resolved.yaw_rate = 0.0
    }

    if (msg.yaw_rate_valid !== undefined) {
      resolved.yaw_rate_valid = msg.yaw_rate_valid;
    }
    else {
      resolved.yaw_rate_valid = false
    }

    if (msg.radius_curvature !== undefined) {
      resolved.radius_curvature = msg.radius_curvature;
    }
    else {
      resolved.radius_curvature = 0
    }

    if (msg.steering_angle_valid !== undefined) {
      resolved.steering_angle_valid = msg.steering_angle_valid;
    }
    else {
      resolved.steering_angle_valid = false
    }

    if (msg.steering_angle_sign !== undefined) {
      resolved.steering_angle_sign = msg.steering_angle_sign;
    }
    else {
      resolved.steering_angle_sign = false
    }

    if (msg.steering_angle !== undefined) {
      resolved.steering_angle = msg.steering_angle;
    }
    else {
      resolved.steering_angle = 0
    }

    if (msg.steering_angle_rate !== undefined) {
      resolved.steering_angle_rate = msg.steering_angle_rate;
    }
    else {
      resolved.steering_angle_rate = 0
    }

    if (msg.steering_angle_rate_sign !== undefined) {
      resolved.steering_angle_rate_sign = msg.steering_angle_rate_sign;
    }
    else {
      resolved.steering_angle_rate_sign = false
    }

    return resolved;
    }
};

module.exports = EsrVehicle1;
