; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrVehicle5.msg.html

(cl:defclass <EsrVehicle5> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (oversteer_understeer
    :reader oversteer_understeer
    :initarg :oversteer_understeer
    :type cl:fixnum
    :initform 0)
   (yaw_rate_bias_shift
    :reader yaw_rate_bias_shift
    :initarg :yaw_rate_bias_shift
    :type cl:boolean
    :initform cl:nil)
   (beamwidth_vert
    :reader beamwidth_vert
    :initarg :beamwidth_vert
    :type cl:float
    :initform 0.0)
   (funnel_offset_left
    :reader funnel_offset_left
    :initarg :funnel_offset_left
    :type cl:float
    :initform 0.0)
   (funnel_offset_right
    :reader funnel_offset_right
    :initarg :funnel_offset_right
    :type cl:float
    :initform 0.0)
   (cw_blockage_threshold
    :reader cw_blockage_threshold
    :initarg :cw_blockage_threshold
    :type cl:float
    :initform 0.0)
   (distance_rear_axle
    :reader distance_rear_axle
    :initarg :distance_rear_axle
    :type cl:fixnum
    :initform 0)
   (wheel_base
    :reader wheel_base
    :initarg :wheel_base
    :type cl:fixnum
    :initform 0)
   (steering_gear_ratio
    :reader steering_gear_ratio
    :initarg :steering_gear_ratio
    :type cl:float
    :initform 0.0))
)

(cl:defclass EsrVehicle5 (<EsrVehicle5>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrVehicle5>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrVehicle5)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrVehicle5> is deprecated: use delphi_esr_msgs-msg:EsrVehicle5 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'oversteer_understeer-val :lambda-list '(m))
(cl:defmethod oversteer_understeer-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:oversteer_understeer-val is deprecated.  Use delphi_esr_msgs-msg:oversteer_understeer instead.")
  (oversteer_understeer m))

(cl:ensure-generic-function 'yaw_rate_bias_shift-val :lambda-list '(m))
(cl:defmethod yaw_rate_bias_shift-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:yaw_rate_bias_shift-val is deprecated.  Use delphi_esr_msgs-msg:yaw_rate_bias_shift instead.")
  (yaw_rate_bias_shift m))

(cl:ensure-generic-function 'beamwidth_vert-val :lambda-list '(m))
(cl:defmethod beamwidth_vert-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:beamwidth_vert-val is deprecated.  Use delphi_esr_msgs-msg:beamwidth_vert instead.")
  (beamwidth_vert m))

(cl:ensure-generic-function 'funnel_offset_left-val :lambda-list '(m))
(cl:defmethod funnel_offset_left-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:funnel_offset_left-val is deprecated.  Use delphi_esr_msgs-msg:funnel_offset_left instead.")
  (funnel_offset_left m))

(cl:ensure-generic-function 'funnel_offset_right-val :lambda-list '(m))
(cl:defmethod funnel_offset_right-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:funnel_offset_right-val is deprecated.  Use delphi_esr_msgs-msg:funnel_offset_right instead.")
  (funnel_offset_right m))

(cl:ensure-generic-function 'cw_blockage_threshold-val :lambda-list '(m))
(cl:defmethod cw_blockage_threshold-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:cw_blockage_threshold-val is deprecated.  Use delphi_esr_msgs-msg:cw_blockage_threshold instead.")
  (cw_blockage_threshold m))

(cl:ensure-generic-function 'distance_rear_axle-val :lambda-list '(m))
(cl:defmethod distance_rear_axle-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:distance_rear_axle-val is deprecated.  Use delphi_esr_msgs-msg:distance_rear_axle instead.")
  (distance_rear_axle m))

(cl:ensure-generic-function 'wheel_base-val :lambda-list '(m))
(cl:defmethod wheel_base-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:wheel_base-val is deprecated.  Use delphi_esr_msgs-msg:wheel_base instead.")
  (wheel_base m))

(cl:ensure-generic-function 'steering_gear_ratio-val :lambda-list '(m))
(cl:defmethod steering_gear_ratio-val ((m <EsrVehicle5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steering_gear_ratio-val is deprecated.  Use delphi_esr_msgs-msg:steering_gear_ratio instead.")
  (steering_gear_ratio m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrVehicle5>) ostream)
  "Serializes a message object of type '<EsrVehicle5>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'oversteer_understeer)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'yaw_rate_bias_shift) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'beamwidth_vert))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'funnel_offset_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'funnel_offset_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cw_blockage_threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance_rear_axle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance_rear_axle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel_base)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wheel_base)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering_gear_ratio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrVehicle5>) istream)
  "Deserializes a message object of type '<EsrVehicle5>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'oversteer_understeer) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'yaw_rate_bias_shift) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'beamwidth_vert) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'funnel_offset_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'funnel_offset_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cw_blockage_threshold) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance_rear_axle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance_rear_axle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel_base)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wheel_base)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_gear_ratio) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrVehicle5>)))
  "Returns string type for a message object of type '<EsrVehicle5>"
  "delphi_esr_msgs/EsrVehicle5")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrVehicle5)))
  "Returns string type for a message object of type 'EsrVehicle5"
  "delphi_esr_msgs/EsrVehicle5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrVehicle5>)))
  "Returns md5sum for a message object of type '<EsrVehicle5>"
  "e4135fc6914a28e2c947a8270cd84b22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrVehicle5)))
  "Returns md5sum for a message object of type 'EsrVehicle5"
  "e4135fc6914a28e2c947a8270cd84b22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrVehicle5>)))
  "Returns full string definition for message of type '<EsrVehicle5>"
  (cl:format cl:nil "Header header~%~%# ESR vehicle5~%int8        oversteer_understeer~%bool        yaw_rate_bias_shift~%float32     beamwidth_vert~%float32     funnel_offset_left~%float32     funnel_offset_right~%float32     cw_blockage_threshold~%uint16      distance_rear_axle~%uint16      wheel_base~%float32     steering_gear_ratio       ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrVehicle5)))
  "Returns full string definition for message of type 'EsrVehicle5"
  (cl:format cl:nil "Header header~%~%# ESR vehicle5~%int8        oversteer_understeer~%bool        yaw_rate_bias_shift~%float32     beamwidth_vert~%float32     funnel_offset_left~%float32     funnel_offset_right~%float32     cw_blockage_threshold~%uint16      distance_rear_axle~%uint16      wheel_base~%float32     steering_gear_ratio       ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrVehicle5>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
     4
     4
     4
     2
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrVehicle5>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrVehicle5
    (cl:cons ':header (header msg))
    (cl:cons ':oversteer_understeer (oversteer_understeer msg))
    (cl:cons ':yaw_rate_bias_shift (yaw_rate_bias_shift msg))
    (cl:cons ':beamwidth_vert (beamwidth_vert msg))
    (cl:cons ':funnel_offset_left (funnel_offset_left msg))
    (cl:cons ':funnel_offset_right (funnel_offset_right msg))
    (cl:cons ':cw_blockage_threshold (cw_blockage_threshold msg))
    (cl:cons ':distance_rear_axle (distance_rear_axle msg))
    (cl:cons ':wheel_base (wheel_base msg))
    (cl:cons ':steering_gear_ratio (steering_gear_ratio msg))
))
