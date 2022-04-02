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

class EsrStatus6 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.supply1P8V = null;
      this.supplyN5V = null;
      this.waveDiffA2D = null;
      this.swVersionDSP3rdByte = null;
      this.verticalAlginUpdated = null;
      this.systemPowerMode = null;
      this.foundTarget = null;
      this.recommendUnconverge = null;
      this.factoryAlginStatus1 = null;
      this.factoryAlginStatus2 = null;
      this.factoryMisAlginment = null;
      this.servAlginUpdatesDone = null;
      this.verticalMisAlginment = null;
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
      if (initObj.hasOwnProperty('supply1P8V')) {
        this.supply1P8V = initObj.supply1P8V
      }
      else {
        this.supply1P8V = 0;
      }
      if (initObj.hasOwnProperty('supplyN5V')) {
        this.supplyN5V = initObj.supplyN5V
      }
      else {
        this.supplyN5V = 0;
      }
      if (initObj.hasOwnProperty('waveDiffA2D')) {
        this.waveDiffA2D = initObj.waveDiffA2D
      }
      else {
        this.waveDiffA2D = 0;
      }
      if (initObj.hasOwnProperty('swVersionDSP3rdByte')) {
        this.swVersionDSP3rdByte = initObj.swVersionDSP3rdByte
      }
      else {
        this.swVersionDSP3rdByte = 0;
      }
      if (initObj.hasOwnProperty('verticalAlginUpdated')) {
        this.verticalAlginUpdated = initObj.verticalAlginUpdated
      }
      else {
        this.verticalAlginUpdated = false;
      }
      if (initObj.hasOwnProperty('systemPowerMode')) {
        this.systemPowerMode = initObj.systemPowerMode
      }
      else {
        this.systemPowerMode = 0;
      }
      if (initObj.hasOwnProperty('foundTarget')) {
        this.foundTarget = initObj.foundTarget
      }
      else {
        this.foundTarget = false;
      }
      if (initObj.hasOwnProperty('recommendUnconverge')) {
        this.recommendUnconverge = initObj.recommendUnconverge
      }
      else {
        this.recommendUnconverge = false;
      }
      if (initObj.hasOwnProperty('factoryAlginStatus1')) {
        this.factoryAlginStatus1 = initObj.factoryAlginStatus1
      }
      else {
        this.factoryAlginStatus1 = 0;
      }
      if (initObj.hasOwnProperty('factoryAlginStatus2')) {
        this.factoryAlginStatus2 = initObj.factoryAlginStatus2
      }
      else {
        this.factoryAlginStatus2 = 0;
      }
      if (initObj.hasOwnProperty('factoryMisAlginment')) {
        this.factoryMisAlginment = initObj.factoryMisAlginment
      }
      else {
        this.factoryMisAlginment = 0.0;
      }
      if (initObj.hasOwnProperty('servAlginUpdatesDone')) {
        this.servAlginUpdatesDone = initObj.servAlginUpdatesDone
      }
      else {
        this.servAlginUpdatesDone = 0;
      }
      if (initObj.hasOwnProperty('verticalMisAlginment')) {
        this.verticalMisAlginment = initObj.verticalMisAlginment
      }
      else {
        this.verticalMisAlginment = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus6
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [supply1P8V]
    bufferOffset = _serializer.uint8(obj.supply1P8V, buffer, bufferOffset);
    // Serialize message field [supplyN5V]
    bufferOffset = _serializer.uint8(obj.supplyN5V, buffer, bufferOffset);
    // Serialize message field [waveDiffA2D]
    bufferOffset = _serializer.uint8(obj.waveDiffA2D, buffer, bufferOffset);
    // Serialize message field [swVersionDSP3rdByte]
    bufferOffset = _serializer.uint8(obj.swVersionDSP3rdByte, buffer, bufferOffset);
    // Serialize message field [verticalAlginUpdated]
    bufferOffset = _serializer.bool(obj.verticalAlginUpdated, buffer, bufferOffset);
    // Serialize message field [systemPowerMode]
    bufferOffset = _serializer.uint8(obj.systemPowerMode, buffer, bufferOffset);
    // Serialize message field [foundTarget]
    bufferOffset = _serializer.bool(obj.foundTarget, buffer, bufferOffset);
    // Serialize message field [recommendUnconverge]
    bufferOffset = _serializer.bool(obj.recommendUnconverge, buffer, bufferOffset);
    // Serialize message field [factoryAlginStatus1]
    bufferOffset = _serializer.uint8(obj.factoryAlginStatus1, buffer, bufferOffset);
    // Serialize message field [factoryAlginStatus2]
    bufferOffset = _serializer.uint8(obj.factoryAlginStatus2, buffer, bufferOffset);
    // Serialize message field [factoryMisAlginment]
    bufferOffset = _serializer.float32(obj.factoryMisAlginment, buffer, bufferOffset);
    // Serialize message field [servAlginUpdatesDone]
    bufferOffset = _serializer.uint8(obj.servAlginUpdatesDone, buffer, bufferOffset);
    // Serialize message field [verticalMisAlginment]
    bufferOffset = _serializer.float32(obj.verticalMisAlginment, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus6
    let len;
    let data = new EsrStatus6(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [supply1P8V]
    data.supply1P8V = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [supplyN5V]
    data.supplyN5V = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [waveDiffA2D]
    data.waveDiffA2D = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swVersionDSP3rdByte]
    data.swVersionDSP3rdByte = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [verticalAlginUpdated]
    data.verticalAlginUpdated = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [systemPowerMode]
    data.systemPowerMode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [foundTarget]
    data.foundTarget = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [recommendUnconverge]
    data.recommendUnconverge = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [factoryAlginStatus1]
    data.factoryAlginStatus1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [factoryAlginStatus2]
    data.factoryAlginStatus2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [factoryMisAlginment]
    data.factoryMisAlginment = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [servAlginUpdatesDone]
    data.servAlginUpdatesDone = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [verticalMisAlginment]
    data.verticalMisAlginment = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    return length + 23;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus6';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fab6045bfaa2bc768f235e17159502ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status6
    string      canmsg
    uint8       supply1P8V
    uint8       supplyN5V
    uint8       waveDiffA2D
    uint8       swVersionDSP3rdByte
    bool        verticalAlginUpdated
    uint8       systemPowerMode
    bool        foundTarget
    bool        recommendUnconverge
    uint8       factoryAlginStatus1
    uint8       factoryAlginStatus2
    float32     factoryMisAlginment
    uint8       servAlginUpdatesDone
    float32     verticalMisAlginment
    
    
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
    const resolved = new EsrStatus6(null);
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

    if (msg.supply1P8V !== undefined) {
      resolved.supply1P8V = msg.supply1P8V;
    }
    else {
      resolved.supply1P8V = 0
    }

    if (msg.supplyN5V !== undefined) {
      resolved.supplyN5V = msg.supplyN5V;
    }
    else {
      resolved.supplyN5V = 0
    }

    if (msg.waveDiffA2D !== undefined) {
      resolved.waveDiffA2D = msg.waveDiffA2D;
    }
    else {
      resolved.waveDiffA2D = 0
    }

    if (msg.swVersionDSP3rdByte !== undefined) {
      resolved.swVersionDSP3rdByte = msg.swVersionDSP3rdByte;
    }
    else {
      resolved.swVersionDSP3rdByte = 0
    }

    if (msg.verticalAlginUpdated !== undefined) {
      resolved.verticalAlginUpdated = msg.verticalAlginUpdated;
    }
    else {
      resolved.verticalAlginUpdated = false
    }

    if (msg.systemPowerMode !== undefined) {
      resolved.systemPowerMode = msg.systemPowerMode;
    }
    else {
      resolved.systemPowerMode = 0
    }

    if (msg.foundTarget !== undefined) {
      resolved.foundTarget = msg.foundTarget;
    }
    else {
      resolved.foundTarget = false
    }

    if (msg.recommendUnconverge !== undefined) {
      resolved.recommendUnconverge = msg.recommendUnconverge;
    }
    else {
      resolved.recommendUnconverge = false
    }

    if (msg.factoryAlginStatus1 !== undefined) {
      resolved.factoryAlginStatus1 = msg.factoryAlginStatus1;
    }
    else {
      resolved.factoryAlginStatus1 = 0
    }

    if (msg.factoryAlginStatus2 !== undefined) {
      resolved.factoryAlginStatus2 = msg.factoryAlginStatus2;
    }
    else {
      resolved.factoryAlginStatus2 = 0
    }

    if (msg.factoryMisAlginment !== undefined) {
      resolved.factoryMisAlginment = msg.factoryMisAlginment;
    }
    else {
      resolved.factoryMisAlginment = 0.0
    }

    if (msg.servAlginUpdatesDone !== undefined) {
      resolved.servAlginUpdatesDone = msg.servAlginUpdatesDone;
    }
    else {
      resolved.servAlginUpdatesDone = 0
    }

    if (msg.verticalMisAlginment !== undefined) {
      resolved.verticalMisAlginment = msg.verticalMisAlginment;
    }
    else {
      resolved.verticalMisAlginment = 0.0
    }

    return resolved;
    }
};

module.exports = EsrStatus6;
