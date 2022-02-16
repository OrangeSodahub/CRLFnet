// Auto-generated. Do not edit!

// (in-package pb_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ContiRadar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.obstacle_id = null;
      this.longitude_dist = null;
      this.lateral_dist = null;
      this.longitude_vel = null;
      this.lateral_vel = null;
      this.rcs = null;
      this.orientation_angle = null;
      this.length = null;
      this.width = null;
      this.obstacle_class = null;
      this.meas_state = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('obstacle_id')) {
        this.obstacle_id = initObj.obstacle_id
      }
      else {
        this.obstacle_id = 0;
      }
      if (initObj.hasOwnProperty('longitude_dist')) {
        this.longitude_dist = initObj.longitude_dist
      }
      else {
        this.longitude_dist = 0.0;
      }
      if (initObj.hasOwnProperty('lateral_dist')) {
        this.lateral_dist = initObj.lateral_dist
      }
      else {
        this.lateral_dist = 0.0;
      }
      if (initObj.hasOwnProperty('longitude_vel')) {
        this.longitude_vel = initObj.longitude_vel
      }
      else {
        this.longitude_vel = 0.0;
      }
      if (initObj.hasOwnProperty('lateral_vel')) {
        this.lateral_vel = initObj.lateral_vel
      }
      else {
        this.lateral_vel = 0.0;
      }
      if (initObj.hasOwnProperty('rcs')) {
        this.rcs = initObj.rcs
      }
      else {
        this.rcs = 0.0;
      }
      if (initObj.hasOwnProperty('orientation_angle')) {
        this.orientation_angle = initObj.orientation_angle
      }
      else {
        this.orientation_angle = 0.0;
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('obstacle_class')) {
        this.obstacle_class = initObj.obstacle_class
      }
      else {
        this.obstacle_class = '';
      }
      if (initObj.hasOwnProperty('meas_state')) {
        this.meas_state = initObj.meas_state
      }
      else {
        this.meas_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ContiRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [obstacle_id]
    bufferOffset = _serializer.uint8(obj.obstacle_id, buffer, bufferOffset);
    // Serialize message field [longitude_dist]
    bufferOffset = _serializer.float32(obj.longitude_dist, buffer, bufferOffset);
    // Serialize message field [lateral_dist]
    bufferOffset = _serializer.float32(obj.lateral_dist, buffer, bufferOffset);
    // Serialize message field [longitude_vel]
    bufferOffset = _serializer.float32(obj.longitude_vel, buffer, bufferOffset);
    // Serialize message field [lateral_vel]
    bufferOffset = _serializer.float32(obj.lateral_vel, buffer, bufferOffset);
    // Serialize message field [rcs]
    bufferOffset = _serializer.float32(obj.rcs, buffer, bufferOffset);
    // Serialize message field [orientation_angle]
    bufferOffset = _serializer.float32(obj.orientation_angle, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [obstacle_class]
    bufferOffset = _serializer.string(obj.obstacle_class, buffer, bufferOffset);
    // Serialize message field [meas_state]
    bufferOffset = _serializer.uint8(obj.meas_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ContiRadar
    let len;
    let data = new ContiRadar(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstacle_id]
    data.obstacle_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longitude_dist]
    data.longitude_dist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateral_dist]
    data.lateral_dist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [longitude_vel]
    data.longitude_vel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateral_vel]
    data.lateral_vel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rcs]
    data.rcs = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [orientation_angle]
    data.orientation_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [obstacle_class]
    data.obstacle_class = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [meas_state]
    data.meas_state = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.obstacle_class);
    return length + 38;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pb_msgs/ContiRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57e1ab636428c459e0b7de26a4d272b9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 obstacle_id
    float32 longitude_dist
    float32 lateral_dist
    float32 longitude_vel
    float32 lateral_vel
    float32 rcs
    float32 orientation_angle
    float32 length
    float32 width
    string obstacle_class
    uint8 meas_state
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
    const resolved = new ContiRadar(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.obstacle_id !== undefined) {
      resolved.obstacle_id = msg.obstacle_id;
    }
    else {
      resolved.obstacle_id = 0
    }

    if (msg.longitude_dist !== undefined) {
      resolved.longitude_dist = msg.longitude_dist;
    }
    else {
      resolved.longitude_dist = 0.0
    }

    if (msg.lateral_dist !== undefined) {
      resolved.lateral_dist = msg.lateral_dist;
    }
    else {
      resolved.lateral_dist = 0.0
    }

    if (msg.longitude_vel !== undefined) {
      resolved.longitude_vel = msg.longitude_vel;
    }
    else {
      resolved.longitude_vel = 0.0
    }

    if (msg.lateral_vel !== undefined) {
      resolved.lateral_vel = msg.lateral_vel;
    }
    else {
      resolved.lateral_vel = 0.0
    }

    if (msg.rcs !== undefined) {
      resolved.rcs = msg.rcs;
    }
    else {
      resolved.rcs = 0.0
    }

    if (msg.orientation_angle !== undefined) {
      resolved.orientation_angle = msg.orientation_angle;
    }
    else {
      resolved.orientation_angle = 0.0
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.obstacle_class !== undefined) {
      resolved.obstacle_class = msg.obstacle_class;
    }
    else {
      resolved.obstacle_class = ''
    }

    if (msg.meas_state !== undefined) {
      resolved.meas_state = msg.meas_state;
    }
    else {
      resolved.meas_state = 0
    }

    return resolved;
    }
};

module.exports = ContiRadar;
