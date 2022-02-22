// Auto-generated. Do not edit!

// (in-package site.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ModeCRadar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.range = null;
      this.bearing = null;
      this.altitude = null;
      this.code = null;
      this.ident = null;
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
      if (initObj.hasOwnProperty('bearing')) {
        this.bearing = initObj.bearing
      }
      else {
        this.bearing = 0.0;
      }
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = 0.0;
      }
      if (initObj.hasOwnProperty('code')) {
        this.code = initObj.code
      }
      else {
        this.code = 0;
      }
      if (initObj.hasOwnProperty('ident')) {
        this.ident = initObj.ident
      }
      else {
        this.ident = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModeCRadar
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float32(obj.range, buffer, bufferOffset);
    // Serialize message field [bearing]
    bufferOffset = _serializer.float32(obj.bearing, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = _serializer.float32(obj.altitude, buffer, bufferOffset);
    // Serialize message field [code]
    bufferOffset = _serializer.uint16(obj.code, buffer, bufferOffset);
    // Serialize message field [ident]
    bufferOffset = _serializer.bool(obj.ident, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModeCRadar
    let len;
    let data = new ModeCRadar(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bearing]
    data.bearing = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [code]
    data.code = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [ident]
    data.ident = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'site/ModeCRadar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '19c4f5ea27d7018d84f81236837f5bfe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 range  # meters
    float32 bearing  # radians clockwise about Z axis of header frame
    float32 altitude  # Pressure altitude (m)
    uint16 code # Transponder code
    bool ident  # If ident button was pressed
    
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
    const resolved = new ModeCRadar(null);
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

    if (msg.bearing !== undefined) {
      resolved.bearing = msg.bearing;
    }
    else {
      resolved.bearing = 0.0
    }

    if (msg.altitude !== undefined) {
      resolved.altitude = msg.altitude;
    }
    else {
      resolved.altitude = 0.0
    }

    if (msg.code !== undefined) {
      resolved.code = msg.code;
    }
    else {
      resolved.code = 0
    }

    if (msg.ident !== undefined) {
      resolved.ident = msg.ident;
    }
    else {
      resolved.ident = false
    }

    return resolved;
    }
};

module.exports = ModeCRadar;
