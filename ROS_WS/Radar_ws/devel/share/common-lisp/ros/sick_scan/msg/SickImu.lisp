; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude SickImu.msg.html

(cl:defclass <SickImu> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (Imu
    :reader Imu
    :initarg :Imu
    :type sensor_msgs-msg:Imu
    :initform (cl:make-instance 'sensor_msgs-msg:Imu))
   (ticks
    :reader ticks
    :initarg :ticks
    :type cl:integer
    :initform 0)
   (quaternion_accuracy
    :reader quaternion_accuracy
    :initarg :quaternion_accuracy
    :type cl:float
    :initform 0.0)
   (angular_velocity_reliability
    :reader angular_velocity_reliability
    :initarg :angular_velocity_reliability
    :type cl:fixnum
    :initform 0)
   (linear_acceleration_reliability
    :reader linear_acceleration_reliability
    :initarg :linear_acceleration_reliability
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SickImu (<SickImu>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SickImu>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SickImu)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<SickImu> is deprecated: use sick_scan-msg:SickImu instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SickImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:header-val is deprecated.  Use sick_scan-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'Imu-val :lambda-list '(m))
(cl:defmethod Imu-val ((m <SickImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:Imu-val is deprecated.  Use sick_scan-msg:Imu instead.")
  (Imu m))

(cl:ensure-generic-function 'ticks-val :lambda-list '(m))
(cl:defmethod ticks-val ((m <SickImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:ticks-val is deprecated.  Use sick_scan-msg:ticks instead.")
  (ticks m))

(cl:ensure-generic-function 'quaternion_accuracy-val :lambda-list '(m))
(cl:defmethod quaternion_accuracy-val ((m <SickImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:quaternion_accuracy-val is deprecated.  Use sick_scan-msg:quaternion_accuracy instead.")
  (quaternion_accuracy m))

(cl:ensure-generic-function 'angular_velocity_reliability-val :lambda-list '(m))
(cl:defmethod angular_velocity_reliability-val ((m <SickImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:angular_velocity_reliability-val is deprecated.  Use sick_scan-msg:angular_velocity_reliability instead.")
  (angular_velocity_reliability m))

(cl:ensure-generic-function 'linear_acceleration_reliability-val :lambda-list '(m))
(cl:defmethod linear_acceleration_reliability-val ((m <SickImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:linear_acceleration_reliability-val is deprecated.  Use sick_scan-msg:linear_acceleration_reliability instead.")
  (linear_acceleration_reliability m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SickImu>) ostream)
  "Serializes a message object of type '<SickImu>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Imu) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ticks)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ticks)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'ticks)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'ticks)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quaternion_accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angular_velocity_reliability)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'linear_acceleration_reliability)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SickImu>) istream)
  "Deserializes a message object of type '<SickImu>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Imu) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ticks)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ticks)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'ticks)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'ticks)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quaternion_accuracy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angular_velocity_reliability)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'linear_acceleration_reliability)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SickImu>)))
  "Returns string type for a message object of type '<SickImu>"
  "sick_scan/SickImu")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SickImu)))
  "Returns string type for a message object of type 'SickImu"
  "sick_scan/SickImu")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SickImu>)))
  "Returns md5sum for a message object of type '<SickImu>"
  "136303711a1d592affd8713883708711")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SickImu)))
  "Returns md5sum for a message object of type 'SickImu"
  "136303711a1d592affd8713883708711")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SickImu>)))
  "Returns full string definition for message of type '<SickImu>"
  (cl:format cl:nil "# This message contains the IMU data of a Sick laser scanner as an IMU message.~%# The ticks correspond to the internal time stamps of the laser scanner and increase linearly with time, the tickcounter overflows.~%# The quaternion_accuracy has the unit rad.~%# The accuracy measures for Lienar acceleration and angular velocity are abitre values, where higher values are better.~%# ~%#~%Header header~%~%sensor_msgs/Imu Imu~%#IMU Message~%~%uint32 ticks~%# timestamp Ticks from laser scanner~%~%float32 quaternion_accuracy~%#quaternion accuracy in rad~%~%uint8 angular_velocity_reliability~%#angular velocity reliability 0 low 255 high, value should be over 3~%~%uint8 linear_acceleration_reliability~%#linear acceleration reliability 0 low 255 high, value should be over 3~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Imu~%# This is a message to hold data from an IMU (Inertial Measurement Unit)~%#~%# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec~%#~%# If the covariance of the measurement is known, it should be filled in (if all you know is the ~%# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)~%# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the~%# data a covariance will have to be assumed or gotten from some other source~%#~%# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation ~%# estimate), please set element 0 of the associated covariance matrix to -1~%# If you are interpreting this message, please check for a value of -1 in the first element of each ~%# covariance matrix, and disregard the associated estimate.~%~%Header header~%~%geometry_msgs/Quaternion orientation~%float64[9] orientation_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 angular_velocity~%float64[9] angular_velocity_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 linear_acceleration~%float64[9] linear_acceleration_covariance # Row major x, y z ~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SickImu)))
  "Returns full string definition for message of type 'SickImu"
  (cl:format cl:nil "# This message contains the IMU data of a Sick laser scanner as an IMU message.~%# The ticks correspond to the internal time stamps of the laser scanner and increase linearly with time, the tickcounter overflows.~%# The quaternion_accuracy has the unit rad.~%# The accuracy measures for Lienar acceleration and angular velocity are abitre values, where higher values are better.~%# ~%#~%Header header~%~%sensor_msgs/Imu Imu~%#IMU Message~%~%uint32 ticks~%# timestamp Ticks from laser scanner~%~%float32 quaternion_accuracy~%#quaternion accuracy in rad~%~%uint8 angular_velocity_reliability~%#angular velocity reliability 0 low 255 high, value should be over 3~%~%uint8 linear_acceleration_reliability~%#linear acceleration reliability 0 low 255 high, value should be over 3~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Imu~%# This is a message to hold data from an IMU (Inertial Measurement Unit)~%#~%# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec~%#~%# If the covariance of the measurement is known, it should be filled in (if all you know is the ~%# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)~%# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the~%# data a covariance will have to be assumed or gotten from some other source~%#~%# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation ~%# estimate), please set element 0 of the associated covariance matrix to -1~%# If you are interpreting this message, please check for a value of -1 in the first element of each ~%# covariance matrix, and disregard the associated estimate.~%~%Header header~%~%geometry_msgs/Quaternion orientation~%float64[9] orientation_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 angular_velocity~%float64[9] angular_velocity_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 linear_acceleration~%float64[9] linear_acceleration_covariance # Row major x, y z ~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SickImu>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Imu))
     4
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SickImu>))
  "Converts a ROS message object to a list"
  (cl:list 'SickImu
    (cl:cons ':header (header msg))
    (cl:cons ':Imu (Imu msg))
    (cl:cons ':ticks (ticks msg))
    (cl:cons ':quaternion_accuracy (quaternion_accuracy msg))
    (cl:cons ':angular_velocity_reliability (angular_velocity_reliability msg))
    (cl:cons ':linear_acceleration_reliability (linear_acceleration_reliability msg))
))
