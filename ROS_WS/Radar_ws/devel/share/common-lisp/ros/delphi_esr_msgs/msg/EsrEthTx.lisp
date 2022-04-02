; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrEthTx.msg.html

(cl:defclass <EsrEthTx> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (xcp_format_version
    :reader xcp_format_version
    :initarg :xcp_format_version
    :type cl:fixnum
    :initform 0)
   (scan_index
    :reader scan_index
    :initarg :scan_index
    :type cl:fixnum
    :initform 0)
   (tcp_size
    :reader tcp_size
    :initarg :tcp_size
    :type cl:fixnum
    :initform 0)
   (xcp_scan_type
    :reader xcp_scan_type
    :initarg :xcp_scan_type
    :type cl:fixnum
    :initform 0)
   (look_index
    :reader look_index
    :initarg :look_index
    :type cl:fixnum
    :initform 0)
   (mmr_scan_index
    :reader mmr_scan_index
    :initarg :mmr_scan_index
    :type cl:fixnum
    :initform 0)
   (target_report_host_speed
    :reader target_report_host_speed
    :initarg :target_report_host_speed
    :type cl:float
    :initform 0.0)
   (target_report_host_yaw_rate
    :reader target_report_host_yaw_rate
    :initarg :target_report_host_yaw_rate
    :type cl:float
    :initform 0.0)
   (xcp_timestamp
    :reader xcp_timestamp
    :initarg :xcp_timestamp
    :type cl:integer
    :initform 0)
   (release_revision
    :reader release_revision
    :initarg :release_revision
    :type cl:fixnum
    :initform 0)
   (promote_revision
    :reader promote_revision
    :initarg :promote_revision
    :type cl:fixnum
    :initform 0)
   (field_revision
    :reader field_revision
    :initarg :field_revision
    :type cl:fixnum
    :initform 0)
   (target_report_count
    :reader target_report_count
    :initarg :target_report_count
    :type cl:fixnum
    :initform 0)
   (target_report_range
    :reader target_report_range
    :initarg :target_report_range
    :type (cl:vector cl:float)
   :initform (cl:make-array 64 :element-type 'cl:float :initial-element 0.0))
   (target_report_range_rate
    :reader target_report_range_rate
    :initarg :target_report_range_rate
    :type (cl:vector cl:float)
   :initform (cl:make-array 64 :element-type 'cl:float :initial-element 0.0))
   (target_report_theta
    :reader target_report_theta
    :initarg :target_report_theta
    :type (cl:vector cl:float)
   :initform (cl:make-array 64 :element-type 'cl:float :initial-element 0.0))
   (target_report_amplitude
    :reader target_report_amplitude
    :initarg :target_report_amplitude
    :type (cl:vector cl:float)
   :initform (cl:make-array 64 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass EsrEthTx (<EsrEthTx>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrEthTx>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrEthTx)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrEthTx> is deprecated: use delphi_esr_msgs-msg:EsrEthTx instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'xcp_format_version-val :lambda-list '(m))
(cl:defmethod xcp_format_version-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:xcp_format_version-val is deprecated.  Use delphi_esr_msgs-msg:xcp_format_version instead.")
  (xcp_format_version m))

(cl:ensure-generic-function 'scan_index-val :lambda-list '(m))
(cl:defmethod scan_index-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:scan_index-val is deprecated.  Use delphi_esr_msgs-msg:scan_index instead.")
  (scan_index m))

(cl:ensure-generic-function 'tcp_size-val :lambda-list '(m))
(cl:defmethod tcp_size-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:tcp_size-val is deprecated.  Use delphi_esr_msgs-msg:tcp_size instead.")
  (tcp_size m))

(cl:ensure-generic-function 'xcp_scan_type-val :lambda-list '(m))
(cl:defmethod xcp_scan_type-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:xcp_scan_type-val is deprecated.  Use delphi_esr_msgs-msg:xcp_scan_type instead.")
  (xcp_scan_type m))

(cl:ensure-generic-function 'look_index-val :lambda-list '(m))
(cl:defmethod look_index-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:look_index-val is deprecated.  Use delphi_esr_msgs-msg:look_index instead.")
  (look_index m))

(cl:ensure-generic-function 'mmr_scan_index-val :lambda-list '(m))
(cl:defmethod mmr_scan_index-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mmr_scan_index-val is deprecated.  Use delphi_esr_msgs-msg:mmr_scan_index instead.")
  (mmr_scan_index m))

(cl:ensure-generic-function 'target_report_host_speed-val :lambda-list '(m))
(cl:defmethod target_report_host_speed-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_host_speed-val is deprecated.  Use delphi_esr_msgs-msg:target_report_host_speed instead.")
  (target_report_host_speed m))

(cl:ensure-generic-function 'target_report_host_yaw_rate-val :lambda-list '(m))
(cl:defmethod target_report_host_yaw_rate-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_host_yaw_rate-val is deprecated.  Use delphi_esr_msgs-msg:target_report_host_yaw_rate instead.")
  (target_report_host_yaw_rate m))

(cl:ensure-generic-function 'xcp_timestamp-val :lambda-list '(m))
(cl:defmethod xcp_timestamp-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:xcp_timestamp-val is deprecated.  Use delphi_esr_msgs-msg:xcp_timestamp instead.")
  (xcp_timestamp m))

(cl:ensure-generic-function 'release_revision-val :lambda-list '(m))
(cl:defmethod release_revision-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:release_revision-val is deprecated.  Use delphi_esr_msgs-msg:release_revision instead.")
  (release_revision m))

(cl:ensure-generic-function 'promote_revision-val :lambda-list '(m))
(cl:defmethod promote_revision-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:promote_revision-val is deprecated.  Use delphi_esr_msgs-msg:promote_revision instead.")
  (promote_revision m))

(cl:ensure-generic-function 'field_revision-val :lambda-list '(m))
(cl:defmethod field_revision-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:field_revision-val is deprecated.  Use delphi_esr_msgs-msg:field_revision instead.")
  (field_revision m))

(cl:ensure-generic-function 'target_report_count-val :lambda-list '(m))
(cl:defmethod target_report_count-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_count-val is deprecated.  Use delphi_esr_msgs-msg:target_report_count instead.")
  (target_report_count m))

(cl:ensure-generic-function 'target_report_range-val :lambda-list '(m))
(cl:defmethod target_report_range-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_range-val is deprecated.  Use delphi_esr_msgs-msg:target_report_range instead.")
  (target_report_range m))

(cl:ensure-generic-function 'target_report_range_rate-val :lambda-list '(m))
(cl:defmethod target_report_range_rate-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_range_rate-val is deprecated.  Use delphi_esr_msgs-msg:target_report_range_rate instead.")
  (target_report_range_rate m))

(cl:ensure-generic-function 'target_report_theta-val :lambda-list '(m))
(cl:defmethod target_report_theta-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_theta-val is deprecated.  Use delphi_esr_msgs-msg:target_report_theta instead.")
  (target_report_theta m))

(cl:ensure-generic-function 'target_report_amplitude-val :lambda-list '(m))
(cl:defmethod target_report_amplitude-val ((m <EsrEthTx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:target_report_amplitude-val is deprecated.  Use delphi_esr_msgs-msg:target_report_amplitude instead.")
  (target_report_amplitude m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrEthTx>) ostream)
  "Serializes a message object of type '<EsrEthTx>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xcp_format_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'xcp_format_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scan_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scan_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tcp_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tcp_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xcp_scan_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'look_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'look_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mmr_scan_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'mmr_scan_index)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_report_host_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_report_host_yaw_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xcp_timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'xcp_timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'xcp_timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'xcp_timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'release_revision)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'promote_revision)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'field_revision)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target_report_count)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'target_report_range))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'target_report_range_rate))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'target_report_theta))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'target_report_amplitude))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrEthTx>) istream)
  "Deserializes a message object of type '<EsrEthTx>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xcp_format_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'xcp_format_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scan_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scan_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tcp_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tcp_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xcp_scan_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'look_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'look_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mmr_scan_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'mmr_scan_index)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_report_host_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_report_host_yaw_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xcp_timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'xcp_timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'xcp_timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'xcp_timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'release_revision)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'promote_revision)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'field_revision)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target_report_count)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'target_report_range) (cl:make-array 64))
  (cl:let ((vals (cl:slot-value msg 'target_report_range)))
    (cl:dotimes (i 64)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'target_report_range_rate) (cl:make-array 64))
  (cl:let ((vals (cl:slot-value msg 'target_report_range_rate)))
    (cl:dotimes (i 64)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'target_report_theta) (cl:make-array 64))
  (cl:let ((vals (cl:slot-value msg 'target_report_theta)))
    (cl:dotimes (i 64)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'target_report_amplitude) (cl:make-array 64))
  (cl:let ((vals (cl:slot-value msg 'target_report_amplitude)))
    (cl:dotimes (i 64)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrEthTx>)))
  "Returns string type for a message object of type '<EsrEthTx>"
  "delphi_esr_msgs/EsrEthTx")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrEthTx)))
  "Returns string type for a message object of type 'EsrEthTx"
  "delphi_esr_msgs/EsrEthTx")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrEthTx>)))
  "Returns md5sum for a message object of type '<EsrEthTx>"
  "ea522dc4f556d335d7b446f66f5ac1d2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrEthTx)))
  "Returns md5sum for a message object of type 'EsrEthTx"
  "ea522dc4f556d335d7b446f66f5ac1d2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrEthTx>)))
  "Returns full string definition for message of type '<EsrEthTx>"
  (cl:format cl:nil "Header header~%~%# ESR Track Msg~%uint16	      xcp_format_version~%uint16        scan_index~%uint16        tcp_size~%uint8         xcp_scan_type~%uint16        look_index~%uint16        mmr_scan_index~%float32         target_report_host_speed~%float32         target_report_host_yaw_rate~%uint32        xcp_timestamp~%uint8         release_revision~%uint8         promote_revision~%uint8         field_revision~%uint8        target_report_count~%float32[64]       target_report_range~%float32[64]       target_report_range_rate~%float32[64]       target_report_theta~%float32[64]       target_report_amplitude~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrEthTx)))
  "Returns full string definition for message of type 'EsrEthTx"
  (cl:format cl:nil "Header header~%~%# ESR Track Msg~%uint16	      xcp_format_version~%uint16        scan_index~%uint16        tcp_size~%uint8         xcp_scan_type~%uint16        look_index~%uint16        mmr_scan_index~%float32         target_report_host_speed~%float32         target_report_host_yaw_rate~%uint32        xcp_timestamp~%uint8         release_revision~%uint8         promote_revision~%uint8         field_revision~%uint8        target_report_count~%float32[64]       target_report_range~%float32[64]       target_report_range_rate~%float32[64]       target_report_theta~%float32[64]       target_report_amplitude~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrEthTx>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
     2
     1
     2
     2
     4
     4
     4
     1
     1
     1
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'target_report_range) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'target_report_range_rate) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'target_report_theta) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'target_report_amplitude) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrEthTx>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrEthTx
    (cl:cons ':header (header msg))
    (cl:cons ':xcp_format_version (xcp_format_version msg))
    (cl:cons ':scan_index (scan_index msg))
    (cl:cons ':tcp_size (tcp_size msg))
    (cl:cons ':xcp_scan_type (xcp_scan_type msg))
    (cl:cons ':look_index (look_index msg))
    (cl:cons ':mmr_scan_index (mmr_scan_index msg))
    (cl:cons ':target_report_host_speed (target_report_host_speed msg))
    (cl:cons ':target_report_host_yaw_rate (target_report_host_yaw_rate msg))
    (cl:cons ':xcp_timestamp (xcp_timestamp msg))
    (cl:cons ':release_revision (release_revision msg))
    (cl:cons ':promote_revision (promote_revision msg))
    (cl:cons ':field_revision (field_revision msg))
    (cl:cons ':target_report_count (target_report_count msg))
    (cl:cons ':target_report_range (target_report_range msg))
    (cl:cons ':target_report_range_rate (target_report_range_rate msg))
    (cl:cons ':target_report_theta (target_report_theta msg))
    (cl:cons ':target_report_amplitude (target_report_amplitude msg))
))
