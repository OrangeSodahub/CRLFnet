; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrVehicle3.msg.html

(cl:defclass <EsrVehicle3> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (long_accel_valid
    :reader long_accel_valid
    :initarg :long_accel_valid
    :type cl:boolean
    :initform cl:nil)
   (lat_accel_valid
    :reader lat_accel_valid
    :initarg :lat_accel_valid
    :type cl:boolean
    :initform cl:nil)
   (lat_accel
    :reader lat_accel
    :initarg :lat_accel
    :type cl:float
    :initform 0.0)
   (long_accel
    :reader long_accel
    :initarg :long_accel
    :type cl:float
    :initform 0.0)
   (radar_fov_lr
    :reader radar_fov_lr
    :initarg :radar_fov_lr
    :type cl:fixnum
    :initform 0)
   (radar_fov_mr
    :reader radar_fov_mr
    :initarg :radar_fov_mr
    :type cl:fixnum
    :initform 0)
   (auto_align_disable
    :reader auto_align_disable
    :initarg :auto_align_disable
    :type cl:boolean
    :initform cl:nil)
   (radar_height
    :reader radar_height
    :initarg :radar_height
    :type cl:fixnum
    :initform 0)
   (serv_align_type
    :reader serv_align_type
    :initarg :serv_align_type
    :type cl:boolean
    :initform cl:nil)
   (serv_align_enable
    :reader serv_align_enable
    :initarg :serv_align_enable
    :type cl:boolean
    :initform cl:nil)
   (align_avg_ctr_total
    :reader align_avg_ctr_total
    :initarg :align_avg_ctr_total
    :type cl:fixnum
    :initform 0)
   (auto_align_converged
    :reader auto_align_converged
    :initarg :auto_align_converged
    :type cl:boolean
    :initform cl:nil)
   (wheel_slip
    :reader wheel_slip
    :initarg :wheel_slip
    :type cl:fixnum
    :initform 0)
   (serv_align_updates_need
    :reader serv_align_updates_need
    :initarg :serv_align_updates_need
    :type cl:fixnum
    :initform 0)
   (angle_mounting_offset
    :reader angle_mounting_offset
    :initarg :angle_mounting_offset
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrVehicle3 (<EsrVehicle3>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrVehicle3>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrVehicle3)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrVehicle3> is deprecated: use delphi_esr_msgs-msg:EsrVehicle3 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'long_accel_valid-val :lambda-list '(m))
(cl:defmethod long_accel_valid-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:long_accel_valid-val is deprecated.  Use delphi_esr_msgs-msg:long_accel_valid instead.")
  (long_accel_valid m))

(cl:ensure-generic-function 'lat_accel_valid-val :lambda-list '(m))
(cl:defmethod lat_accel_valid-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lat_accel_valid-val is deprecated.  Use delphi_esr_msgs-msg:lat_accel_valid instead.")
  (lat_accel_valid m))

(cl:ensure-generic-function 'lat_accel-val :lambda-list '(m))
(cl:defmethod lat_accel-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lat_accel-val is deprecated.  Use delphi_esr_msgs-msg:lat_accel instead.")
  (lat_accel m))

(cl:ensure-generic-function 'long_accel-val :lambda-list '(m))
(cl:defmethod long_accel-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:long_accel-val is deprecated.  Use delphi_esr_msgs-msg:long_accel instead.")
  (long_accel m))

(cl:ensure-generic-function 'radar_fov_lr-val :lambda-list '(m))
(cl:defmethod radar_fov_lr-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:radar_fov_lr-val is deprecated.  Use delphi_esr_msgs-msg:radar_fov_lr instead.")
  (radar_fov_lr m))

(cl:ensure-generic-function 'radar_fov_mr-val :lambda-list '(m))
(cl:defmethod radar_fov_mr-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:radar_fov_mr-val is deprecated.  Use delphi_esr_msgs-msg:radar_fov_mr instead.")
  (radar_fov_mr m))

(cl:ensure-generic-function 'auto_align_disable-val :lambda-list '(m))
(cl:defmethod auto_align_disable-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:auto_align_disable-val is deprecated.  Use delphi_esr_msgs-msg:auto_align_disable instead.")
  (auto_align_disable m))

(cl:ensure-generic-function 'radar_height-val :lambda-list '(m))
(cl:defmethod radar_height-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:radar_height-val is deprecated.  Use delphi_esr_msgs-msg:radar_height instead.")
  (radar_height m))

(cl:ensure-generic-function 'serv_align_type-val :lambda-list '(m))
(cl:defmethod serv_align_type-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:serv_align_type-val is deprecated.  Use delphi_esr_msgs-msg:serv_align_type instead.")
  (serv_align_type m))

(cl:ensure-generic-function 'serv_align_enable-val :lambda-list '(m))
(cl:defmethod serv_align_enable-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:serv_align_enable-val is deprecated.  Use delphi_esr_msgs-msg:serv_align_enable instead.")
  (serv_align_enable m))

(cl:ensure-generic-function 'align_avg_ctr_total-val :lambda-list '(m))
(cl:defmethod align_avg_ctr_total-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:align_avg_ctr_total-val is deprecated.  Use delphi_esr_msgs-msg:align_avg_ctr_total instead.")
  (align_avg_ctr_total m))

(cl:ensure-generic-function 'auto_align_converged-val :lambda-list '(m))
(cl:defmethod auto_align_converged-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:auto_align_converged-val is deprecated.  Use delphi_esr_msgs-msg:auto_align_converged instead.")
  (auto_align_converged m))

(cl:ensure-generic-function 'wheel_slip-val :lambda-list '(m))
(cl:defmethod wheel_slip-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:wheel_slip-val is deprecated.  Use delphi_esr_msgs-msg:wheel_slip instead.")
  (wheel_slip m))

(cl:ensure-generic-function 'serv_align_updates_need-val :lambda-list '(m))
(cl:defmethod serv_align_updates_need-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:serv_align_updates_need-val is deprecated.  Use delphi_esr_msgs-msg:serv_align_updates_need instead.")
  (serv_align_updates_need m))

(cl:ensure-generic-function 'angle_mounting_offset-val :lambda-list '(m))
(cl:defmethod angle_mounting_offset-val ((m <EsrVehicle3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:angle_mounting_offset-val is deprecated.  Use delphi_esr_msgs-msg:angle_mounting_offset instead.")
  (angle_mounting_offset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrVehicle3>) ostream)
  "Serializes a message object of type '<EsrVehicle3>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'long_accel_valid) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lat_accel_valid) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lat_accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'long_accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_fov_lr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_fov_mr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'auto_align_disable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'serv_align_type) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'serv_align_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'align_avg_ctr_total)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'align_avg_ctr_total)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'auto_align_converged) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel_slip)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serv_align_updates_need)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'angle_mounting_offset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrVehicle3>) istream)
  "Deserializes a message object of type '<EsrVehicle3>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'long_accel_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'lat_accel_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lat_accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'long_accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_fov_lr)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_fov_mr)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'auto_align_disable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_height)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'serv_align_type) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'serv_align_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'align_avg_ctr_total)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'align_avg_ctr_total)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'auto_align_converged) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheel_slip)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serv_align_updates_need)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle_mounting_offset) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrVehicle3>)))
  "Returns string type for a message object of type '<EsrVehicle3>"
  "delphi_esr_msgs/EsrVehicle3")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrVehicle3)))
  "Returns string type for a message object of type 'EsrVehicle3"
  "delphi_esr_msgs/EsrVehicle3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrVehicle3>)))
  "Returns md5sum for a message object of type '<EsrVehicle3>"
  "0833bf12f4f5dda6a3b6915054c197ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrVehicle3)))
  "Returns md5sum for a message object of type 'EsrVehicle3"
  "0833bf12f4f5dda6a3b6915054c197ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrVehicle3>)))
  "Returns full string definition for message of type '<EsrVehicle3>"
  (cl:format cl:nil "Header header~%~%# ESR vehicle3~%bool        long_accel_valid~%bool        lat_accel_valid~%float32     lat_accel~%float32     long_accel~%uint8       radar_fov_lr~%uint8       radar_fov_mr~%bool        auto_align_disable~%uint8       radar_height~%bool        serv_align_type~%bool        serv_align_enable~%uint16      align_avg_ctr_total~%bool        auto_align_converged~%uint8       wheel_slip~%uint8       serv_align_updates_need~%int8        angle_mounting_offset~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrVehicle3)))
  "Returns full string definition for message of type 'EsrVehicle3"
  (cl:format cl:nil "Header header~%~%# ESR vehicle3~%bool        long_accel_valid~%bool        lat_accel_valid~%float32     lat_accel~%float32     long_accel~%uint8       radar_fov_lr~%uint8       radar_fov_mr~%bool        auto_align_disable~%uint8       radar_height~%bool        serv_align_type~%bool        serv_align_enable~%uint16      align_avg_ctr_total~%bool        auto_align_converged~%uint8       wheel_slip~%uint8       serv_align_updates_need~%int8        angle_mounting_offset~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrVehicle3>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
     4
     1
     1
     1
     1
     1
     1
     2
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrVehicle3>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrVehicle3
    (cl:cons ':header (header msg))
    (cl:cons ':long_accel_valid (long_accel_valid msg))
    (cl:cons ':lat_accel_valid (lat_accel_valid msg))
    (cl:cons ':lat_accel (lat_accel msg))
    (cl:cons ':long_accel (long_accel msg))
    (cl:cons ':radar_fov_lr (radar_fov_lr msg))
    (cl:cons ':radar_fov_mr (radar_fov_mr msg))
    (cl:cons ':auto_align_disable (auto_align_disable msg))
    (cl:cons ':radar_height (radar_height msg))
    (cl:cons ':serv_align_type (serv_align_type msg))
    (cl:cons ':serv_align_enable (serv_align_enable msg))
    (cl:cons ':align_avg_ctr_total (align_avg_ctr_total msg))
    (cl:cons ':auto_align_converged (auto_align_converged msg))
    (cl:cons ':wheel_slip (wheel_slip msg))
    (cl:cons ':serv_align_updates_need (serv_align_updates_need msg))
    (cl:cons ':angle_mounting_offset (angle_mounting_offset msg))
))
