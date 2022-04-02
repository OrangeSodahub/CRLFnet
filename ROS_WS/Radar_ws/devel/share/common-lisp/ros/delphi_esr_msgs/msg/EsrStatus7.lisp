; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus7.msg.html

(cl:defclass <EsrStatus7> (roslisp-msg-protocol:ros-message)
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
   (activeFault0
    :reader activeFault0
    :initarg :activeFault0
    :type cl:fixnum
    :initform 0)
   (activeFault1
    :reader activeFault1
    :initarg :activeFault1
    :type cl:fixnum
    :initform 0)
   (activeFault2
    :reader activeFault2
    :initarg :activeFault2
    :type cl:fixnum
    :initform 0)
   (activeFault3
    :reader activeFault3
    :initarg :activeFault3
    :type cl:fixnum
    :initform 0)
   (activeFault4
    :reader activeFault4
    :initarg :activeFault4
    :type cl:fixnum
    :initform 0)
   (activeFault5
    :reader activeFault5
    :initarg :activeFault5
    :type cl:fixnum
    :initform 0)
   (activeFault6
    :reader activeFault6
    :initarg :activeFault6
    :type cl:fixnum
    :initform 0)
   (activeFault7
    :reader activeFault7
    :initarg :activeFault7
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrStatus7 (<EsrStatus7>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus7>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus7)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus7> is deprecated: use delphi_esr_msgs-msg:EsrStatus7 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'activeFault0-val :lambda-list '(m))
(cl:defmethod activeFault0-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault0-val is deprecated.  Use delphi_esr_msgs-msg:activeFault0 instead.")
  (activeFault0 m))

(cl:ensure-generic-function 'activeFault1-val :lambda-list '(m))
(cl:defmethod activeFault1-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault1-val is deprecated.  Use delphi_esr_msgs-msg:activeFault1 instead.")
  (activeFault1 m))

(cl:ensure-generic-function 'activeFault2-val :lambda-list '(m))
(cl:defmethod activeFault2-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault2-val is deprecated.  Use delphi_esr_msgs-msg:activeFault2 instead.")
  (activeFault2 m))

(cl:ensure-generic-function 'activeFault3-val :lambda-list '(m))
(cl:defmethod activeFault3-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault3-val is deprecated.  Use delphi_esr_msgs-msg:activeFault3 instead.")
  (activeFault3 m))

(cl:ensure-generic-function 'activeFault4-val :lambda-list '(m))
(cl:defmethod activeFault4-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault4-val is deprecated.  Use delphi_esr_msgs-msg:activeFault4 instead.")
  (activeFault4 m))

(cl:ensure-generic-function 'activeFault5-val :lambda-list '(m))
(cl:defmethod activeFault5-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault5-val is deprecated.  Use delphi_esr_msgs-msg:activeFault5 instead.")
  (activeFault5 m))

(cl:ensure-generic-function 'activeFault6-val :lambda-list '(m))
(cl:defmethod activeFault6-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault6-val is deprecated.  Use delphi_esr_msgs-msg:activeFault6 instead.")
  (activeFault6 m))

(cl:ensure-generic-function 'activeFault7-val :lambda-list '(m))
(cl:defmethod activeFault7-val ((m <EsrStatus7>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:activeFault7-val is deprecated.  Use delphi_esr_msgs-msg:activeFault7 instead.")
  (activeFault7 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus7>) ostream)
  "Serializes a message object of type '<EsrStatus7>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault5)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault6)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault7)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus7>) istream)
  "Deserializes a message object of type '<EsrStatus7>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault5)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault6)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'activeFault7)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus7>)))
  "Returns string type for a message object of type '<EsrStatus7>"
  "delphi_esr_msgs/EsrStatus7")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus7)))
  "Returns string type for a message object of type 'EsrStatus7"
  "delphi_esr_msgs/EsrStatus7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus7>)))
  "Returns md5sum for a message object of type '<EsrStatus7>"
  "b04af575c0721e778fa727e03d332233")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus7)))
  "Returns md5sum for a message object of type 'EsrStatus7"
  "b04af575c0721e778fa727e03d332233")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus7>)))
  "Returns full string definition for message of type '<EsrStatus7>"
  (cl:format cl:nil "Header header~%~%# ESR status7~%string      canmsg~%uint8       activeFault0~%uint8       activeFault1~%uint8       activeFault2~%uint8       activeFault3~%uint8       activeFault4~%uint8       activeFault5~%uint8       activeFault6~%uint8       activeFault7~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus7)))
  "Returns full string definition for message of type 'EsrStatus7"
  (cl:format cl:nil "Header header~%~%# ESR status7~%string      canmsg~%uint8       activeFault0~%uint8       activeFault1~%uint8       activeFault2~%uint8       activeFault3~%uint8       activeFault4~%uint8       activeFault5~%uint8       activeFault6~%uint8       activeFault7~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus7>))
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
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus7>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus7
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':activeFault0 (activeFault0 msg))
    (cl:cons ':activeFault1 (activeFault1 msg))
    (cl:cons ':activeFault2 (activeFault2 msg))
    (cl:cons ':activeFault3 (activeFault3 msg))
    (cl:cons ':activeFault4 (activeFault4 msg))
    (cl:cons ':activeFault5 (activeFault5 msg))
    (cl:cons ':activeFault6 (activeFault6 msg))
    (cl:cons ':activeFault7 (activeFault7 msg))
))
