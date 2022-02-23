; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus8.msg.html

(cl:defclass <EsrStatus8> (roslisp-msg-protocol:ros-message)
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
   (historyFault0
    :reader historyFault0
    :initarg :historyFault0
    :type cl:fixnum
    :initform 0)
   (historyFault1
    :reader historyFault1
    :initarg :historyFault1
    :type cl:fixnum
    :initform 0)
   (historyFault2
    :reader historyFault2
    :initarg :historyFault2
    :type cl:fixnum
    :initform 0)
   (historyFault3
    :reader historyFault3
    :initarg :historyFault3
    :type cl:fixnum
    :initform 0)
   (historyFault4
    :reader historyFault4
    :initarg :historyFault4
    :type cl:fixnum
    :initform 0)
   (historyFault5
    :reader historyFault5
    :initarg :historyFault5
    :type cl:fixnum
    :initform 0)
   (historyFault6
    :reader historyFault6
    :initarg :historyFault6
    :type cl:fixnum
    :initform 0)
   (historyFault7
    :reader historyFault7
    :initarg :historyFault7
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrStatus8 (<EsrStatus8>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus8>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus8)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus8> is deprecated: use delphi_esr_msgs-msg:EsrStatus8 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'historyFault0-val :lambda-list '(m))
(cl:defmethod historyFault0-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault0-val is deprecated.  Use delphi_esr_msgs-msg:historyFault0 instead.")
  (historyFault0 m))

(cl:ensure-generic-function 'historyFault1-val :lambda-list '(m))
(cl:defmethod historyFault1-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault1-val is deprecated.  Use delphi_esr_msgs-msg:historyFault1 instead.")
  (historyFault1 m))

(cl:ensure-generic-function 'historyFault2-val :lambda-list '(m))
(cl:defmethod historyFault2-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault2-val is deprecated.  Use delphi_esr_msgs-msg:historyFault2 instead.")
  (historyFault2 m))

(cl:ensure-generic-function 'historyFault3-val :lambda-list '(m))
(cl:defmethod historyFault3-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault3-val is deprecated.  Use delphi_esr_msgs-msg:historyFault3 instead.")
  (historyFault3 m))

(cl:ensure-generic-function 'historyFault4-val :lambda-list '(m))
(cl:defmethod historyFault4-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault4-val is deprecated.  Use delphi_esr_msgs-msg:historyFault4 instead.")
  (historyFault4 m))

(cl:ensure-generic-function 'historyFault5-val :lambda-list '(m))
(cl:defmethod historyFault5-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault5-val is deprecated.  Use delphi_esr_msgs-msg:historyFault5 instead.")
  (historyFault5 m))

(cl:ensure-generic-function 'historyFault6-val :lambda-list '(m))
(cl:defmethod historyFault6-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault6-val is deprecated.  Use delphi_esr_msgs-msg:historyFault6 instead.")
  (historyFault6 m))

(cl:ensure-generic-function 'historyFault7-val :lambda-list '(m))
(cl:defmethod historyFault7-val ((m <EsrStatus8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:historyFault7-val is deprecated.  Use delphi_esr_msgs-msg:historyFault7 instead.")
  (historyFault7 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus8>) ostream)
  "Serializes a message object of type '<EsrStatus8>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault5)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault6)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault7)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus8>) istream)
  "Deserializes a message object of type '<EsrStatus8>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault5)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault6)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'historyFault7)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus8>)))
  "Returns string type for a message object of type '<EsrStatus8>"
  "delphi_esr_msgs/EsrStatus8")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus8)))
  "Returns string type for a message object of type 'EsrStatus8"
  "delphi_esr_msgs/EsrStatus8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus8>)))
  "Returns md5sum for a message object of type '<EsrStatus8>"
  "cf0bfab7682c50ee2545f1e97677b621")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus8)))
  "Returns md5sum for a message object of type 'EsrStatus8"
  "cf0bfab7682c50ee2545f1e97677b621")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus8>)))
  "Returns full string definition for message of type '<EsrStatus8>"
  (cl:format cl:nil "Header header~%~%# ESR status8~%string      canmsg~%uint8       historyFault0~%uint8       historyFault1~%uint8       historyFault2~%uint8       historyFault3~%uint8       historyFault4~%uint8       historyFault5~%uint8       historyFault6~%uint8       historyFault7~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus8)))
  "Returns full string definition for message of type 'EsrStatus8"
  (cl:format cl:nil "Header header~%~%# ESR status8~%string      canmsg~%uint8       historyFault0~%uint8       historyFault1~%uint8       historyFault2~%uint8       historyFault3~%uint8       historyFault4~%uint8       historyFault5~%uint8       historyFault6~%uint8       historyFault7~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus8>))
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
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus8>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus8
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':historyFault0 (historyFault0 msg))
    (cl:cons ':historyFault1 (historyFault1 msg))
    (cl:cons ':historyFault2 (historyFault2 msg))
    (cl:cons ':historyFault3 (historyFault3 msg))
    (cl:cons ':historyFault4 (historyFault4 msg))
    (cl:cons ':historyFault5 (historyFault5 msg))
    (cl:cons ':historyFault6 (historyFault6 msg))
    (cl:cons ':historyFault7 (historyFault7 msg))
))
