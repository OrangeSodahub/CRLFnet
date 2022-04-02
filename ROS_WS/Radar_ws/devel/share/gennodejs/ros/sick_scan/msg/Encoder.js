// Auto-generated. Do not edit!

// (in-package sick_scan.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Encoder {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.enc_position = null;
      this.enc_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('enc_position')) {
        this.enc_position = initObj.enc_position
      }
      else {
        this.enc_position = 0;
      }
      if (initObj.hasOwnProperty('enc_speed')) {
        this.enc_speed = initObj.enc_speed
      }
      else {
        this.enc_speed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Encoder
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [enc_position]
    bufferOffset = _serializer.int32(obj.enc_position, buffer, bufferOffset);
    // Serialize message field [enc_speed]
    bufferOffset = _serializer.int16(obj.enc_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Encoder
    let len;
    let data = new Encoder(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [enc_position]
    data.enc_position = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [enc_speed]
    data.enc_speed = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/Encoder';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '54930fcfc2dd947b1ad5f398b208008f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #This message contains the counter reading of the encoder at the datagram time (timestamp in header).
    
    Header header           # same information as in laserscan and Pointcloud2 message
    
    int32 enc_position     # number of ticks
    int16 enc_speed         # number of ticks per millimeter
    
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
    const resolved = new Encoder(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.enc_position !== undefined) {
      resolved.enc_position = msg.enc_position;
    }
    else {
      resolved.enc_position = 0
    }

    if (msg.enc_speed !== undefined) {
      resolved.enc_speed = msg.enc_speed;
    }
    else {
      resolved.enc_speed = 0
    }

    return resolved;
    }
};

module.exports = Encoder;
