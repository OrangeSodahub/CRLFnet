// Auto-generated. Do not edit!

// (in-package per_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SensorMsgsRadar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.range = null;
      this.total_front_esr_tracks = null;
      this.total_front_right_esr_tracks = null;
      this.total_front_left_esr_tracks = null;
      this.front_esr_tracker_counter = null;
      this.front_left_esr_tracker_counter = null;
      this.front_right_esr_tracker_counter = null;
      this.total_rear_sbmp_tracks = null;
      this.rear_sbmp_tracker_counter = null;
      this.rear_sbmp_tracklist = null;
      this.total_fsm4_tracks = null;
      this.fsm4_tracklist = null;
      this.fsm4_tracker_counter = null;
      this.front_esr_tracklist = null;
      this.front_right_esr_tracklist = null;
      this.front_left_esr_tracklist = null;
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
      if (initObj.hasOwnProperty('total_front_esr_tracks')) {
        this.total_front_esr_tracks = initObj.total_front_esr_tracks
      }
      else {
        this.total_front_esr_tracks = 0.0;
      }
      if (initObj.hasOwnProperty('total_front_right_esr_tracks')) {
        this.total_front_right_esr_tracks = initObj.total_front_right_esr_tracks
      }
      else {
        this.total_front_right_esr_tracks = 0.0;
      }
      if (initObj.hasOwnProperty('total_front_left_esr_tracks')) {
        this.total_front_left_esr_tracks = initObj.total_front_left_esr_tracks
      }
      else {
        this.total_front_left_esr_tracks = 0.0;
      }
      if (initObj.hasOwnProperty('front_esr_tracker_counter')) {
        this.front_esr_tracker_counter = initObj.front_esr_tracker_counter
      }
      else {
        this.front_esr_tracker_counter = 0.0;
      }
      if (initObj.hasOwnProperty('front_left_esr_tracker_counter')) {
        this.front_left_esr_tracker_counter = initObj.front_left_esr_tracker_counter
      }
      else {
        this.front_left_esr_tracker_counter = 0.0;
      }
      if (initObj.hasOwnProperty('front_right_esr_tracker_counter')) {
        this.front_right_esr_tracker_counter = initObj.front_right_esr_tracker_counter
      }
      else {
        this.front_right_esr_tracker_counter = 0.0;
      }
      if (initObj.hasOwnProperty('total_rear_sbmp_tracks')) {
        this.total_rear_sbmp_tracks = initObj.total_rear_sbmp_tracks
      }
      else {
        this.total_rear_sbmp_tracks = 0.0;
      }
      if (initObj.hasOwnProperty('rear_sbmp_tracker_counter')) {
        this.rear_sbmp_tracker_counter = initObj.rear_sbmp_tracker_counter
      }
      else {
        this.rear_sbmp_tracker_counter = 0.0;
      }
      if (initObj.hasOwnProperty('rear_sbmp_tracklist')) {
        this.rear_sbmp_tracklist = initObj.rear_sbmp_tracklist
      }
      else {
        this.rear_sbmp_tracklist = 0.0;
      }
      if (initObj.hasOwnProperty('total_fsm4_tracks')) {
        this.total_fsm4_tracks = initObj.total_fsm4_tracks
      }
      else {
        this.total_fsm4_tracks = 0.0;
      }
      if (initObj.hasOwnProperty('fsm4_tracklist')) {
        this.fsm4_tracklist = initObj.fsm4_tracklist
      }
      else {
        this.fsm4_tracklist = 0.0;
      }
      if (initObj.hasOwnProperty('fsm4_tracker_counter')) {
        this.fsm4_tracker_counter = initObj.fsm4_tracker_counter
      }
      else {
        this.fsm4_tracker_counter = 0.0;
      }
      if (initObj.hasOwnProperty('front_esr_tracklist')) {
        this.front_esr_tracklist = initObj.front_esr_tracklist
      }
      else {
        this.front_esr_tracklist = [];
      }
      if (initObj.hasOwnProperty('front_right_esr_tracklist')) {
        this.front_right_esr_tracklist = initObj.front_right_esr_tracklist
      }
      else {
        this.front_right_esr_tracklist = [];
      }
      if (initObj.hasOwnProperty('front_left_esr_tracklist')) {
        this.front_left_esr_tracklist = initObj.front_left_esr_tracklist
      }
      else {
        this.front_left_esr_tracklist = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorMsgsRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float32(obj.range, buffer, bufferOffset);
    // Serialize message field [total_front_esr_tracks]
    bufferOffset = _serializer.float32(obj.total_front_esr_tracks, buffer, bufferOffset);
    // Serialize message field [total_front_right_esr_tracks]
    bufferOffset = _serializer.float32(obj.total_front_right_esr_tracks, buffer, bufferOffset);
    // Serialize message field [total_front_left_esr_tracks]
    bufferOffset = _serializer.float32(obj.total_front_left_esr_tracks, buffer, bufferOffset);
    // Serialize message field [front_esr_tracker_counter]
    bufferOffset = _serializer.float32(obj.front_esr_tracker_counter, buffer, bufferOffset);
    // Serialize message field [front_left_esr_tracker_counter]
    bufferOffset = _serializer.float32(obj.front_left_esr_tracker_counter, buffer, bufferOffset);
    // Serialize message field [front_right_esr_tracker_counter]
    bufferOffset = _serializer.float32(obj.front_right_esr_tracker_counter, buffer, bufferOffset);
    // Serialize message field [total_rear_sbmp_tracks]
    bufferOffset = _serializer.float32(obj.total_rear_sbmp_tracks, buffer, bufferOffset);
    // Serialize message field [rear_sbmp_tracker_counter]
    bufferOffset = _serializer.float32(obj.rear_sbmp_tracker_counter, buffer, bufferOffset);
    // Serialize message field [rear_sbmp_tracklist]
    bufferOffset = _serializer.float32(obj.rear_sbmp_tracklist, buffer, bufferOffset);
    // Serialize message field [total_fsm4_tracks]
    bufferOffset = _serializer.float32(obj.total_fsm4_tracks, buffer, bufferOffset);
    // Serialize message field [fsm4_tracklist]
    bufferOffset = _serializer.float32(obj.fsm4_tracklist, buffer, bufferOffset);
    // Serialize message field [fsm4_tracker_counter]
    bufferOffset = _serializer.float32(obj.fsm4_tracker_counter, buffer, bufferOffset);
    // Serialize message field [front_esr_tracklist]
    bufferOffset = _arraySerializer.float32(obj.front_esr_tracklist, buffer, bufferOffset, null);
    // Serialize message field [front_right_esr_tracklist]
    bufferOffset = _arraySerializer.float32(obj.front_right_esr_tracklist, buffer, bufferOffset, null);
    // Serialize message field [front_left_esr_tracklist]
    bufferOffset = _arraySerializer.float32(obj.front_left_esr_tracklist, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorMsgsRadar
    let len;
    let data = new SensorMsgsRadar(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [total_front_esr_tracks]
    data.total_front_esr_tracks = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [total_front_right_esr_tracks]
    data.total_front_right_esr_tracks = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [total_front_left_esr_tracks]
    data.total_front_left_esr_tracks = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [front_esr_tracker_counter]
    data.front_esr_tracker_counter = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [front_left_esr_tracker_counter]
    data.front_left_esr_tracker_counter = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [front_right_esr_tracker_counter]
    data.front_right_esr_tracker_counter = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [total_rear_sbmp_tracks]
    data.total_rear_sbmp_tracks = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rear_sbmp_tracker_counter]
    data.rear_sbmp_tracker_counter = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rear_sbmp_tracklist]
    data.rear_sbmp_tracklist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [total_fsm4_tracks]
    data.total_fsm4_tracks = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fsm4_tracklist]
    data.fsm4_tracklist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fsm4_tracker_counter]
    data.fsm4_tracker_counter = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [front_esr_tracklist]
    data.front_esr_tracklist = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [front_right_esr_tracklist]
    data.front_right_esr_tracklist = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [front_left_esr_tracklist]
    data.front_left_esr_tracklist = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.front_esr_tracklist.length;
    length += 4 * object.front_right_esr_tracklist.length;
    length += 4 * object.front_left_esr_tracklist.length;
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'per_msgs/SensorMsgsRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b695fa4723d4915d6ab0e488542236e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 range  # meters
    float32 total_front_esr_tracks
    float32 total_front_right_esr_tracks
    float32 total_front_left_esr_tracks
    float32 front_esr_tracker_counter
    float32 front_left_esr_tracker_counter
    float32 front_right_esr_tracker_counter
    float32 total_rear_sbmp_tracks
    float32 rear_sbmp_tracker_counter
    float32 rear_sbmp_tracklist
    float32 total_fsm4_tracks
    float32 fsm4_tracklist
    float32 fsm4_tracker_counter
    float32[] front_esr_tracklist
    float32[] front_right_esr_tracklist
    float32[] front_left_esr_tracklist
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
    const resolved = new SensorMsgsRadar(null);
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

    if (msg.total_front_esr_tracks !== undefined) {
      resolved.total_front_esr_tracks = msg.total_front_esr_tracks;
    }
    else {
      resolved.total_front_esr_tracks = 0.0
    }

    if (msg.total_front_right_esr_tracks !== undefined) {
      resolved.total_front_right_esr_tracks = msg.total_front_right_esr_tracks;
    }
    else {
      resolved.total_front_right_esr_tracks = 0.0
    }

    if (msg.total_front_left_esr_tracks !== undefined) {
      resolved.total_front_left_esr_tracks = msg.total_front_left_esr_tracks;
    }
    else {
      resolved.total_front_left_esr_tracks = 0.0
    }

    if (msg.front_esr_tracker_counter !== undefined) {
      resolved.front_esr_tracker_counter = msg.front_esr_tracker_counter;
    }
    else {
      resolved.front_esr_tracker_counter = 0.0
    }

    if (msg.front_left_esr_tracker_counter !== undefined) {
      resolved.front_left_esr_tracker_counter = msg.front_left_esr_tracker_counter;
    }
    else {
      resolved.front_left_esr_tracker_counter = 0.0
    }

    if (msg.front_right_esr_tracker_counter !== undefined) {
      resolved.front_right_esr_tracker_counter = msg.front_right_esr_tracker_counter;
    }
    else {
      resolved.front_right_esr_tracker_counter = 0.0
    }

    if (msg.total_rear_sbmp_tracks !== undefined) {
      resolved.total_rear_sbmp_tracks = msg.total_rear_sbmp_tracks;
    }
    else {
      resolved.total_rear_sbmp_tracks = 0.0
    }

    if (msg.rear_sbmp_tracker_counter !== undefined) {
      resolved.rear_sbmp_tracker_counter = msg.rear_sbmp_tracker_counter;
    }
    else {
      resolved.rear_sbmp_tracker_counter = 0.0
    }

    if (msg.rear_sbmp_tracklist !== undefined) {
      resolved.rear_sbmp_tracklist = msg.rear_sbmp_tracklist;
    }
    else {
      resolved.rear_sbmp_tracklist = 0.0
    }

    if (msg.total_fsm4_tracks !== undefined) {
      resolved.total_fsm4_tracks = msg.total_fsm4_tracks;
    }
    else {
      resolved.total_fsm4_tracks = 0.0
    }

    if (msg.fsm4_tracklist !== undefined) {
      resolved.fsm4_tracklist = msg.fsm4_tracklist;
    }
    else {
      resolved.fsm4_tracklist = 0.0
    }

    if (msg.fsm4_tracker_counter !== undefined) {
      resolved.fsm4_tracker_counter = msg.fsm4_tracker_counter;
    }
    else {
      resolved.fsm4_tracker_counter = 0.0
    }

    if (msg.front_esr_tracklist !== undefined) {
      resolved.front_esr_tracklist = msg.front_esr_tracklist;
    }
    else {
      resolved.front_esr_tracklist = []
    }

    if (msg.front_right_esr_tracklist !== undefined) {
      resolved.front_right_esr_tracklist = msg.front_right_esr_tracklist;
    }
    else {
      resolved.front_right_esr_tracklist = []
    }

    if (msg.front_left_esr_tracklist !== undefined) {
      resolved.front_left_esr_tracklist = msg.front_left_esr_tracklist;
    }
    else {
      resolved.front_left_esr_tracklist = []
    }

    return resolved;
    }
};

module.exports = SensorMsgsRadar;
