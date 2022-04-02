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

class EsrStatus4 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.canmsg = null;
      this.rollingCount3 = null;
      this.mrlrMode = null;
      this.patialBlockage = null;
      this.sideLobeBlockage = null;
      this.lrOnlyGratingLobeDet = null;
      this.truckTargetDet = null;
      this.pathIdAcc = null;
      this.pathIdCmmbMove = null;
      this.pathIdCmmbStat = null;
      this.pathIdFcwMove = null;
      this.pathIdFcwStat = null;
      this.pathIdAccStat = null;
      this.autoAlginAngle = null;
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
      if (initObj.hasOwnProperty('rollingCount3')) {
        this.rollingCount3 = initObj.rollingCount3
      }
      else {
        this.rollingCount3 = 0;
      }
      if (initObj.hasOwnProperty('mrlrMode')) {
        this.mrlrMode = initObj.mrlrMode
      }
      else {
        this.mrlrMode = 0;
      }
      if (initObj.hasOwnProperty('patialBlockage')) {
        this.patialBlockage = initObj.patialBlockage
      }
      else {
        this.patialBlockage = false;
      }
      if (initObj.hasOwnProperty('sideLobeBlockage')) {
        this.sideLobeBlockage = initObj.sideLobeBlockage
      }
      else {
        this.sideLobeBlockage = false;
      }
      if (initObj.hasOwnProperty('lrOnlyGratingLobeDet')) {
        this.lrOnlyGratingLobeDet = initObj.lrOnlyGratingLobeDet
      }
      else {
        this.lrOnlyGratingLobeDet = false;
      }
      if (initObj.hasOwnProperty('truckTargetDet')) {
        this.truckTargetDet = initObj.truckTargetDet
      }
      else {
        this.truckTargetDet = false;
      }
      if (initObj.hasOwnProperty('pathIdAcc')) {
        this.pathIdAcc = initObj.pathIdAcc
      }
      else {
        this.pathIdAcc = 0;
      }
      if (initObj.hasOwnProperty('pathIdCmmbMove')) {
        this.pathIdCmmbMove = initObj.pathIdCmmbMove
      }
      else {
        this.pathIdCmmbMove = 0;
      }
      if (initObj.hasOwnProperty('pathIdCmmbStat')) {
        this.pathIdCmmbStat = initObj.pathIdCmmbStat
      }
      else {
        this.pathIdCmmbStat = 0;
      }
      if (initObj.hasOwnProperty('pathIdFcwMove')) {
        this.pathIdFcwMove = initObj.pathIdFcwMove
      }
      else {
        this.pathIdFcwMove = 0;
      }
      if (initObj.hasOwnProperty('pathIdFcwStat')) {
        this.pathIdFcwStat = initObj.pathIdFcwStat
      }
      else {
        this.pathIdFcwStat = 0;
      }
      if (initObj.hasOwnProperty('pathIdAccStat')) {
        this.pathIdAccStat = initObj.pathIdAccStat
      }
      else {
        this.pathIdAccStat = 0;
      }
      if (initObj.hasOwnProperty('autoAlginAngle')) {
        this.autoAlginAngle = initObj.autoAlginAngle
      }
      else {
        this.autoAlginAngle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EsrStatus4
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [canmsg]
    bufferOffset = _serializer.string(obj.canmsg, buffer, bufferOffset);
    // Serialize message field [rollingCount3]
    bufferOffset = _serializer.uint8(obj.rollingCount3, buffer, bufferOffset);
    // Serialize message field [mrlrMode]
    bufferOffset = _serializer.uint8(obj.mrlrMode, buffer, bufferOffset);
    // Serialize message field [patialBlockage]
    bufferOffset = _serializer.bool(obj.patialBlockage, buffer, bufferOffset);
    // Serialize message field [sideLobeBlockage]
    bufferOffset = _serializer.bool(obj.sideLobeBlockage, buffer, bufferOffset);
    // Serialize message field [lrOnlyGratingLobeDet]
    bufferOffset = _serializer.bool(obj.lrOnlyGratingLobeDet, buffer, bufferOffset);
    // Serialize message field [truckTargetDet]
    bufferOffset = _serializer.bool(obj.truckTargetDet, buffer, bufferOffset);
    // Serialize message field [pathIdAcc]
    bufferOffset = _serializer.uint8(obj.pathIdAcc, buffer, bufferOffset);
    // Serialize message field [pathIdCmmbMove]
    bufferOffset = _serializer.uint8(obj.pathIdCmmbMove, buffer, bufferOffset);
    // Serialize message field [pathIdCmmbStat]
    bufferOffset = _serializer.uint8(obj.pathIdCmmbStat, buffer, bufferOffset);
    // Serialize message field [pathIdFcwMove]
    bufferOffset = _serializer.uint8(obj.pathIdFcwMove, buffer, bufferOffset);
    // Serialize message field [pathIdFcwStat]
    bufferOffset = _serializer.uint8(obj.pathIdFcwStat, buffer, bufferOffset);
    // Serialize message field [pathIdAccStat]
    bufferOffset = _serializer.uint8(obj.pathIdAccStat, buffer, bufferOffset);
    // Serialize message field [autoAlginAngle]
    bufferOffset = _serializer.float32(obj.autoAlginAngle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EsrStatus4
    let len;
    let data = new EsrStatus4(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [canmsg]
    data.canmsg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rollingCount3]
    data.rollingCount3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mrlrMode]
    data.mrlrMode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [patialBlockage]
    data.patialBlockage = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sideLobeBlockage]
    data.sideLobeBlockage = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [lrOnlyGratingLobeDet]
    data.lrOnlyGratingLobeDet = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [truckTargetDet]
    data.truckTargetDet = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pathIdAcc]
    data.pathIdAcc = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pathIdCmmbMove]
    data.pathIdCmmbMove = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pathIdCmmbStat]
    data.pathIdCmmbStat = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pathIdFcwMove]
    data.pathIdFcwMove = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pathIdFcwStat]
    data.pathIdFcwStat = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pathIdAccStat]
    data.pathIdAccStat = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [autoAlginAngle]
    data.autoAlginAngle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.canmsg);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delphi_esr_msgs/EsrStatus4';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'abec2ac03bbfc0ae47f593463cff96cc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # ESR status4
    string      canmsg
    uint8       rollingCount3
    uint8       mrlrMode
    bool        patialBlockage
    bool        sideLobeBlockage
    bool        lrOnlyGratingLobeDet
    bool        truckTargetDet
    uint8       pathIdAcc
    uint8       pathIdCmmbMove
    uint8       pathIdCmmbStat
    uint8       pathIdFcwMove
    uint8       pathIdFcwStat
    uint8       pathIdAccStat
    float32     autoAlginAngle
    
    
    
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
    const resolved = new EsrStatus4(null);
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

    if (msg.rollingCount3 !== undefined) {
      resolved.rollingCount3 = msg.rollingCount3;
    }
    else {
      resolved.rollingCount3 = 0
    }

    if (msg.mrlrMode !== undefined) {
      resolved.mrlrMode = msg.mrlrMode;
    }
    else {
      resolved.mrlrMode = 0
    }

    if (msg.patialBlockage !== undefined) {
      resolved.patialBlockage = msg.patialBlockage;
    }
    else {
      resolved.patialBlockage = false
    }

    if (msg.sideLobeBlockage !== undefined) {
      resolved.sideLobeBlockage = msg.sideLobeBlockage;
    }
    else {
      resolved.sideLobeBlockage = false
    }

    if (msg.lrOnlyGratingLobeDet !== undefined) {
      resolved.lrOnlyGratingLobeDet = msg.lrOnlyGratingLobeDet;
    }
    else {
      resolved.lrOnlyGratingLobeDet = false
    }

    if (msg.truckTargetDet !== undefined) {
      resolved.truckTargetDet = msg.truckTargetDet;
    }
    else {
      resolved.truckTargetDet = false
    }

    if (msg.pathIdAcc !== undefined) {
      resolved.pathIdAcc = msg.pathIdAcc;
    }
    else {
      resolved.pathIdAcc = 0
    }

    if (msg.pathIdCmmbMove !== undefined) {
      resolved.pathIdCmmbMove = msg.pathIdCmmbMove;
    }
    else {
      resolved.pathIdCmmbMove = 0
    }

    if (msg.pathIdCmmbStat !== undefined) {
      resolved.pathIdCmmbStat = msg.pathIdCmmbStat;
    }
    else {
      resolved.pathIdCmmbStat = 0
    }

    if (msg.pathIdFcwMove !== undefined) {
      resolved.pathIdFcwMove = msg.pathIdFcwMove;
    }
    else {
      resolved.pathIdFcwMove = 0
    }

    if (msg.pathIdFcwStat !== undefined) {
      resolved.pathIdFcwStat = msg.pathIdFcwStat;
    }
    else {
      resolved.pathIdFcwStat = 0
    }

    if (msg.pathIdAccStat !== undefined) {
      resolved.pathIdAccStat = msg.pathIdAccStat;
    }
    else {
      resolved.pathIdAccStat = 0
    }

    if (msg.autoAlginAngle !== undefined) {
      resolved.autoAlginAngle = msg.autoAlginAngle;
    }
    else {
      resolved.autoAlginAngle = 0.0
    }

    return resolved;
    }
};

module.exports = EsrStatus4;
