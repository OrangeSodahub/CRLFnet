; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrVehicle1.msg.html

(cl:defclass <EsrVehicle1> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vehicle_speed
    :reader vehicle_speed
    :initarg :vehicle_speed
    :type cl:float
    :initform 0.0)
   (speed_direction
    :reader speed_direction
    :initarg :speed_direction
    :type cl:boolean
    :initform cl:nil)
   (yaw_rate
    :reader yaw_rate
    :initarg :yaw_rate
    :type cl:float
    :initform 0.0)
   (yaw_rate_valid
    :reader yaw_rate_valid
    :initarg :yaw_rate_valid
    :type cl:boolean
    :initform cl:nil)
   (radius_curvature
    :reader radius_curvature
    :initarg :radius_curvature
    :type cl:fixnum
    :initform 0)
   (steering_angle_valid
    :reader steering_angle_valid
    :initarg :steering_angle_valid
    :type cl:boolean
    :initform cl:nil)
   (steering_angle_sign
    :reader steering_angle_sign
    :initarg :steering_angle_sign
    :type cl:boolean
    :initform cl:nil)
   (steering_angle
    :reader steering_angle
    :initarg :steering_angle
    :type cl:fixnum
    :initform 0)
   (steering_angle_rate
    :reader steering_angle_rate
    :initarg :steering_angle_rate
    :type cl:fixnum
    :initform 0)
   (steering_angle_rate_sign
    :reader steering_angle_rate_sign
    :initarg :steering_angle_rate_sign
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass EsrVehicle1 (<EsrVehicle1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrVehicle1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrVehicle1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrVehicle1> is deprecated: use delphi_esr_msgs-msg:EsrVehicle1 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vehicle_speed-val :lambda-list '(m))
(cl:defmethod vehicle_speed-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:vehicle_speed-val is deprecated.  Use delphi_esr_msgs-msg:vehicle_speed instead.")
  (vehicle_speed m))

(cl:ensure-generic-function 'speed_direction-val :lambda-list '(m))
(cl:defmethod speed_direction-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:speed_direction-val is deprecated.  Use delphi_esr_msgs-msg:speed_direction instead.")
  (speed_direction m))

(cl:ensure-generic-function 'yaw_rate-val :lambda-list '(m))
(cl:defmethod yaw_rate-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:yaw_rate-val is deprecated.  Use delphi_esr_msgs-msg:yaw_rate instead.")
  (yaw_rate m))

(cl:ensure-generic-function 'yaw_rate_valid-val :lambda-list '(m))
(cl:defmethod yaw_rate_valid-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:yaw_rate_valid-val is deprecated.  Use delphi_esr_msgs-msg:yaw_rate_valid instead.")
  (yaw_rate_valid m))

(cl:ensure-generic-function 'radius_curvature-val :lambda-list '(m))
(cl:defmethod radius_curvature-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:radius_curvature-val is deprecated.  Use delphi_esr_msgs-msg:radius_curvature instead.")
  (radius_curvature m))

(cl:ensure-generic-function 'steering_angle_valid-val :lambda-list '(m))
(cl:defmethod steering_angle_valid-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steering_angle_valid-val is deprecated.  Use delphi_esr_msgs-msg:steering_angle_valid instead.")
  (steering_angle_valid m))

(cl:ensure-generic-function 'steering_angle_sign-val :lambda-list '(m))
(cl:defmethod steering_angle_sign-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steering_angle_sign-val is deprecated.  Use delphi_esr_msgs-msg:steering_angle_sign instead.")
  (steering_angle_sign m))

(cl:ensure-generic-function 'steering_angle-val :lambda-list '(m))
(cl:defmethod steering_angle-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steering_angle-val is deprecated.  Use delphi_esr_msgs-msg:steering_angle instead.")
  (steering_angle m))

(cl:ensure-generic-function 'steering_angle_rate-val :lambda-list '(m))
(cl:defmethod steering_angle_rate-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steering_angle_rate-val is deprecated.  Use delphi_esr_msgs-msg:steering_angle_rate instead.")
  (steering_angle_rate m))

(cl:ensure-generic-function 'steering_angle_rate_sign-val :lambda-list '(m))
(cl:defmethod steering_angle_rate_sign-val ((m <EsrVehicle1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steering_angle_rate_sign-val is deprecated.  Use delphi_esr_msgs-msg:steering_angle_rate_sign instead.")
  (steering_angle_rate_sign m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrVehicle1>) ostream)
  "Serializes a message object of type '<EsrVehicle1>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vehicle_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'speed_direction) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'yaw_rate_valid) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'radius_curvature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'steering_angle_valid) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'steering_angle_sign) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_angle_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_angle_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'steering_angle_rate_sign) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrVehicle1>) istream)
  "Deserializes a message object of type '<EsrVehicle1>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vehicle_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'speed_direction) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'yaw_rate_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'radius_curvature) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'steering_angle_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'steering_angle_sign) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_angle_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_angle_rate)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_angle_rate_sign) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrVehicle1>)))
  "Returns string type for a message object of type '<EsrVehicle1>"
  "delphi_esr_msgs/EsrVehicle1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrVehicle1)))
  "Returns string type for a message object of type 'EsrVehicle1"
  "delphi_esr_msgs/EsrVehicle1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrVehicle1>)))
  "Returns md5sum for a message object of type '<EsrVehicle1>"
  "ccab5c3c9c182cced0afa3db1f83373f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrVehicle1)))
  "Returns md5sum for a message object of type 'EsrVehicle1"
  "ccab5c3c9c182cced0afa3db1f83373f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrVehicle1>)))
  "Returns full string definition for message of type '<EsrVehicle1>"
  (cl:format cl:nil "Header header~%~%# ESR vehicle1~%float32     vehicle_speed~%bool        speed_direction~%float32     yaw_rate~%bool        yaw_rate_valid~%int16       radius_curvature~%bool        steering_angle_valid~%bool        steering_angle_sign~%uint16      steering_angle~%uint16      steering_angle_rate~%bool        steering_angle_rate_sign~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrVehicle1)))
  "Returns full string definition for message of type 'EsrVehicle1"
  (cl:format cl:nil "Header header~%~%# ESR vehicle1~%float32     vehicle_speed~%bool        speed_direction~%float32     yaw_rate~%bool        yaw_rate_valid~%int16       radius_curvature~%bool        steering_angle_valid~%bool        steering_angle_sign~%uint16      steering_angle~%uint16      steering_angle_rate~%bool        steering_angle_rate_sign~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrVehicle1>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     1
     4
     1
     2
     1
     1
     2
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrVehicle1>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrVehicle1
    (cl:cons ':header (header msg))
    (cl:cons ':vehicle_speed (vehicle_speed msg))
    (cl:cons ':speed_direction (speed_direction msg))
    (cl:cons ':yaw_rate (yaw_rate msg))
    (cl:cons ':yaw_rate_valid (yaw_rate_valid msg))
    (cl:cons ':radius_curvature (radius_curvature msg))
    (cl:cons ':steering_angle_valid (steering_angle_valid msg))
    (cl:cons ':steering_angle_sign (steering_angle_sign msg))
    (cl:cons ':steering_angle (steering_angle msg))
    (cl:cons ':steering_angle_rate (steering_angle_rate msg))
    (cl:cons ':steering_angle_rate_sign (steering_angle_rate_sign msg))
))
