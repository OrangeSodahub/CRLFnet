// Auto-generated. Do not edit!

// (in-package radar_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MsgObject = require('./MsgObject.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MsgRadar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.total_vehicles = null;
      this.ObjectList = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('total_vehicles')) {
        this.total_vehicles = initObj.total_vehicles
      }
      else {
        this.total_vehicles = 0.0;
      }
      if (initObj.hasOwnProperty('ObjectList')) {
        this.ObjectList = initObj.ObjectList
      }
      else {
        this.ObjectList = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [total_vehicles]
    bufferOffset = _serializer.float32(obj.total_vehicles, buffer, bufferOffset);
    // Serialize message field [ObjectList]
    // Serialize the length for message field [ObjectList]
    bufferOffset = _serializer.uint32(obj.ObjectList.length, buffer, bufferOffset);
    obj.ObjectList.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgRadar
    let len;
    let data = new MsgRadar(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [total_vehicles]
    data.total_vehicles = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ObjectList]
    // Deserialize array length for message field [ObjectList]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ObjectList = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ObjectList[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.ObjectList.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'radar_msgs/MsgRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6c979660ea9f3cab98f883793f57d5c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 total_vehicles
    MsgObject[] ObjectList
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
    MSG: radar_msgs/MsgObject
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

    if (msg.total_vehicles !== undefined) {
      resolved.total_vehicles = msg.total_vehicles;
    }
    else {
      resolved.total_vehicles = 0.0
    }

    if (msg.ObjectList !== undefined) {
      resolved.ObjectList = new Array(msg.ObjectList.length);
      for (let i = 0; i < resolved.ObjectList.length; ++i) {
        resolved.ObjectList[i] = MsgObject.Resolve(msg.ObjectList[i]);
      }
    }
    else {
      resolved.ObjectList = []
    }

    return resolved;
    }
};

module.exports = MsgRadar;
