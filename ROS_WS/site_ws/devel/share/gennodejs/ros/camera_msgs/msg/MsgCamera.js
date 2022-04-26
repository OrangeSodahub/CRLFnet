// Auto-generated. Do not edit!

// (in-package camera_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MsgObject = require('./MsgObject.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MsgCamera {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.camera11 = null;
      this.camera12 = null;
      this.camera13 = null;
      this.camera14 = null;
      this.camera41 = null;
      this.camera42 = null;
      this.camera43 = null;
      this.camera44 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('camera11')) {
        this.camera11 = initObj.camera11
      }
      else {
        this.camera11 = [];
      }
      if (initObj.hasOwnProperty('camera12')) {
        this.camera12 = initObj.camera12
      }
      else {
        this.camera12 = [];
      }
      if (initObj.hasOwnProperty('camera13')) {
        this.camera13 = initObj.camera13
      }
      else {
        this.camera13 = [];
      }
      if (initObj.hasOwnProperty('camera14')) {
        this.camera14 = initObj.camera14
      }
      else {
        this.camera14 = [];
      }
      if (initObj.hasOwnProperty('camera41')) {
        this.camera41 = initObj.camera41
      }
      else {
        this.camera41 = [];
      }
      if (initObj.hasOwnProperty('camera42')) {
        this.camera42 = initObj.camera42
      }
      else {
        this.camera42 = [];
      }
      if (initObj.hasOwnProperty('camera43')) {
        this.camera43 = initObj.camera43
      }
      else {
        this.camera43 = [];
      }
      if (initObj.hasOwnProperty('camera44')) {
        this.camera44 = initObj.camera44
      }
      else {
        this.camera44 = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgCamera
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [camera11]
    // Serialize the length for message field [camera11]
    bufferOffset = _serializer.uint32(obj.camera11.length, buffer, bufferOffset);
    obj.camera11.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera12]
    // Serialize the length for message field [camera12]
    bufferOffset = _serializer.uint32(obj.camera12.length, buffer, bufferOffset);
    obj.camera12.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera13]
    // Serialize the length for message field [camera13]
    bufferOffset = _serializer.uint32(obj.camera13.length, buffer, bufferOffset);
    obj.camera13.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera14]
    // Serialize the length for message field [camera14]
    bufferOffset = _serializer.uint32(obj.camera14.length, buffer, bufferOffset);
    obj.camera14.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera41]
    // Serialize the length for message field [camera41]
    bufferOffset = _serializer.uint32(obj.camera41.length, buffer, bufferOffset);
    obj.camera41.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera42]
    // Serialize the length for message field [camera42]
    bufferOffset = _serializer.uint32(obj.camera42.length, buffer, bufferOffset);
    obj.camera42.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera43]
    // Serialize the length for message field [camera43]
    bufferOffset = _serializer.uint32(obj.camera43.length, buffer, bufferOffset);
    obj.camera43.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [camera44]
    // Serialize the length for message field [camera44]
    bufferOffset = _serializer.uint32(obj.camera44.length, buffer, bufferOffset);
    obj.camera44.forEach((val) => {
      bufferOffset = MsgObject.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgCamera
    let len;
    let data = new MsgCamera(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [camera11]
    // Deserialize array length for message field [camera11]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera11 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera11[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera12]
    // Deserialize array length for message field [camera12]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera12 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera12[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera13]
    // Deserialize array length for message field [camera13]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera13 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera13[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera14]
    // Deserialize array length for message field [camera14]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera14 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera14[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera41]
    // Deserialize array length for message field [camera41]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera41 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera41[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera42]
    // Deserialize array length for message field [camera42]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera42 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera42[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera43]
    // Deserialize array length for message field [camera43]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera43 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera43[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [camera44]
    // Deserialize array length for message field [camera44]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.camera44 = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.camera44[i] = MsgObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.camera11.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera12.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera13.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera14.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera41.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera42.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera43.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    object.camera44.forEach((val) => {
      length += MsgObject.getMessageSize(val);
    });
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'camera_msgs/MsgCamera';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '88f6649107b59053b7d1e61aca764255';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    MsgObject[] camera11
    MsgObject[] camera12
    MsgObject[] camera13
    MsgObject[] camera14
    MsgObject[] camera41
    MsgObject[] camera42
    MsgObject[] camera43
    MsgObject[] camera44
    
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
    MSG: camera_msgs/MsgObject
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgCamera(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.camera11 !== undefined) {
      resolved.camera11 = new Array(msg.camera11.length);
      for (let i = 0; i < resolved.camera11.length; ++i) {
        resolved.camera11[i] = MsgObject.Resolve(msg.camera11[i]);
      }
    }
    else {
      resolved.camera11 = []
    }

    if (msg.camera12 !== undefined) {
      resolved.camera12 = new Array(msg.camera12.length);
      for (let i = 0; i < resolved.camera12.length; ++i) {
        resolved.camera12[i] = MsgObject.Resolve(msg.camera12[i]);
      }
    }
    else {
      resolved.camera12 = []
    }

    if (msg.camera13 !== undefined) {
      resolved.camera13 = new Array(msg.camera13.length);
      for (let i = 0; i < resolved.camera13.length; ++i) {
        resolved.camera13[i] = MsgObject.Resolve(msg.camera13[i]);
      }
    }
    else {
      resolved.camera13 = []
    }

    if (msg.camera14 !== undefined) {
      resolved.camera14 = new Array(msg.camera14.length);
      for (let i = 0; i < resolved.camera14.length; ++i) {
        resolved.camera14[i] = MsgObject.Resolve(msg.camera14[i]);
      }
    }
    else {
      resolved.camera14 = []
    }

    if (msg.camera41 !== undefined) {
      resolved.camera41 = new Array(msg.camera41.length);
      for (let i = 0; i < resolved.camera41.length; ++i) {
        resolved.camera41[i] = MsgObject.Resolve(msg.camera41[i]);
      }
    }
    else {
      resolved.camera41 = []
    }

    if (msg.camera42 !== undefined) {
      resolved.camera42 = new Array(msg.camera42.length);
      for (let i = 0; i < resolved.camera42.length; ++i) {
        resolved.camera42[i] = MsgObject.Resolve(msg.camera42[i]);
      }
    }
    else {
      resolved.camera42 = []
    }

    if (msg.camera43 !== undefined) {
      resolved.camera43 = new Array(msg.camera43.length);
      for (let i = 0; i < resolved.camera43.length; ++i) {
        resolved.camera43[i] = MsgObject.Resolve(msg.camera43[i]);
      }
    }
    else {
      resolved.camera43 = []
    }

    if (msg.camera44 !== undefined) {
      resolved.camera44 = new Array(msg.camera44.length);
      for (let i = 0; i < resolved.camera44.length; ++i) {
        resolved.camera44[i] = MsgObject.Resolve(msg.camera44[i]);
      }
    }
    else {
      resolved.camera44 = []
    }

    return resolved;
    }
};

module.exports = MsgCamera;
