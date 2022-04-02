; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrVehicle4.msg.html

(cl:defclass <EsrVehicle4> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fac_align_cmd_1
    :reader fac_align_cmd_1
    :initarg :fac_align_cmd_1
    :type cl:boolean
    :initform cl:nil)
   (fac_align_cmd_2
    :reader fac_align_cmd_2
    :initarg :fac_align_cmd_2
    :type cl:boolean
    :initform cl:nil)
   (fac_align_max_nt
    :reader fac_align_max_nt
    :initarg :fac_align_max_nt
    :type cl:fixnum
    :initform 0)
   (fac_align_samp_req
    :reader fac_align_samp_req
    :initarg :fac_align_samp_req
    :type cl:fixnum
    :initform 0)
   (fac_tgt_mtg_offset
    :reader fac_tgt_mtg_offset
    :initarg :fac_tgt_mtg_offset
    :type cl:fixnum
    :initform 0)
   (fac_tgt_mtg_space_hor
    :reader fac_tgt_mtg_space_hor
    :initarg :fac_tgt_mtg_space_hor
    :type cl:fixnum
    :initform 0)
   (fac_tgt_mtg_space_ver
    :reader fac_tgt_mtg_space_ver
    :initarg :fac_tgt_mtg_space_ver
    :type cl:fixnum
    :initform 0)
   (fac_tgt_range_1
    :reader fac_tgt_range_1
    :initarg :fac_tgt_range_1
    :type cl:float
    :initform 0.0)
   (fac_tgt_range_r2m
    :reader fac_tgt_range_r2m
    :initarg :fac_tgt_range_r2m
    :type cl:float
    :initform 0.0)
   (fac_tgt_range_m2t
    :reader fac_tgt_range_m2t
    :initarg :fac_tgt_range_m2t
    :type cl:float
    :initform 0.0))
)

(cl:defclass EsrVehicle4 (<EsrVehicle4>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrVehicle4>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrVehicle4)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrVehicle4> is deprecated: use delphi_esr_msgs-msg:EsrVehicle4 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'fac_align_cmd_1-val :lambda-list '(m))
(cl:defmethod fac_align_cmd_1-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_align_cmd_1-val is deprecated.  Use delphi_esr_msgs-msg:fac_align_cmd_1 instead.")
  (fac_align_cmd_1 m))

(cl:ensure-generic-function 'fac_align_cmd_2-val :lambda-list '(m))
(cl:defmethod fac_align_cmd_2-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_align_cmd_2-val is deprecated.  Use delphi_esr_msgs-msg:fac_align_cmd_2 instead.")
  (fac_align_cmd_2 m))

(cl:ensure-generic-function 'fac_align_max_nt-val :lambda-list '(m))
(cl:defmethod fac_align_max_nt-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_align_max_nt-val is deprecated.  Use delphi_esr_msgs-msg:fac_align_max_nt instead.")
  (fac_align_max_nt m))

(cl:ensure-generic-function 'fac_align_samp_req-val :lambda-list '(m))
(cl:defmethod fac_align_samp_req-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_align_samp_req-val is deprecated.  Use delphi_esr_msgs-msg:fac_align_samp_req instead.")
  (fac_align_samp_req m))

(cl:ensure-generic-function 'fac_tgt_mtg_offset-val :lambda-list '(m))
(cl:defmethod fac_tgt_mtg_offset-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_tgt_mtg_offset-val is deprecated.  Use delphi_esr_msgs-msg:fac_tgt_mtg_offset instead.")
  (fac_tgt_mtg_offset m))

(cl:ensure-generic-function 'fac_tgt_mtg_space_hor-val :lambda-list '(m))
(cl:defmethod fac_tgt_mtg_space_hor-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_tgt_mtg_space_hor-val is deprecated.  Use delphi_esr_msgs-msg:fac_tgt_mtg_space_hor instead.")
  (fac_tgt_mtg_space_hor m))

(cl:ensure-generic-function 'fac_tgt_mtg_space_ver-val :lambda-list '(m))
(cl:defmethod fac_tgt_mtg_space_ver-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_tgt_mtg_space_ver-val is deprecated.  Use delphi_esr_msgs-msg:fac_tgt_mtg_space_ver instead.")
  (fac_tgt_mtg_space_ver m))

(cl:ensure-generic-function 'fac_tgt_range_1-val :lambda-list '(m))
(cl:defmethod fac_tgt_range_1-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_tgt_range_1-val is deprecated.  Use delphi_esr_msgs-msg:fac_tgt_range_1 instead.")
  (fac_tgt_range_1 m))

(cl:ensure-generic-function 'fac_tgt_range_r2m-val :lambda-list '(m))
(cl:defmethod fac_tgt_range_r2m-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_tgt_range_r2m-val is deprecated.  Use delphi_esr_msgs-msg:fac_tgt_range_r2m instead.")
  (fac_tgt_range_r2m m))

(cl:ensure-generic-function 'fac_tgt_range_m2t-val :lambda-list '(m))
(cl:defmethod fac_tgt_range_m2t-val ((m <EsrVehicle4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:fac_tgt_range_m2t-val is deprecated.  Use delphi_esr_msgs-msg:fac_tgt_range_m2t instead.")
  (fac_tgt_range_m2t m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrVehicle4>) ostream)
  "Serializes a message object of type '<EsrVehicle4>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fac_align_cmd_1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fac_align_cmd_2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fac_align_max_nt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fac_align_samp_req)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'fac_tgt_mtg_offset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fac_tgt_mtg_space_hor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fac_tgt_mtg_space_ver)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fac_tgt_range_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fac_tgt_range_r2m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fac_tgt_range_m2t))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrVehicle4>) istream)
  "Deserializes a message object of type '<EsrVehicle4>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'fac_align_cmd_1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'fac_align_cmd_2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fac_align_max_nt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fac_align_samp_req)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fac_tgt_mtg_offset) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fac_tgt_mtg_space_hor) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fac_tgt_mtg_space_ver) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fac_tgt_range_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fac_tgt_range_r2m) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fac_tgt_range_m2t) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrVehicle4>)))
  "Returns string type for a message object of type '<EsrVehicle4>"
  "delphi_esr_msgs/EsrVehicle4")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrVehicle4)))
  "Returns string type for a message object of type 'EsrVehicle4"
  "delphi_esr_msgs/EsrVehicle4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrVehicle4>)))
  "Returns md5sum for a message object of type '<EsrVehicle4>"
  "0805b9094a6d63c8c5d196257252ccdb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrVehicle4)))
  "Returns md5sum for a message object of type 'EsrVehicle4"
  "0805b9094a6d63c8c5d196257252ccdb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrVehicle4>)))
  "Returns full string definition for message of type '<EsrVehicle4>"
  (cl:format cl:nil "Header header~%~%# ESR vehicle4~%bool        fac_align_cmd_1~%bool        fac_align_cmd_2~%uint8       fac_align_max_nt~%uint8       fac_align_samp_req~%int8        fac_tgt_mtg_offset~%int8        fac_tgt_mtg_space_hor~%int8        fac_tgt_mtg_space_ver~%float32     fac_tgt_range_1~%float32     fac_tgt_range_r2m~%float32     fac_tgt_range_m2t~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrVehicle4)))
  "Returns full string definition for message of type 'EsrVehicle4"
  (cl:format cl:nil "Header header~%~%# ESR vehicle4~%bool        fac_align_cmd_1~%bool        fac_align_cmd_2~%uint8       fac_align_max_nt~%uint8       fac_align_samp_req~%int8        fac_tgt_mtg_offset~%int8        fac_tgt_mtg_space_hor~%int8        fac_tgt_mtg_space_ver~%float32     fac_tgt_range_1~%float32     fac_tgt_range_r2m~%float32     fac_tgt_range_m2t~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrVehicle4>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     1
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrVehicle4>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrVehicle4
    (cl:cons ':header (header msg))
    (cl:cons ':fac_align_cmd_1 (fac_align_cmd_1 msg))
    (cl:cons ':fac_align_cmd_2 (fac_align_cmd_2 msg))
    (cl:cons ':fac_align_max_nt (fac_align_max_nt msg))
    (cl:cons ':fac_align_samp_req (fac_align_samp_req msg))
    (cl:cons ':fac_tgt_mtg_offset (fac_tgt_mtg_offset msg))
    (cl:cons ':fac_tgt_mtg_space_hor (fac_tgt_mtg_space_hor msg))
    (cl:cons ':fac_tgt_mtg_space_ver (fac_tgt_mtg_space_ver msg))
    (cl:cons ':fac_tgt_range_1 (fac_tgt_range_1 msg))
    (cl:cons ':fac_tgt_range_r2m (fac_tgt_range_r2m msg))
    (cl:cons ':fac_tgt_range_m2t (fac_tgt_range_m2t msg))
))
