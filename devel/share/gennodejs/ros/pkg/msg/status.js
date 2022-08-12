// Auto-generated. Do not edit!

// (in-package pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leader = null;
      this.follower1 = null;
      this.follower2 = null;
      this.follower3 = null;
      this.follower4 = null;
      this.formation = null;
    }
    else {
      if (initObj.hasOwnProperty('leader')) {
        this.leader = initObj.leader
      }
      else {
        this.leader = '';
      }
      if (initObj.hasOwnProperty('follower1')) {
        this.follower1 = initObj.follower1
      }
      else {
        this.follower1 = '';
      }
      if (initObj.hasOwnProperty('follower2')) {
        this.follower2 = initObj.follower2
      }
      else {
        this.follower2 = '';
      }
      if (initObj.hasOwnProperty('follower3')) {
        this.follower3 = initObj.follower3
      }
      else {
        this.follower3 = '';
      }
      if (initObj.hasOwnProperty('follower4')) {
        this.follower4 = initObj.follower4
      }
      else {
        this.follower4 = '';
      }
      if (initObj.hasOwnProperty('formation')) {
        this.formation = initObj.formation
      }
      else {
        this.formation = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type status
    // Serialize message field [leader]
    bufferOffset = _serializer.string(obj.leader, buffer, bufferOffset);
    // Serialize message field [follower1]
    bufferOffset = _serializer.string(obj.follower1, buffer, bufferOffset);
    // Serialize message field [follower2]
    bufferOffset = _serializer.string(obj.follower2, buffer, bufferOffset);
    // Serialize message field [follower3]
    bufferOffset = _serializer.string(obj.follower3, buffer, bufferOffset);
    // Serialize message field [follower4]
    bufferOffset = _serializer.string(obj.follower4, buffer, bufferOffset);
    // Serialize message field [formation]
    bufferOffset = _serializer.uint8(obj.formation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type status
    let len;
    let data = new status(null);
    // Deserialize message field [leader]
    data.leader = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [follower1]
    data.follower1 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [follower2]
    data.follower2 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [follower3]
    data.follower3 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [follower4]
    data.follower4 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [formation]
    data.formation = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.leader);
    length += _getByteLength(object.follower1);
    length += _getByteLength(object.follower2);
    length += _getByteLength(object.follower3);
    length += _getByteLength(object.follower4);
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pkg/status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7f786ce8ae9e22085ec0c660926ddd4c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string leader
    string follower1
    string follower2
    string follower3
    string follower4
    uint8 formation
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new status(null);
    if (msg.leader !== undefined) {
      resolved.leader = msg.leader;
    }
    else {
      resolved.leader = ''
    }

    if (msg.follower1 !== undefined) {
      resolved.follower1 = msg.follower1;
    }
    else {
      resolved.follower1 = ''
    }

    if (msg.follower2 !== undefined) {
      resolved.follower2 = msg.follower2;
    }
    else {
      resolved.follower2 = ''
    }

    if (msg.follower3 !== undefined) {
      resolved.follower3 = msg.follower3;
    }
    else {
      resolved.follower3 = ''
    }

    if (msg.follower4 !== undefined) {
      resolved.follower4 = msg.follower4;
    }
    else {
      resolved.follower4 = ''
    }

    if (msg.formation !== undefined) {
      resolved.formation = msg.formation;
    }
    else {
      resolved.formation = 0
    }

    return resolved;
    }
};

module.exports = status;
