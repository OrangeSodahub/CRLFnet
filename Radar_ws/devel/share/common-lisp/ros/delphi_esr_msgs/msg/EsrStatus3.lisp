; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus3.msg.html

(cl:defclass <EsrStatus3> (roslisp-msg-protocol:ros-message)
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
   (hwVersion
    :reader hwVersion
    :initarg :hwVersion
    :type cl:fixnum
    :initform 0)
   (interfaceVersion
    :reader interfaceVersion
    :initarg :interfaceVersion
    :type cl:fixnum
    :initform 0)
   (swVersionPld
    :reader swVersionPld
    :initarg :swVersionPld
    :type cl:fixnum
    :initform 0)
   (swVersionHost
    :reader swVersionHost
    :initarg :swVersionHost
    :type cl:string
    :initform "")
   (serialNum
    :reader serialNum
    :initarg :serialNum
    :type cl:string
    :initform ""))
)

(cl:defclass EsrStatus3 (<EsrStatus3>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus3>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus3)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus3> is deprecated: use delphi_esr_msgs-msg:EsrStatus3 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'hwVersion-val :lambda-list '(m))
(cl:defmethod hwVersion-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:hwVersion-val is deprecated.  Use delphi_esr_msgs-msg:hwVersion instead.")
  (hwVersion m))

(cl:ensure-generic-function 'interfaceVersion-val :lambda-list '(m))
(cl:defmethod interfaceVersion-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:interfaceVersion-val is deprecated.  Use delphi_esr_msgs-msg:interfaceVersion instead.")
  (interfaceVersion m))

(cl:ensure-generic-function 'swVersionPld-val :lambda-list '(m))
(cl:defmethod swVersionPld-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:swVersionPld-val is deprecated.  Use delphi_esr_msgs-msg:swVersionPld instead.")
  (swVersionPld m))

(cl:ensure-generic-function 'swVersionHost-val :lambda-list '(m))
(cl:defmethod swVersionHost-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:swVersionHost-val is deprecated.  Use delphi_esr_msgs-msg:swVersionHost instead.")
  (swVersionHost m))

(cl:ensure-generic-function 'serialNum-val :lambda-list '(m))
(cl:defmethod serialNum-val ((m <EsrStatus3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:serialNum-val is deprecated.  Use delphi_esr_msgs-msg:serialNum instead.")
  (serialNum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus3>) ostream)
  "Serializes a message object of type '<EsrStatus3>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hwVersion)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'interfaceVersion)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swVersionPld)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'swVersionHost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'swVersionHost))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'serialNum))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'serialNum))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus3>) istream)
  "Deserializes a message object of type '<EsrStatus3>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hwVersion)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'interfaceVersion)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swVersionPld)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'swVersionHost) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'swVersionHost) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'serialNum) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'serialNum) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus3>)))
  "Returns string type for a message object of type '<EsrStatus3>"
  "delphi_esr_msgs/EsrStatus3")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus3)))
  "Returns string type for a message object of type 'EsrStatus3"
  "delphi_esr_msgs/EsrStatus3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus3>)))
  "Returns md5sum for a message object of type '<EsrStatus3>"
  "d267bafb7654adc3b6ab9a341e242e48")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus3)))
  "Returns md5sum for a message object of type 'EsrStatus3"
  "d267bafb7654adc3b6ab9a341e242e48")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus3>)))
  "Returns full string definition for message of type '<EsrStatus3>"
  (cl:format cl:nil "Header header~%~%# ESR status3~%string      canmsg~%uint8      hwVersion~%uint8      interfaceVersion~%uint8      swVersionPld~%string      swVersionHost~%string      serialNum~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus3)))
  "Returns full string definition for message of type 'EsrStatus3"
  (cl:format cl:nil "Header header~%~%# ESR status3~%string      canmsg~%uint8      hwVersion~%uint8      interfaceVersion~%uint8      swVersionPld~%string      swVersionHost~%string      serialNum~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus3>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'swVersionHost))
     4 (cl:length (cl:slot-value msg 'serialNum))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus3>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus3
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':hwVersion (hwVersion msg))
    (cl:cons ':interfaceVersion (interfaceVersion msg))
    (cl:cons ':swVersionPld (swVersionPld msg))
    (cl:cons ':swVersionHost (swVersionHost msg))
    (cl:cons ':serialNum (serialNum msg))
))
