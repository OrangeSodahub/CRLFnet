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
      this.num_left = null;
      this.num_right = null;
      this.objects_left = null;
      this.objects_right = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('num_left')) {
        this.num_left = initObj.num_left
      }
      else {
        this.num_left = 0;
      }
      if (initObj.hasOwnProperty('num_right')) {
        this.num_right = initObj.num_right
      }
      else {
        this.num_right = 0;
      }
      if (initObj.hasOwnProperty('objects_left')) {
        this.objects_left = initObj.objects_left
      }
      else {
        this.objects_left = [];
      }
      if (initObj.hasOwnProperty('objects_right')) {
        this.objects_right = initObj.objects_right
      }
      else {
        this.objects_right = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_left]
    bufferOffset = _serializer.uint8(obj.num_left, buffer, bufferOffset);
    // Serialize message field [num_right]
    bufferOffset = _serializer.uint8(obj.num_right, buffer, bufferOffset);
    // Serialize message field [objects_left]
    // Serialize the length for message field [objects_left]
    bufferOffset = _serializer.uint32(obj.objects_left.length, buffer, bufferOffset);
    obj.objects_left.forEach((val) => {
      bufferOffset = MsgRadarObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [objects_right]
    // Serialize the length for message field [objects_right]
    bufferOffset = _serializer.uint32(obj.objects_right.length, buffer, bufferOffset);
    obj.objects_right.forEach((val) => {
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
    // Deserialize message field [num_left]
    data.num_left = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [num_right]
    data.num_right = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [objects_left]
    // Deserialize array length for message field [objects_left]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects_left = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects_left[i] = MsgRadarObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [objects_right]
    // Deserialize array length for message field [objects_right]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects_right = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects_right[i] = MsgRadarObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.objects_left.forEach((val) => {
      length += MsgRadarObject.getMessageSize(val);
    });
    object.objects_right.forEach((val) => {
      length += MsgRadarObject.getMessageSize(val);
    });
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/MsgRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b60bab8d6e3388b4d94d6bd0bfb100f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 num_left
    uint8 num_right
    MsgRadarObject[] objects_left
    MsgRadarObject[] objects_right
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
    float32 distance        # range
    float32 velocity        # range rate
    float32 angle_centroid
    float32 pos_x           # obj_vcs_posx
    float32 pos_y           # obj_vcs_posy
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

    if (msg.num_left !== undefined) {
      resolved.num_left = msg.num_left;
    }
    else {
      resolved.num_left = 0
    }

    if (msg.num_right !== undefined) {
      resolved.num_right = msg.num_right;
    }
    else {
      resolved.num_right = 0
    }

    if (msg.objects_left !== undefined) {
      resolved.objects_left = new Array(msg.objects_left.length);
      for (let i = 0; i < resolved.objects_left.length; ++i) {
        resolved.objects_left[i] = MsgRadarObject.Resolve(msg.objects_left[i]);
      }
    }
    else {
      resolved.objects_left = []
    }

    if (msg.objects_right !== undefined) {
      resolved.objects_right = new Array(msg.objects_right.length);
      for (let i = 0; i < resolved.objects_right.length; ++i) {
        resolved.objects_right[i] = MsgRadarObject.Resolve(msg.objects_right[i]);
      }
    }
    else {
      resolved.objects_right = []
    }

    return resolved;
    }
};

module.exports = MsgRadar;
