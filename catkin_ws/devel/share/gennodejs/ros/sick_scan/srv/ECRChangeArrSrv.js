// Auto-generated. Do not edit!

// (in-package sick_scan.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ECRChangeArrSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.active = null;
    }
    else {
      if (initObj.hasOwnProperty('active')) {
        this.active = initObj.active
      }
      else {
        this.active = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ECRChangeArrSrvRequest
    // Serialize message field [active]
    bufferOffset = _serializer.bool(obj.active, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ECRChangeArrSrvRequest
    let len;
    let data = new ECRChangeArrSrvRequest(null);
    // Deserialize message field [active]
    data.active = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sick_scan/ECRChangeArrSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2c5cfb0a2565df41de6873994aee57d2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Definition of ROS service ECRChangeArr for sick_scan
    # Request status change of monitoring fields on event
    # Example call (ROS1):
    # rosservice call /sick_tim_7xx/ECRChangeArr "{active: 1}"
    # 
    
    # 
    # Request (input)
    # 
    
    bool active # start/stop monitoring for status change events
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ECRChangeArrSrvRequest(null);
    if (msg.active !== undefined) {
      resolved.active = msg.active;
    }
    else {
      resolved.active = false
    }

    return resolved;
    }
};

class ECRChangeArrSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ECRChangeArrSrvResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ECRChangeArrSrvResponse
    let len;
    let data = new ECRChangeArrSrvResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sick_scan/ECRChangeArrSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # 
    # Response (output)
    # 
    
    bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ECRChangeArrSrvResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ECRChangeArrSrvRequest,
  Response: ECRChangeArrSrvResponse,
  md5sum() { return '83465e5956f4615e09223f5d055d1f12'; },
  datatype() { return 'sick_scan/ECRChangeArrSrv'; }
};
