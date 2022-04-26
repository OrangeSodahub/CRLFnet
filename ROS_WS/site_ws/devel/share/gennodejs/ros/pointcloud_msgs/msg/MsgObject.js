// Auto-generated. Do not edit!

// (in-package pointcloud_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PointField = require('./PointField.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MsgObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.height = null;
      this.width = null;
      this.fields = null;
      this.is_bigendian = null;
      this.point_step = null;
      this.row_step = null;
      this.data = null;
      this.is_dense = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('fields')) {
        this.fields = initObj.fields
      }
      else {
        this.fields = [];
      }
      if (initObj.hasOwnProperty('is_bigendian')) {
        this.is_bigendian = initObj.is_bigendian
      }
      else {
        this.is_bigendian = false;
      }
      if (initObj.hasOwnProperty('point_step')) {
        this.point_step = initObj.point_step
      }
      else {
        this.point_step = 0;
      }
      if (initObj.hasOwnProperty('row_step')) {
        this.row_step = initObj.row_step
      }
      else {
        this.row_step = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('is_dense')) {
        this.is_dense = initObj.is_dense
      }
      else {
        this.is_dense = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgObject
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [fields]
    // Serialize the length for message field [fields]
    bufferOffset = _serializer.uint32(obj.fields.length, buffer, bufferOffset);
    obj.fields.forEach((val) => {
      bufferOffset = PointField.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [is_bigendian]
    bufferOffset = _serializer.bool(obj.is_bigendian, buffer, bufferOffset);
    // Serialize message field [point_step]
    bufferOffset = _serializer.uint32(obj.point_step, buffer, bufferOffset);
    // Serialize message field [row_step]
    bufferOffset = _serializer.uint32(obj.row_step, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint8(obj.data, buffer, bufferOffset, null);
    // Serialize message field [is_dense]
    bufferOffset = _serializer.bool(obj.is_dense, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgObject
    let len;
    let data = new MsgObject(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [fields]
    // Deserialize array length for message field [fields]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.fields = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.fields[i] = PointField.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [is_bigendian]
    data.is_bigendian = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [point_step]
    data.point_step = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [row_step]
    data.row_step = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [is_dense]
    data.is_dense = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.fields.forEach((val) => {
      length += PointField.getMessageSize(val);
    });
    length += object.data.length;
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pointcloud_msgs/MsgObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1158d486dd51d683ce2f1be655c3c181';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
    # The point cloud data may be organized 2d (image-like) or 1d
    # (unordered). Point clouds organized as 2d images may be produced by
    # camera depth sensors such as stereo or time-of-flight.
    
    # Time of sensor data acquisition, and the coordinate frame ID (for 3d
    # points).
    Header header
    
    # 2D structure of the point cloud. If the cloud is unordered, height is
    # 1 and width is the length of the point cloud.
    uint32 height
    uint32 width
    
    # Describes the channels and their layout in the binary data blob.
    PointField[] fields
    
    bool    is_bigendian # Is this data bigendian?
    uint32  point_step   # Length of a point in bytes
    uint32  row_step     # Length of a row in bytes
    uint8[] data         # Actual point data, size is (row_step*height)
    
    bool is_dense        # True if there are no invalid points
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
    MSG: pointcloud_msgs/PointField
    # This message holds the description of one point entry in the
    # PointCloud2 message format.
    uint8 INT8    = 1
    uint8 UINT8   = 2
    uint8 INT16   = 3
    uint8 UINT16  = 4
    uint8 INT32   = 5
    uint8 UINT32  = 6
    uint8 FLOAT32 = 7
    uint8 FLOAT64 = 8
    
    string name      # Name of field
    uint32 offset    # Offset from start of point struct
    uint8  datatype  # Datatype enumeration, see above
    uint32 count     # How many elements in the field
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgObject(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.fields !== undefined) {
      resolved.fields = new Array(msg.fields.length);
      for (let i = 0; i < resolved.fields.length; ++i) {
        resolved.fields[i] = PointField.Resolve(msg.fields[i]);
      }
    }
    else {
      resolved.fields = []
    }

    if (msg.is_bigendian !== undefined) {
      resolved.is_bigendian = msg.is_bigendian;
    }
    else {
      resolved.is_bigendian = false
    }

    if (msg.point_step !== undefined) {
      resolved.point_step = msg.point_step;
    }
    else {
      resolved.point_step = 0
    }

    if (msg.row_step !== undefined) {
      resolved.row_step = msg.row_step;
    }
    else {
      resolved.row_step = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.is_dense !== undefined) {
      resolved.is_dense = msg.is_dense;
    }
    else {
      resolved.is_dense = false
    }

    return resolved;
    }
};

module.exports = MsgObject;
