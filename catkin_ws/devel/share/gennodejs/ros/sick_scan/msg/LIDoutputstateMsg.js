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

class LIDoutputstateMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.version_number = null;
      this.system_counter = null;
      this.output_state = null;
      this.output_count = null;
      this.time_state = null;
      this.year = null;
      this.month = null;
      this.day = null;
      this.hour = null;
      this.minute = null;
      this.second = null;
      this.microsecond = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('version_number')) {
        this.version_number = initObj.version_number
      }
      else {
        this.version_number = 0;
      }
      if (initObj.hasOwnProperty('system_counter')) {
        this.system_counter = initObj.system_counter
      }
      else {
        this.system_counter = 0;
      }
      if (initObj.hasOwnProperty('output_state')) {
        this.output_state = initObj.output_state
      }
      else {
        this.output_state = [];
      }
      if (initObj.hasOwnProperty('output_count')) {
        this.output_count = initObj.output_count
      }
      else {
        this.output_count = [];
      }
      if (initObj.hasOwnProperty('time_state')) {
        this.time_state = initObj.time_state
      }
      else {
        this.time_state = 0;
      }
      if (initObj.hasOwnProperty('year')) {
        this.year = initObj.year
      }
      else {
        this.year = 0;
      }
      if (initObj.hasOwnProperty('month')) {
        this.month = initObj.month
      }
      else {
        this.month = 0;
      }
      if (initObj.hasOwnProperty('day')) {
        this.day = initObj.day
      }
      else {
        this.day = 0;
      }
      if (initObj.hasOwnProperty('hour')) {
        this.hour = initObj.hour
      }
      else {
        this.hour = 0;
      }
      if (initObj.hasOwnProperty('minute')) {
        this.minute = initObj.minute
      }
      else {
        this.minute = 0;
      }
      if (initObj.hasOwnProperty('second')) {
        this.second = initObj.second
      }
      else {
        this.second = 0;
      }
      if (initObj.hasOwnProperty('microsecond')) {
        this.microsecond = initObj.microsecond
      }
      else {
        this.microsecond = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LIDoutputstateMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [version_number]
    bufferOffset = _serializer.uint16(obj.version_number, buffer, bufferOffset);
    // Serialize message field [system_counter]
    bufferOffset = _serializer.uint32(obj.system_counter, buffer, bufferOffset);
    // Serialize message field [output_state]
    bufferOffset = _arraySerializer.uint8(obj.output_state, buffer, bufferOffset, null);
    // Serialize message field [output_count]
    bufferOffset = _arraySerializer.uint32(obj.output_count, buffer, bufferOffset, null);
    // Serialize message field [time_state]
    bufferOffset = _serializer.uint16(obj.time_state, buffer, bufferOffset);
    // Serialize message field [year]
    bufferOffset = _serializer.uint16(obj.year, buffer, bufferOffset);
    // Serialize message field [month]
    bufferOffset = _serializer.uint8(obj.month, buffer, bufferOffset);
    // Serialize message field [day]
    bufferOffset = _serializer.uint8(obj.day, buffer, bufferOffset);
    // Serialize message field [hour]
    bufferOffset = _serializer.uint8(obj.hour, buffer, bufferOffset);
    // Serialize message field [minute]
    bufferOffset = _serializer.uint8(obj.minute, buffer, bufferOffset);
    // Serialize message field [second]
    bufferOffset = _serializer.uint8(obj.second, buffer, bufferOffset);
    // Serialize message field [microsecond]
    bufferOffset = _serializer.uint32(obj.microsecond, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LIDoutputstateMsg
    let len;
    let data = new LIDoutputstateMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [version_number]
    data.version_number = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [system_counter]
    data.system_counter = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [output_state]
    data.output_state = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [output_count]
    data.output_count = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [time_state]
    data.time_state = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [year]
    data.year = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [month]
    data.month = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [day]
    data.day = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hour]
    data.hour = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [minute]
    data.minute = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [second]
    data.second = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [microsecond]
    data.microsecond = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.output_state.length;
    length += 4 * object.output_count.length;
    return length + 27;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/LIDoutputstateMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e31d4eb61fa1d840e24cb97a0ef71ace';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains the "sSN LIDoutputstate" message of a Sick laser scanner as an ros message.
    #
    
    Header header
    
    # Status code
    uint16 version_number # Status code version number
    uint32 system_counter # Status code system counter (time in microsec since power up, max. 71 min then starting from 0 again)
    
    # Array of output states (state and count)
    uint8[] output_state  # output states, each state with value 0 (not active), 1 (active) or 2 (not used)
    uint32[] output_count # output counter
    
    # Time block (sensortime from the last change of min. one of the outputs)
    uint16 time_state   # No time data: 0, Time data: 1
    uint16 year        # f.e. 2021
    uint8 month        # 1 ... 12
    uint8 day          # 1 ... 31
    uint8 hour         # 0 ... 23
    uint8 minute       # 0 ... 59
    uint8 second       # 0 ... 59
    uint32 microsecond # 0 ... 999999
    
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
    const resolved = new LIDoutputstateMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.version_number !== undefined) {
      resolved.version_number = msg.version_number;
    }
    else {
      resolved.version_number = 0
    }

    if (msg.system_counter !== undefined) {
      resolved.system_counter = msg.system_counter;
    }
    else {
      resolved.system_counter = 0
    }

    if (msg.output_state !== undefined) {
      resolved.output_state = msg.output_state;
    }
    else {
      resolved.output_state = []
    }

    if (msg.output_count !== undefined) {
      resolved.output_count = msg.output_count;
    }
    else {
      resolved.output_count = []
    }

    if (msg.time_state !== undefined) {
      resolved.time_state = msg.time_state;
    }
    else {
      resolved.time_state = 0
    }

    if (msg.year !== undefined) {
      resolved.year = msg.year;
    }
    else {
      resolved.year = 0
    }

    if (msg.month !== undefined) {
      resolved.month = msg.month;
    }
    else {
      resolved.month = 0
    }

    if (msg.day !== undefined) {
      resolved.day = msg.day;
    }
    else {
      resolved.day = 0
    }

    if (msg.hour !== undefined) {
      resolved.hour = msg.hour;
    }
    else {
      resolved.hour = 0
    }

    if (msg.minute !== undefined) {
      resolved.minute = msg.minute;
    }
    else {
      resolved.minute = 0
    }

    if (msg.second !== undefined) {
      resolved.second = msg.second;
    }
    else {
      resolved.second = 0
    }

    if (msg.microsecond !== undefined) {
      resolved.microsecond = msg.microsecond;
    }
    else {
      resolved.microsecond = 0
    }

    return resolved;
    }
};

module.exports = LIDoutputstateMsg;
