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

class ClusterRadar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.target_id = null;
      this.longitude_dist = null;
      this.lateral_dist = null;
      this.longitude_vel = null;
      this.lateral_vel = null;
      this.rcs = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('target_id')) {
        this.target_id = initObj.target_id
      }
      else {
        this.target_id = 0;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ClusterRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [target_id]
    bufferOffset = _serializer.uint8(obj.target_id, buffer, bufferOffset);
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
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClusterRadar
    let len;
    let data = new ClusterRadar(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [target_id]
    data.target_id = _deserializer.uint8(buffer, bufferOffset);
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
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pb_msgs/ClusterRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ccd4422744fe0f3d40c70da9e394ee5d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 target_id
    float32 longitude_dist
    float32 lateral_dist
    float32 longitude_vel
    float32 lateral_vel
    float32 rcs
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
    const resolved = new ClusterRadar(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.target_id !== undefined) {
      resolved.target_id = msg.target_id;
    }
    else {
      resolved.target_id = 0
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

    return resolved;
    }
};

module.exports = ClusterRadar;
