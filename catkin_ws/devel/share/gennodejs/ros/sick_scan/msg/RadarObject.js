// Auto-generated. Do not edit!

// (in-package sick_scan.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class RadarObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.tracking_time = null;
      this.last_seen = null;
      this.velocity = null;
      this.bounding_box_center = null;
      this.bounding_box_size = null;
      this.object_box_center = null;
      this.object_box_size = null;
      this.contour_points = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('tracking_time')) {
        this.tracking_time = initObj.tracking_time
      }
      else {
        this.tracking_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('last_seen')) {
        this.last_seen = initObj.last_seen
      }
      else {
        this.last_seen = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new geometry_msgs.msg.TwistWithCovariance();
      }
      if (initObj.hasOwnProperty('bounding_box_center')) {
        this.bounding_box_center = initObj.bounding_box_center
      }
      else {
        this.bounding_box_center = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('bounding_box_size')) {
        this.bounding_box_size = initObj.bounding_box_size
      }
      else {
        this.bounding_box_size = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('object_box_center')) {
        this.object_box_center = initObj.object_box_center
      }
      else {
        this.object_box_center = new geometry_msgs.msg.PoseWithCovariance();
      }
      if (initObj.hasOwnProperty('object_box_size')) {
        this.object_box_size = initObj.object_box_size
      }
      else {
        this.object_box_size = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('contour_points')) {
        this.contour_points = initObj.contour_points
      }
      else {
        this.contour_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarObject
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [tracking_time]
    bufferOffset = _serializer.time(obj.tracking_time, buffer, bufferOffset);
    // Serialize message field [last_seen]
    bufferOffset = _serializer.time(obj.last_seen, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = geometry_msgs.msg.TwistWithCovariance.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [bounding_box_center]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.bounding_box_center, buffer, bufferOffset);
    // Serialize message field [bounding_box_size]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.bounding_box_size, buffer, bufferOffset);
    // Serialize message field [object_box_center]
    bufferOffset = geometry_msgs.msg.PoseWithCovariance.serialize(obj.object_box_center, buffer, bufferOffset);
    // Serialize message field [object_box_size]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.object_box_size, buffer, bufferOffset);
    // Serialize message field [contour_points]
    // Serialize the length for message field [contour_points]
    bufferOffset = _serializer.uint32(obj.contour_points.length, buffer, bufferOffset);
    obj.contour_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarObject
    let len;
    let data = new RadarObject(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tracking_time]
    data.tracking_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [last_seen]
    data.last_seen = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = geometry_msgs.msg.TwistWithCovariance.deserialize(buffer, bufferOffset);
    // Deserialize message field [bounding_box_center]
    data.bounding_box_center = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [bounding_box_size]
    data.bounding_box_size = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [object_box_center]
    data.object_box_center = geometry_msgs.msg.PoseWithCovariance.deserialize(buffer, bufferOffset);
    // Deserialize message field [object_box_size]
    data.object_box_size = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [contour_points]
    // Deserialize array length for message field [contour_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.contour_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.contour_points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.contour_points.length;
    return length + 808;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/RadarObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5d0f2d250163ffa0098d0fc8218fc4a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    
    time tracking_time                          # since when the object is tracked
    time last_seen
    
    geometry_msgs/TwistWithCovariance velocity
    
    geometry_msgs/Pose bounding_box_center
    geometry_msgs/Vector3 bounding_box_size
    
    geometry_msgs/PoseWithCovariance object_box_center
    geometry_msgs/Vector3 object_box_size
    
    geometry_msgs/Point[] contour_points
    
    ================================================================================
    MSG: geometry_msgs/TwistWithCovariance
    # This expresses velocity in free space with uncertainty.
    
    Twist twist
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarObject(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.tracking_time !== undefined) {
      resolved.tracking_time = msg.tracking_time;
    }
    else {
      resolved.tracking_time = {secs: 0, nsecs: 0}
    }

    if (msg.last_seen !== undefined) {
      resolved.last_seen = msg.last_seen;
    }
    else {
      resolved.last_seen = {secs: 0, nsecs: 0}
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = geometry_msgs.msg.TwistWithCovariance.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new geometry_msgs.msg.TwistWithCovariance()
    }

    if (msg.bounding_box_center !== undefined) {
      resolved.bounding_box_center = geometry_msgs.msg.Pose.Resolve(msg.bounding_box_center)
    }
    else {
      resolved.bounding_box_center = new geometry_msgs.msg.Pose()
    }

    if (msg.bounding_box_size !== undefined) {
      resolved.bounding_box_size = geometry_msgs.msg.Vector3.Resolve(msg.bounding_box_size)
    }
    else {
      resolved.bounding_box_size = new geometry_msgs.msg.Vector3()
    }

    if (msg.object_box_center !== undefined) {
      resolved.object_box_center = geometry_msgs.msg.PoseWithCovariance.Resolve(msg.object_box_center)
    }
    else {
      resolved.object_box_center = new geometry_msgs.msg.PoseWithCovariance()
    }

    if (msg.object_box_size !== undefined) {
      resolved.object_box_size = geometry_msgs.msg.Vector3.Resolve(msg.object_box_size)
    }
    else {
      resolved.object_box_size = new geometry_msgs.msg.Vector3()
    }

    if (msg.contour_points !== undefined) {
      resolved.contour_points = new Array(msg.contour_points.length);
      for (let i = 0; i < resolved.contour_points.length; ++i) {
        resolved.contour_points[i] = geometry_msgs.msg.Point.Resolve(msg.contour_points[i]);
      }
    }
    else {
      resolved.contour_points = []
    }

    return resolved;
    }
};

module.exports = RadarObject;
