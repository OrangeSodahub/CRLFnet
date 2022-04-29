// Auto-generated. Do not edit!

// (in-package msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MsgRadarObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.range = null;
      this.range_rate = null;
      this.angle_centroid = null;
      this.obj_vcs_posex = null;
      this.obj_vcs_posey = null;
      this.track_id = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0.0;
      }
      if (initObj.hasOwnProperty('range_rate')) {
        this.range_rate = initObj.range_rate
      }
      else {
        this.range_rate = 0.0;
      }
      if (initObj.hasOwnProperty('angle_centroid')) {
        this.angle_centroid = initObj.angle_centroid
      }
      else {
        this.angle_centroid = 0.0;
      }
      if (initObj.hasOwnProperty('obj_vcs_posex')) {
        this.obj_vcs_posex = initObj.obj_vcs_posex
      }
      else {
        this.obj_vcs_posex = 0.0;
      }
      if (initObj.hasOwnProperty('obj_vcs_posey')) {
        this.obj_vcs_posey = initObj.obj_vcs_posey
      }
      else {
        this.obj_vcs_posey = 0.0;
      }
      if (initObj.hasOwnProperty('track_id')) {
        this.track_id = initObj.track_id
      }
      else {
        this.track_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgRadarObject
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float32(obj.range, buffer, bufferOffset);
    // Serialize message field [range_rate]
    bufferOffset = _serializer.float32(obj.range_rate, buffer, bufferOffset);
    // Serialize message field [angle_centroid]
    bufferOffset = _serializer.float32(obj.angle_centroid, buffer, bufferOffset);
    // Serialize message field [obj_vcs_posex]
    bufferOffset = _serializer.float32(obj.obj_vcs_posex, buffer, bufferOffset);
    // Serialize message field [obj_vcs_posey]
    bufferOffset = _serializer.float32(obj.obj_vcs_posey, buffer, bufferOffset);
    // Serialize message field [track_id]
    bufferOffset = _serializer.uint8(obj.track_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgRadarObject
    let len;
    let data = new MsgRadarObject(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [range_rate]
    data.range_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle_centroid]
    data.angle_centroid = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [obj_vcs_posex]
    data.obj_vcs_posex = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [obj_vcs_posey]
    data.obj_vcs_posey = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_id]
    data.track_id = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/MsgRadarObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c025781ebbd73797667e4f989e96e8b9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 range  # meters
    float32 range_rate # velocity
    float32 angle_centroid
    float32 obj_vcs_posex
    float32 obj_vcs_posey
    uint8 track_id
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
    const resolved = new MsgRadarObject(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0.0
    }

    if (msg.range_rate !== undefined) {
      resolved.range_rate = msg.range_rate;
    }
    else {
      resolved.range_rate = 0.0
    }

    if (msg.angle_centroid !== undefined) {
      resolved.angle_centroid = msg.angle_centroid;
    }
    else {
      resolved.angle_centroid = 0.0
    }

    if (msg.obj_vcs_posex !== undefined) {
      resolved.obj_vcs_posex = msg.obj_vcs_posex;
    }
    else {
      resolved.obj_vcs_posex = 0.0
    }

    if (msg.obj_vcs_posey !== undefined) {
      resolved.obj_vcs_posey = msg.obj_vcs_posey;
    }
    else {
      resolved.obj_vcs_posey = 0.0
    }

    if (msg.track_id !== undefined) {
      resolved.track_id = msg.track_id;
    }
    else {
      resolved.track_id = 0
    }

    return resolved;
    }
};

module.exports = MsgRadarObject;
