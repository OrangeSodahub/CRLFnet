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

class MsgRadCam {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Header = null;
      this.match_left = null;
      this.radar_left = null;
      this.camera_left = null;
      this.match_right = null;
      this.radar_right = null;
      this.camera_right = null;
    }
    else {
      if (initObj.hasOwnProperty('Header')) {
        this.Header = initObj.Header
      }
      else {
        this.Header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('match_left')) {
        this.match_left = initObj.match_left
      }
      else {
        this.match_left = 0.0;
      }
      if (initObj.hasOwnProperty('radar_left')) {
        this.radar_left = initObj.radar_left
      }
      else {
        this.radar_left = 0.0;
      }
      if (initObj.hasOwnProperty('camera_left')) {
        this.camera_left = initObj.camera_left
      }
      else {
        this.camera_left = 0.0;
      }
      if (initObj.hasOwnProperty('match_right')) {
        this.match_right = initObj.match_right
      }
      else {
        this.match_right = 0.0;
      }
      if (initObj.hasOwnProperty('radar_right')) {
        this.radar_right = initObj.radar_right
      }
      else {
        this.radar_right = 0.0;
      }
      if (initObj.hasOwnProperty('camera_right')) {
        this.camera_right = initObj.camera_right
      }
      else {
        this.camera_right = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgRadCam
    // Serialize message field [Header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.Header, buffer, bufferOffset);
    // Serialize message field [match_left]
    bufferOffset = _serializer.float32(obj.match_left, buffer, bufferOffset);
    // Serialize message field [radar_left]
    bufferOffset = _serializer.float32(obj.radar_left, buffer, bufferOffset);
    // Serialize message field [camera_left]
    bufferOffset = _serializer.float32(obj.camera_left, buffer, bufferOffset);
    // Serialize message field [match_right]
    bufferOffset = _serializer.float32(obj.match_right, buffer, bufferOffset);
    // Serialize message field [radar_right]
    bufferOffset = _serializer.float32(obj.radar_right, buffer, bufferOffset);
    // Serialize message field [camera_right]
    bufferOffset = _serializer.float32(obj.camera_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgRadCam
    let len;
    let data = new MsgRadCam(null);
    // Deserialize message field [Header]
    data.Header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [match_left]
    data.match_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [radar_left]
    data.radar_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [camera_left]
    data.camera_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [match_right]
    data.match_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [radar_right]
    data.radar_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [camera_right]
    data.camera_right = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.Header);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/MsgRadCam';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '77843f8cca22df506f0bd8510a04bfe1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header Header
    float32 match_left
    float32 radar_left
    float32 camera_left
    float32 match_right
    float32 radar_right
    float32 camera_right
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
    const resolved = new MsgRadCam(null);
    if (msg.Header !== undefined) {
      resolved.Header = std_msgs.msg.Header.Resolve(msg.Header)
    }
    else {
      resolved.Header = new std_msgs.msg.Header()
    }

    if (msg.match_left !== undefined) {
      resolved.match_left = msg.match_left;
    }
    else {
      resolved.match_left = 0.0
    }

    if (msg.radar_left !== undefined) {
      resolved.radar_left = msg.radar_left;
    }
    else {
      resolved.radar_left = 0.0
    }

    if (msg.camera_left !== undefined) {
      resolved.camera_left = msg.camera_left;
    }
    else {
      resolved.camera_left = 0.0
    }

    if (msg.match_right !== undefined) {
      resolved.match_right = msg.match_right;
    }
    else {
      resolved.match_right = 0.0
    }

    if (msg.radar_right !== undefined) {
      resolved.radar_right = msg.radar_right;
    }
    else {
      resolved.radar_right = 0.0
    }

    if (msg.camera_right !== undefined) {
      resolved.camera_right = msg.camera_right;
    }
    else {
      resolved.camera_right = 0.0
    }

    return resolved;
    }
};

module.exports = MsgRadCam;
