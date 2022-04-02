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

class EsrTrack {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.track_ID = null;
      this.track_lat_rate = null;
      this.track_group_changed = null;
      this.track_status = null;
      this.track_angle = null;
      this.track_range = null;
      this.track_bridge_object = null;
      this.track_rolling_count = null;
      this.track_width = null;
      this.track_range_accel = null;
      this.track_med_range_mode = null;
      this.track_range_rate = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('canmsg')) {
        this.canmsg = initObj.canmsg
      }
      else {
        this.canmsg = '';
      }
      if (initObj.hasOwnProperty('track_ID')) {
        this.track_ID = initObj.track_ID
      }
      else {
        this.track_ID = 0;
      }
      if (initObj.hasOwnProperty('track_lat_rate')) {
        this.track_lat_rate = initObj.track_lat_rate
      }
      else {
        this.track_lat_rate = 0.0;
      }
      if (initObj.hasOwnProperty('track_group_changed')) {
        this.track_group_changed = initObj.track_group_changed
      }
      else {
        this.track_group_changed = false;
      }
      if (initObj.hasOwnProperty('track_status')) {
        this.track_status = initObj.track_status
      }
      else {
        this.track_status = 0;
      }
      if (initObj.hasOwnProperty('track_angle')) {
        this.track_angle = initObj.track_angle
      }
      else {
        this.track_angle = 0.0;
      }
      if (initObj.hasOwnProperty('track_range')) {
        this.track_range = initObj.track_range
      }
      else {
        this.track_range = 0.0;
      }
      if (initObj.hasOwnProperty('track_bridge_object')) {
        this.track_bridge_object = initObj.track_bridge_object
      }
      else {
        this.track_bridge_object = false;
      }
      if (initObj.hasOwnProperty('track_rolling_count')) {
        this.track_rolling_count = initObj.track_rolling_count
      }
      else {
        this.track_rolling_count = false;
      }
      if (initObj.hasOwnProperty('track_width')) {
        this.track_width = initObj.track_width
      }
      else {
        this.track_width = 0.0;
      }
      if (initObj.hasOwnProperty('track_range_accel')) {
        this.track_range_accel = initObj.track_range_accel
      }
      else {
        this.track_range_accel = 0.0;
      }
      if (initObj.hasOwnProperty('track_med_range_mode')) {
        this.track_med_range_mode = initObj.track_med_range_mode
      }
      else {
        this.track_med_range_mode = 0;
      }
      if (initObj.hasOwnProperty('track_range_rate')) {
        this.track_range_rate = initObj.track_range_rate
      }
      else {
        this.track_range_rate = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrTrack
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [track_ID]
    bufferOffset = _serializer.uint8(obj.track_ID, buffer, bufferOffset);
    // Serialize message field [track_lat_rate]
    bufferOffset = _serializer.float32(obj.track_lat_rate, buffer, bufferOffset);
    // Serialize message field [track_group_changed]
    bufferOffset = _serializer.bool(obj.track_group_changed, buffer, bufferOffset);
    // Serialize message field [track_status]
    bufferOffset = _serializer.uint8(obj.track_status, buffer, bufferOffset);
    // Serialize message field [track_angle]
    bufferOffset = _serializer.float32(obj.track_angle, buffer, bufferOffset);
    // Serialize message field [track_range]
    bufferOffset = _serializer.float32(obj.track_range, buffer, bufferOffset);
    // Serialize message field [track_bridge_object]
    bufferOffset = _serializer.bool(obj.track_bridge_object, buffer, bufferOffset);
    // Serialize message field [track_rolling_count]
    bufferOffset = _serializer.bool(obj.track_rolling_count, buffer, bufferOffset);
    // Serialize message field [track_width]
    bufferOffset = _serializer.float32(obj.track_width, buffer, bufferOffset);
    // Serialize message field [track_range_accel]
    bufferOffset = _serializer.float32(obj.track_range_accel, buffer, bufferOffset);
    // Serialize message field [track_med_range_mode]
    bufferOffset = _serializer.uint8(obj.track_med_range_mode, buffer, bufferOffset);
    // Serialize message field [track_range_rate]
    bufferOffset = _serializer.float32(obj.track_range_rate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrTrack
    let len;
    let data = new EsrTrack(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [track_ID]
    data.track_ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [track_lat_rate]
    data.track_lat_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_group_changed]
    data.track_group_changed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [track_status]
    data.track_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [track_angle]
    data.track_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_range]
    data.track_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_bridge_object]
    data.track_bridge_object = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [track_rolling_count]
    data.track_rolling_count = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [track_width]
    data.track_width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_range_accel]
    data.track_range_accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [track_med_range_mode]
    data.track_med_range_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [track_range_rate]
    data.track_range_rate = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    return length + 34;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrTrack';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a9beb5caea714982a56115450f110c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR Track Msg
    string        canmsg
    uint8         track_ID
    float32       track_lat_rate
    bool          track_group_changed
    uint8         track_status
    float32       track_angle
    float32       track_range
    bool          track_bridge_object
    bool          track_rolling_count
    float32       track_width
    float32       track_range_accel
    uint8         track_med_range_mode
    float32       track_range_rate
    
    
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
    const resolved = new EsrTrack(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.canmsg !== undefined) {
      resolved.canmsg = msg.canmsg;
    }
    else {
      resolved.canmsg = ''
    }

    if (msg.track_ID !== undefined) {
      resolved.track_ID = msg.track_ID;
    }
    else {
      resolved.track_ID = 0
    }

    if (msg.track_lat_rate !== undefined) {
      resolved.track_lat_rate = msg.track_lat_rate;
    }
    else {
      resolved.track_lat_rate = 0.0
    }

    if (msg.track_group_changed !== undefined) {
      resolved.track_group_changed = msg.track_group_changed;
    }
    else {
      resolved.track_group_changed = false
    }

    if (msg.track_status !== undefined) {
      resolved.track_status = msg.track_status;
    }
    else {
      resolved.track_status = 0
    }

    if (msg.track_angle !== undefined) {
      resolved.track_angle = msg.track_angle;
    }
    else {
      resolved.track_angle = 0.0
    }

    if (msg.track_range !== undefined) {
      resolved.track_range = msg.track_range;
    }
    else {
      resolved.track_range = 0.0
    }

    if (msg.track_bridge_object !== undefined) {
      resolved.track_bridge_object = msg.track_bridge_object;
    }
    else {
      resolved.track_bridge_object = false
    }

    if (msg.track_rolling_count !== undefined) {
      resolved.track_rolling_count = msg.track_rolling_count;
    }
    else {
      resolved.track_rolling_count = false
    }

    if (msg.track_width !== undefined) {
      resolved.track_width = msg.track_width;
    }
    else {
      resolved.track_width = 0.0
    }

    if (msg.track_range_accel !== undefined) {
      resolved.track_range_accel = msg.track_range_accel;
    }
    else {
      resolved.track_range_accel = 0.0
    }

    if (msg.track_med_range_mode !== undefined) {
      resolved.track_med_range_mode = msg.track_med_range_mode;
    }
    else {
      resolved.track_med_range_mode = 0
    }

    if (msg.track_range_rate !== undefined) {
      resolved.track_range_rate = msg.track_range_rate;
    }
    else {
      resolved.track_range_rate = 0.0
    }

    return resolved;
    }
};

module.exports = EsrTrack;
