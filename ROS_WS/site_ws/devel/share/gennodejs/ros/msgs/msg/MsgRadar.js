// Auto-generated. Do not edit!

// (in-package msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MsgRadarObject = require('./MsgRadarObject.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MsgRadar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.total_vehicles_left = null;
      this.total_vehicles_right = null;
      this.ObjectList_left = null;
      this.ObjectList_right = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('total_vehicles_left')) {
        this.total_vehicles_left = initObj.total_vehicles_left
      }
      else {
        this.total_vehicles_left = 0.0;
      }
      if (initObj.hasOwnProperty('total_vehicles_right')) {
        this.total_vehicles_right = initObj.total_vehicles_right
      }
      else {
        this.total_vehicles_right = 0.0;
      }
      if (initObj.hasOwnProperty('ObjectList_left')) {
        this.ObjectList_left = initObj.ObjectList_left
      }
      else {
        this.ObjectList_left = [];
      }
      if (initObj.hasOwnProperty('ObjectList_right')) {
        this.ObjectList_right = initObj.ObjectList_right
      }
      else {
        this.ObjectList_right = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [total_vehicles_left]
    bufferOffset = _serializer.float32(obj.total_vehicles_left, buffer, bufferOffset);
    // Serialize message field [total_vehicles_right]
    bufferOffset = _serializer.float32(obj.total_vehicles_right, buffer, bufferOffset);
    // Serialize message field [ObjectList_left]
    // Serialize the length for message field [ObjectList_left]
    bufferOffset = _serializer.uint32(obj.ObjectList_left.length, buffer, bufferOffset);
    obj.ObjectList_left.forEach((val) => {
      bufferOffset = MsgRadarObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [ObjectList_right]
    // Serialize the length for message field [ObjectList_right]
    bufferOffset = _serializer.uint32(obj.ObjectList_right.length, buffer, bufferOffset);
    obj.ObjectList_right.forEach((val) => {
      bufferOffset = MsgRadarObject.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgRadar
    let len;
    let data = new MsgRadar(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [total_vehicles_left]
    data.total_vehicles_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [total_vehicles_right]
    data.total_vehicles_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ObjectList_left]
    // Deserialize array length for message field [ObjectList_left]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ObjectList_left = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ObjectList_left[i] = MsgRadarObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [ObjectList_right]
    // Deserialize array length for message field [ObjectList_right]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ObjectList_right = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ObjectList_right[i] = MsgRadarObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.ObjectList_left.forEach((val) => {
      length += MsgRadarObject.getMessageSize(val);
    });
    object.ObjectList_right.forEach((val) => {
      length += MsgRadarObject.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/MsgRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a3c7315f9e8449ffdf3d76f6033062a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 total_vehicles_left
    float32 total_vehicles_right
    MsgRadarObject[] ObjectList_left
    MsgRadarObject[] ObjectList_right
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
    MSG: msgs/MsgRadarObject
    Header header
    float32 range  # meters
    float32 range_rate # velocity
    float32 angle_centroid
    float32 obj_vcs_posex
    float32 obj_vcs_posey
    uint8 track_id
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgRadar(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.total_vehicles_left !== undefined) {
      resolved.total_vehicles_left = msg.total_vehicles_left;
    }
    else {
      resolved.total_vehicles_left = 0.0
    }

    if (msg.total_vehicles_right !== undefined) {
      resolved.total_vehicles_right = msg.total_vehicles_right;
    }
    else {
      resolved.total_vehicles_right = 0.0
    }

    if (msg.ObjectList_left !== undefined) {
      resolved.ObjectList_left = new Array(msg.ObjectList_left.length);
      for (let i = 0; i < resolved.ObjectList_left.length; ++i) {
        resolved.ObjectList_left[i] = MsgRadarObject.Resolve(msg.ObjectList_left[i]);
      }
    }
    else {
      resolved.ObjectList_left = []
    }

    if (msg.ObjectList_right !== undefined) {
      resolved.ObjectList_right = new Array(msg.ObjectList_right.length);
      for (let i = 0; i < resolved.ObjectList_right.length; ++i) {
        resolved.ObjectList_right[i] = MsgRadarObject.Resolve(msg.ObjectList_right[i]);
      }
    }
    else {
      resolved.ObjectList_right = []
    }

    return resolved;
    }
};

module.exports = MsgRadar;
