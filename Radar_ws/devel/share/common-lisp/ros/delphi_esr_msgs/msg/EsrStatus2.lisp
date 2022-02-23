; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus2.msg.html

(cl:defclass <EsrStatus2> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (canmsg
    :reader canmsg
    :initarg :canmsg
    :type cl:string
    :initform "")
   (rollingCount2
    :reader rollingCount2
    :initarg :rollingCount2
    :type cl:fixnum
    :initform 0)
   (maxTrackAck
    :reader maxTrackAck
    :initarg :maxTrackAck
    :type cl:fixnum
    :initform 0)
   (overheatError
    :reader overheatError
    :initarg :overheatError
    :type cl:boolean
    :initform cl:nil)
   (rangePerfError
    :reader rangePerfError
    :initarg :rangePerfError
    :type cl:boolean
    :initform cl:nil)
   (internalError
    :reader internalError
    :initarg :internalError
    :type cl:boolean
    :initform cl:nil)
   (xcvrOperational
    :reader xcvrOperational
    :initarg :xcvrOperational
    :type cl:boolean
    :initform cl:nil)
   (rawDataMode
    :reader rawDataMode
    :initarg :rawDataMode
    :type cl:boolean
    :initform cl:nil)
   (steerAngleAck
    :reader steerAngleAck
    :initarg :steerAngleAck
    :type cl:fixnum
    :initform 0)
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:fixnum
    :initform 0)
   (spdCompFactor
    :reader spdCompFactor
    :initarg :spdCompFactor
    :type cl:float
    :initform 0.0)
   (groupingMode
    :reader groupingMode
    :initarg :groupingMode
    :type cl:fixnum
    :initform 0)
   (yawRateBias
    :reader yawRateBias
    :initarg :yawRateBias
    :type cl:float
    :initform 0.0)
   (swVersionDSP
    :reader swVersionDSP
    :initarg :swVersionDSP
    :type cl:string
    :initform ""))
)

(cl:defclass EsrStatus2 (<EsrStatus2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus2> is deprecated: use delphi_esr_msgs-msg:EsrStatus2 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'rollingCount2-val :lambda-list '(m))
(cl:defmethod rollingCount2-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:rollingCount2-val is deprecated.  Use delphi_esr_msgs-msg:rollingCount2 instead.")
  (rollingCount2 m))

(cl:ensure-generic-function 'maxTrackAck-val :lambda-list '(m))
(cl:defmethod maxTrackAck-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:maxTrackAck-val is deprecated.  Use delphi_esr_msgs-msg:maxTrackAck instead.")
  (maxTrackAck m))

(cl:ensure-generic-function 'overheatError-val :lambda-list '(m))
(cl:defmethod overheatError-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:overheatError-val is deprecated.  Use delphi_esr_msgs-msg:overheatError instead.")
  (overheatError m))

(cl:ensure-generic-function 'rangePerfError-val :lambda-list '(m))
(cl:defmethod rangePerfError-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:rangePerfError-val is deprecated.  Use delphi_esr_msgs-msg:rangePerfError instead.")
  (rangePerfError m))

(cl:ensure-generic-function 'internalError-val :lambda-list '(m))
(cl:defmethod internalError-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:internalError-val is deprecated.  Use delphi_esr_msgs-msg:internalError instead.")
  (internalError m))

(cl:ensure-generic-function 'xcvrOperational-val :lambda-list '(m))
(cl:defmethod xcvrOperational-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:xcvrOperational-val is deprecated.  Use delphi_esr_msgs-msg:xcvrOperational instead.")
  (xcvrOperational m))

(cl:ensure-generic-function 'rawDataMode-val :lambda-list '(m))
(cl:defmethod rawDataMode-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:rawDataMode-val is deprecated.  Use delphi_esr_msgs-msg:rawDataMode instead.")
  (rawDataMode m))

(cl:ensure-generic-function 'steerAngleAck-val :lambda-list '(m))
(cl:defmethod steerAngleAck-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:steerAngleAck-val is deprecated.  Use delphi_esr_msgs-msg:steerAngleAck instead.")
  (steerAngleAck m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:temperature-val is deprecated.  Use delphi_esr_msgs-msg:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'spdCompFactor-val :lambda-list '(m))
(cl:defmethod spdCompFactor-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:spdCompFactor-val is deprecated.  Use delphi_esr_msgs-msg:spdCompFactor instead.")
  (spdCompFactor m))

(cl:ensure-generic-function 'groupingMode-val :lambda-list '(m))
(cl:defmethod groupingMode-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:groupingMode-val is deprecated.  Use delphi_esr_msgs-msg:groupingMode instead.")
  (groupingMode m))

(cl:ensure-generic-function 'yawRateBias-val :lambda-list '(m))
(cl:defmethod yawRateBias-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:yawRateBias-val is deprecated.  Use delphi_esr_msgs-msg:yawRateBias instead.")
  (yawRateBias m))

(cl:ensure-generic-function 'swVersionDSP-val :lambda-list '(m))
(cl:defmethod swVersionDSP-val ((m <EsrStatus2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:swVersionDSP-val is deprecated.  Use delphi_esr_msgs-msg:swVersionDSP instead.")
  (swVersionDSP m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus2>) ostream)
  "Serializes a message object of type '<EsrStatus2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollingCount2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maxTrackAck)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'overheatError) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'rangePerfError) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'internalError) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'xcvrOperational) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'rawDataMode) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steerAngleAck)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steerAngleAck)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'temperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'spdCompFactor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'groupingMode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yawRateBias))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'swVersionDSP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'swVersionDSP))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus2>) istream)
  "Deserializes a message object of type '<EsrStatus2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollingCount2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maxTrackAck)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'overheatError) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'rangePerfError) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'internalError) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'xcvrOperational) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'rawDataMode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steerAngleAck)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steerAngleAck)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'temperature) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'spdCompFactor) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'groupingMode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yawRateBias) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'swVersionDSP) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'swVersionDSP) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus2>)))
  "Returns string type for a message object of type '<EsrStatus2>"
  "delphi_esr_msgs/EsrStatus2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus2)))
  "Returns string type for a message object of type 'EsrStatus2"
  "delphi_esr_msgs/EsrStatus2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus2>)))
  "Returns md5sum for a message object of type '<EsrStatus2>"
  "bcf53fd3f623189a15116de844ce9791")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus2)))
  "Returns md5sum for a message object of type 'EsrStatus2"
  "bcf53fd3f623189a15116de844ce9791")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus2>)))
  "Returns full string definition for message of type '<EsrStatus2>"
  (cl:format cl:nil "Header header~%~%# ESR status2~%string      canmsg~%uint8       rollingCount2~%uint8       maxTrackAck~%bool        overheatError~%bool        rangePerfError~%bool        internalError~%bool        xcvrOperational~%bool        rawDataMode~%uint16      steerAngleAck~%int8        temperature~%float32     spdCompFactor~%uint8       groupingMode~%float32     yawRateBias~%string      swVersionDSP     ~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus2)))
  "Returns full string definition for message of type 'EsrStatus2"
  (cl:format cl:nil "Header header~%~%# ESR status2~%string      canmsg~%uint8       rollingCount2~%uint8       maxTrackAck~%bool        overheatError~%bool        rangePerfError~%bool        internalError~%bool        xcvrOperational~%bool        rawDataMode~%uint16      steerAngleAck~%int8        temperature~%float32     spdCompFactor~%uint8       groupingMode~%float32     yawRateBias~%string      swVersionDSP     ~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     1
     1
     1
     1
     1
     1
     1
     2
     1
     4
     1
     4
     4 (cl:length (cl:slot-value msg 'swVersionDSP))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus2>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus2
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':rollingCount2 (rollingCount2 msg))
    (cl:cons ':maxTrackAck (maxTrackAck msg))
    (cl:cons ':overheatError (overheatError msg))
    (cl:cons ':rangePerfError (rangePerfError msg))
    (cl:cons ':internalError (internalError msg))
    (cl:cons ':xcvrOperational (xcvrOperational msg))
    (cl:cons ':rawDataMode (rawDataMode msg))
    (cl:cons ':steerAngleAck (steerAngleAck msg))
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':spdCompFactor (spdCompFactor msg))
    (cl:cons ':groupingMode (groupingMode msg))
    (cl:cons ':yawRateBias (yawRateBias msg))
    (cl:cons ':swVersionDSP (swVersionDSP msg))
))
