// Auto-generated. Do not edit!

// (in-package msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MsgLidCamObject = require('./MsgLidCamObject.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MsgLidCam {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.num_circle = null;
      this.num_intersection = null;
      this.objects_circle = null;
      this.objects_intersection = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('num_circle')) {
        this.num_circle = initObj.num_circle
      }
      else {
        this.num_circle = 0;
      }
      if (initObj.hasOwnProperty('num_intersection')) {
        this.num_intersection = initObj.num_intersection
      }
      else {
        this.num_intersection = 0;
      }
      if (initObj.hasOwnProperty('objects_circle')) {
        this.objects_circle = initObj.objects_circle
      }
      else {
        this.objects_circle = [];
      }
      if (initObj.hasOwnProperty('objects_intersection')) {
        this.objects_intersection = initObj.objects_intersection
      }
      else {
        this.objects_intersection = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgLidCam
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_circle]
    bufferOffset = _serializer.uint8(obj.num_circle, buffer, bufferOffset);
    // Serialize message field [num_intersection]
    bufferOffset = _serializer.uint8(obj.num_intersection, buffer, bufferOffset);
    // Serialize message field [objects_circle]
    // Serialize the length for message field [objects_circle]
    bufferOffset = _serializer.uint32(obj.objects_circle.length, buffer, bufferOffset);
    obj.objects_circle.forEach((val) => {
      bufferOffset = MsgLidCamObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [objects_intersection]
    // Serialize the length for message field [objects_intersection]
    bufferOffset = _serializer.uint32(obj.objects_intersection.length, buffer, bufferOffset);
    obj.objects_intersection.forEach((val) => {
      bufferOffset = MsgLidCamObject.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgLidCam
    let len;
    let data = new MsgLidCam(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_circle]
    data.num_circle = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [num_intersection]
    data.num_intersection = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [objects_circle]
    // Deserialize array length for message field [objects_circle]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects_circle = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects_circle[i] = MsgLidCamObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [objects_intersection]
    // Deserialize array length for message field [objects_intersection]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects_intersection = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects_intersection[i] = MsgLidCamObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.objects_circle.forEach((val) => {
      length += MsgLidCamObject.getMessageSize(val);
    });
    object.objects_intersection.forEach((val) => {
      length += MsgLidCamObject.getMessageSize(val);
    });
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/MsgLidCam';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92aac1a08f2584ca8ae9e3d8d796fb74';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 num_circle
    uint8 num_intersection
    MsgLidCamObject[] objects_circle
    MsgLidCamObject[] objects_intersection
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
    MSG: msgs/MsgLidCamObject
    Header header
    float32 alpha
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
    const resolved = new MsgLidCam(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.num_circle !== undefined) {
      resolved.num_circle = msg.num_circle;
    }
    else {
      resolved.num_circle = 0
    }

    if (msg.num_intersection !== undefined) {
      resolved.num_intersection = msg.num_intersection;
    }
    else {
      resolved.num_intersection = 0
    }

    if (msg.objects_circle !== undefined) {
      resolved.objects_circle = new Array(msg.objects_circle.length);
      for (let i = 0; i < resolved.objects_circle.length; ++i) {
        resolved.objects_circle[i] = MsgLidCamObject.Resolve(msg.objects_circle[i]);
      }
    }
    else {
      resolved.objects_circle = []
    }

    if (msg.objects_intersection !== undefined) {
      resolved.objects_intersection = new Array(msg.objects_intersection.length);
      for (let i = 0; i < resolved.objects_intersection.length; ++i) {
        resolved.objects_intersection[i] = MsgLidCamObject.Resolve(msg.objects_intersection[i]);
      }
    }
    else {
      resolved.objects_intersection = []
    }

    return resolved;
    }
};

module.exports = MsgLidCam;
