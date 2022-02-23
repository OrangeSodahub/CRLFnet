; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus9.msg.html

(cl:defclass <EsrStatus9> (roslisp-msg-protocol:ros-message)
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
   (avgPwrCwblkg
    :reader avgPwrCwblkg
    :initarg :avgPwrCwblkg
    :type cl:fixnum
    :initform 0)
   (sideSlipAngle
    :reader sideSlipAngle
    :initarg :sideSlipAngle
    :type cl:float
    :initform 0.0)
   (serialNum3rdByte
    :reader serialNum3rdByte
    :initarg :serialNum3rdByte
    :type cl:fixnum
    :initform 0)
   (waterSprayTargetID
    :reader waterSprayTargetID
    :initarg :waterSprayTargetID
    :type cl:fixnum
    :initform 0)
   (filteredXohpAccCIPV
    :reader filteredXohpAccCIPV
    :initarg :filteredXohpAccCIPV
    :type cl:float
    :initform 0.0)
   (pathIDACC2
    :reader pathIDACC2
    :initarg :pathIDACC2
    :type cl:fixnum
    :initform 0)
   (pathIDACC3
    :reader pathIDACC3
    :initarg :pathIDACC3
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrStatus9 (<EsrStatus9>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus9>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus9)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus9> is deprecated: use delphi_esr_msgs-msg:EsrStatus9 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'avgPwrCwblkg-val :lambda-list '(m))
(cl:defmethod avgPwrCwblkg-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:avgPwrCwblkg-val is deprecated.  Use delphi_esr_msgs-msg:avgPwrCwblkg instead.")
  (avgPwrCwblkg m))

(cl:ensure-generic-function 'sideSlipAngle-val :lambda-list '(m))
(cl:defmethod sideSlipAngle-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:sideSlipAngle-val is deprecated.  Use delphi_esr_msgs-msg:sideSlipAngle instead.")
  (sideSlipAngle m))

(cl:ensure-generic-function 'serialNum3rdByte-val :lambda-list '(m))
(cl:defmethod serialNum3rdByte-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:serialNum3rdByte-val is deprecated.  Use delphi_esr_msgs-msg:serialNum3rdByte instead.")
  (serialNum3rdByte m))

(cl:ensure-generic-function 'waterSprayTargetID-val :lambda-list '(m))
(cl:defmethod waterSprayTargetID-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:waterSprayTargetID-val is deprecated.  Use delphi_esr_msgs-msg:waterSprayTargetID instead.")
  (waterSprayTargetID m))

(cl:ensure-generic-function 'filteredXohpAccCIPV-val :lambda-list '(m))
(cl:defmethod filteredXohpAccCIPV-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:filteredXohpAccCIPV-val is deprecated.  Use delphi_esr_msgs-msg:filteredXohpAccCIPV instead.")
  (filteredXohpAccCIPV m))

(cl:ensure-generic-function 'pathIDACC2-val :lambda-list '(m))
(cl:defmethod pathIDACC2-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIDACC2-val is deprecated.  Use delphi_esr_msgs-msg:pathIDACC2 instead.")
  (pathIDACC2 m))

(cl:ensure-generic-function 'pathIDACC3-val :lambda-list '(m))
(cl:defmethod pathIDACC3-val ((m <EsrStatus9>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIDACC3-val is deprecated.  Use delphi_esr_msgs-msg:pathIDACC3 instead.")
  (pathIDACC3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus9>) ostream)
  "Serializes a message object of type '<EsrStatus9>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'avgPwrCwblkg)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'avgPwrCwblkg)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sideSlipAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serialNum3rdByte)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'waterSprayTargetID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'filteredXohpAccCIPV))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIDACC2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIDACC3)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus9>) istream)
  "Deserializes a message object of type '<EsrStatus9>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'avgPwrCwblkg)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'avgPwrCwblkg)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sideSlipAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serialNum3rdByte)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'waterSprayTargetID)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'filteredXohpAccCIPV) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIDACC2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIDACC3)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus9>)))
  "Returns string type for a message object of type '<EsrStatus9>"
  "delphi_esr_msgs/EsrStatus9")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus9)))
  "Returns string type for a message object of type 'EsrStatus9"
  "delphi_esr_msgs/EsrStatus9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus9>)))
  "Returns md5sum for a message object of type '<EsrStatus9>"
  "fc4ded94c686bdf234c4ceb10632e67c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus9)))
  "Returns md5sum for a message object of type 'EsrStatus9"
  "fc4ded94c686bdf234c4ceb10632e67c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus9>)))
  "Returns full string definition for message of type '<EsrStatus9>"
  (cl:format cl:nil "Header header~%~%# ESR status9~%string      canmsg~%uint16      avgPwrCwblkg~%float32     sideSlipAngle~%uint8       serialNum3rdByte~%uint8       waterSprayTargetID~%float32     filteredXohpAccCIPV~%uint8       pathIDACC2~%uint8       pathIDACC3~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus9)))
  "Returns full string definition for message of type 'EsrStatus9"
  (cl:format cl:nil "Header header~%~%# ESR status9~%string      canmsg~%uint16      avgPwrCwblkg~%float32     sideSlipAngle~%uint8       serialNum3rdByte~%uint8       waterSprayTargetID~%float32     filteredXohpAccCIPV~%uint8       pathIDACC2~%uint8       pathIDACC3~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus9>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     2
     4
     1
     1
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus9>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus9
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':avgPwrCwblkg (avgPwrCwblkg msg))
    (cl:cons ':sideSlipAngle (sideSlipAngle msg))
    (cl:cons ':serialNum3rdByte (serialNum3rdByte msg))
    (cl:cons ':waterSprayTargetID (waterSprayTargetID msg))
    (cl:cons ':filteredXohpAccCIPV (filteredXohpAccCIPV msg))
    (cl:cons ':pathIDACC2 (pathIDACC2 msg))
    (cl:cons ':pathIDACC3 (pathIDACC3 msg))
))
