// Auto-generated. Do not edit!

// (in-package radar_pa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let radar_msg_A = require('./radar_msg_A.js');
let radar_msg_B = require('./radar_msg_B.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class radar_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.data_A = null;
      this.data_B = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('data_A')) {
        this.data_A = initObj.data_A
      }
      else {
        this.data_A = new Array(48).fill(new radar_msg_A());
      }
      if (initObj.hasOwnProperty('data_B')) {
        this.data_B = initObj.data_B
      }
      else {
        this.data_B = new Array(48).fill(new radar_msg_B());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type radar_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Check that the constant length array field [data_A] has the right length
    if (obj.data_A.length !== 48) {
      throw new Error('Unable to serialize array field data_A - length must be 48')
    }
    // Serialize message field [data_A]
    obj.data_A.forEach((val) => {
      bufferOffset = radar_msg_A.serialize(val, buffer, bufferOffset);
    });
    // Check that the constant length array field [data_B] has the right length
    if (obj.data_B.length !== 48) {
      throw new Error('Unable to serialize array field data_B - length must be 48')
    }
    // Serialize message field [data_B]
    obj.data_B.forEach((val) => {
      bufferOffset = radar_msg_B.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type radar_msg
    let len;
    let data = new radar_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [data_A]
    len = 48;
    data.data_A = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data_A[i] = radar_msg_A.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [data_B]
    len = 48;
    data.data_B = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data_B[i] = radar_msg_B.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 2160;
  }

  static datatype() {
    // Returns string type for a message object
    return 'radar_pa_msgs/radar_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '61aec62f180ed30f21938b01f727fc33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    radar_msg_A[48] data_A
    radar_msg_B[48] data_B
    
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
    MSG: radar_pa_msgs/radar_msg_A
    uint8   message
    uint32  ID
    float32 distance
    float32 velocity
    float32 power
    float32 angle
    uint8   is_target
    uint8   counter
    
    ================================================================================
    MSG: radar_pa_msgs/radar_msg_B
    uint8   message
    uint32  ID
    float32 distance_deviation
    float32 velocity_deviation
    float32 angle_deviation
    float32 proability_target
    uint8   counter
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new radar_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.data_A !== undefined) {
      resolved.data_A = new Array(48)
      for (let i = 0; i < resolved.data_A.length; ++i) {
        if (msg.data_A.length > i) {
          resolved.data_A[i] = radar_msg_A.Resolve(msg.data_A[i]);
        }
        else {
          resolved.data_A[i] = new radar_msg_A();
        }
      }
    }
    else {
      resolved.data_A = new Array(48).fill(new radar_msg_A())
    }

    if (msg.data_B !== undefined) {
      resolved.data_B = new Array(48)
      for (let i = 0; i < resolved.data_B.length; ++i) {
        if (msg.data_B.length > i) {
          resolved.data_B[i] = radar_msg_B.Resolve(msg.data_B[i]);
        }
        else {
          resolved.data_B[i] = new radar_msg_B();
        }
      }
    }
    else {
      resolved.data_B = new Array(48).fill(new radar_msg_B())
    }

    return resolved;
    }
};

module.exports = radar_msg;
