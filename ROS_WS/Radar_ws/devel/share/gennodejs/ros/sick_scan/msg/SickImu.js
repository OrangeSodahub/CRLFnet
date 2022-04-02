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
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class SickImu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Imu = null;
      this.ticks = null;
      this.quaternion_accuracy = null;
      this.angular_velocity_reliability = null;
      this.linear_acceleration_reliability = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('Imu')) {
        this.Imu = initObj.Imu
      }
      else {
        this.Imu = new sensor_msgs.msg.Imu();
      }
      if (initObj.hasOwnProperty('ticks')) {
        this.ticks = initObj.ticks
      }
      else {
        this.ticks = 0;
      }
      if (initObj.hasOwnProperty('quaternion_accuracy')) {
        this.quaternion_accuracy = initObj.quaternion_accuracy
      }
      else {
        this.quaternion_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('angular_velocity_reliability')) {
        this.angular_velocity_reliability = initObj.angular_velocity_reliability
      }
      else {
        this.angular_velocity_reliability = 0;
      }
      if (initObj.hasOwnProperty('linear_acceleration_reliability')) {
        this.linear_acceleration_reliability = initObj.linear_acceleration_reliability
      }
      else {
        this.linear_acceleration_reliability = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SickImu
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Imu]
    bufferOffset = sensor_msgs.msg.Imu.serialize(obj.Imu, buffer, bufferOffset);
    // Serialize message field [ticks]
    bufferOffset = _serializer.uint32(obj.ticks, buffer, bufferOffset);
    // Serialize message field [quaternion_accuracy]
    bufferOffset = _serializer.float32(obj.quaternion_accuracy, buffer, bufferOffset);
    // Serialize message field [angular_velocity_reliability]
    bufferOffset = _serializer.uint8(obj.angular_velocity_reliability, buffer, bufferOffset);
    // Serialize message field [linear_acceleration_reliability]
    bufferOffset = _serializer.uint8(obj.linear_acceleration_reliability, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SickImu
    let len;
    let data = new SickImu(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Imu]
    data.Imu = sensor_msgs.msg.Imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [ticks]
    data.ticks = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [quaternion_accuracy]
    data.quaternion_accuracy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angular_velocity_reliability]
    data.angular_velocity_reliability = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [linear_acceleration_reliability]
    data.linear_acceleration_reliability = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.Imu.getMessageSize(object.Imu);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sick_scan/SickImu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '136303711a1d592affd8713883708711';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains the IMU data of a Sick laser scanner as an IMU message.
    # The ticks correspond to the internal time stamps of the laser scanner and increase linearly with time, the tickcounter overflows.
    # The quaternion_accuracy has the unit rad.
    # The accuracy measures for Lienar acceleration and angular velocity are abitre values, where higher values are better.
    # 
    #
    Header header
    
    sensor_msgs/Imu Imu
    #IMU Message
    
    uint32 ticks
    # timestamp Ticks from laser scanner
    
    float32 quaternion_accuracy
    #quaternion accuracy in rad
    
    uint8 angular_velocity_reliability
    #angular velocity reliability 0 low 255 high, value should be over 3
    
    uint8 linear_acceleration_reliability
    #linear acceleration reliability 0 low 255 high, value should be over 3
    
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
    MSG: sensor_msgs/Imu
    # This is a message to hold data from an IMU (Inertial Measurement Unit)
    #
    # Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
    #
    # If the covariance of the measurement is known, it should be filled in (if all you know is the 
    # variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
    # A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
    # data a covariance will have to be assumed or gotten from some other source
    #
    # If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
    # estimate), please set element 0 of the associated covariance matrix to -1
    # If you are interpreting this message, please check for a value of -1 in the first element of each 
    # covariance matrix, and disregard the associated estimate.
    
    Header header
    
    geometry_msgs/Quaternion orientation
    float64[9] orientation_covariance # Row major about x, y, z axes
    
    geometry_msgs/Vector3 angular_velocity
    float64[9] angular_velocity_covariance # Row major about x, y, z axes
    
    geometry_msgs/Vector3 linear_acceleration
    float64[9] linear_acceleration_covariance # Row major x, y z 
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SickImu(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.Imu !== undefined) {
      resolved.Imu = sensor_msgs.msg.Imu.Resolve(msg.Imu)
    }
    else {
      resolved.Imu = new sensor_msgs.msg.Imu()
    }

    if (msg.ticks !== undefined) {
      resolved.ticks = msg.ticks;
    }
    else {
      resolved.ticks = 0
    }

    if (msg.quaternion_accuracy !== undefined) {
      resolved.quaternion_accuracy = msg.quaternion_accuracy;
    }
    else {
      resolved.quaternion_accuracy = 0.0
    }

    if (msg.angular_velocity_reliability !== undefined) {
      resolved.angular_velocity_reliability = msg.angular_velocity_reliability;
    }
    else {
      resolved.angular_velocity_reliability = 0
    }

    if (msg.linear_acceleration_reliability !== undefined) {
      resolved.linear_acceleration_reliability = msg.linear_acceleration_reliability;
    }
    else {
      resolved.linear_acceleration_reliability = 0
    }

    return resolved;
    }
};

module.exports = SickImu;
