; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus5.msg.html

(cl:defclass <EsrStatus5> (roslisp-msg-protocol:ros-message)
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
   (swbattA2D
    :reader swbattA2D
    :initarg :swbattA2D
    :type cl:fixnum
    :initform 0)
   (ignpA2D
    :reader ignpA2D
    :initarg :ignpA2D
    :type cl:fixnum
    :initform 0)
   (temp1A2D
    :reader temp1A2D
    :initarg :temp1A2D
    :type cl:fixnum
    :initform 0)
   (temp2A2D
    :reader temp2A2D
    :initarg :temp2A2D
    :type cl:fixnum
    :initform 0)
   (supply5VA
    :reader supply5VA
    :initarg :supply5VA
    :type cl:fixnum
    :initform 0)
   (supply5VDX
    :reader supply5VDX
    :initarg :supply5VDX
    :type cl:fixnum
    :initform 0)
   (supply53P3V
    :reader supply53P3V
    :initarg :supply53P3V
    :type cl:fixnum
    :initform 0)
   (supply10V
    :reader supply10V
    :initarg :supply10V
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrStatus5 (<EsrStatus5>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus5>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus5)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus5> is deprecated: use delphi_esr_msgs-msg:EsrStatus5 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'swbattA2D-val :lambda-list '(m))
(cl:defmethod swbattA2D-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:swbattA2D-val is deprecated.  Use delphi_esr_msgs-msg:swbattA2D instead.")
  (swbattA2D m))

(cl:ensure-generic-function 'ignpA2D-val :lambda-list '(m))
(cl:defmethod ignpA2D-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:ignpA2D-val is deprecated.  Use delphi_esr_msgs-msg:ignpA2D instead.")
  (ignpA2D m))

(cl:ensure-generic-function 'temp1A2D-val :lambda-list '(m))
(cl:defmethod temp1A2D-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:temp1A2D-val is deprecated.  Use delphi_esr_msgs-msg:temp1A2D instead.")
  (temp1A2D m))

(cl:ensure-generic-function 'temp2A2D-val :lambda-list '(m))
(cl:defmethod temp2A2D-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:temp2A2D-val is deprecated.  Use delphi_esr_msgs-msg:temp2A2D instead.")
  (temp2A2D m))

(cl:ensure-generic-function 'supply5VA-val :lambda-list '(m))
(cl:defmethod supply5VA-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:supply5VA-val is deprecated.  Use delphi_esr_msgs-msg:supply5VA instead.")
  (supply5VA m))

(cl:ensure-generic-function 'supply5VDX-val :lambda-list '(m))
(cl:defmethod supply5VDX-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:supply5VDX-val is deprecated.  Use delphi_esr_msgs-msg:supply5VDX instead.")
  (supply5VDX m))

(cl:ensure-generic-function 'supply53P3V-val :lambda-list '(m))
(cl:defmethod supply53P3V-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:supply53P3V-val is deprecated.  Use delphi_esr_msgs-msg:supply53P3V instead.")
  (supply53P3V m))

(cl:ensure-generic-function 'supply10V-val :lambda-list '(m))
(cl:defmethod supply10V-val ((m <EsrStatus5>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:supply10V-val is deprecated.  Use delphi_esr_msgs-msg:supply10V instead.")
  (supply10V m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus5>) ostream)
  "Serializes a message object of type '<EsrStatus5>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swbattA2D)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ignpA2D)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'temp1A2D)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'temp2A2D)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply5VA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply5VDX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply53P3V)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply10V)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus5>) istream)
  "Deserializes a message object of type '<EsrStatus5>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swbattA2D)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ignpA2D)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'temp1A2D)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'temp2A2D)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply5VA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply5VDX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply53P3V)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply10V)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus5>)))
  "Returns string type for a message object of type '<EsrStatus5>"
  "delphi_esr_msgs/EsrStatus5")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus5)))
  "Returns string type for a message object of type 'EsrStatus5"
  "delphi_esr_msgs/EsrStatus5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus5>)))
  "Returns md5sum for a message object of type '<EsrStatus5>"
  "aae12ba774492012b782362919f8cb63")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus5)))
  "Returns md5sum for a message object of type 'EsrStatus5"
  "aae12ba774492012b782362919f8cb63")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus5>)))
  "Returns full string definition for message of type '<EsrStatus5>"
  (cl:format cl:nil "Header header~%~%# ESR status5~%string      canmsg~%uint8       swbattA2D~%uint8       ignpA2D~%uint8       temp1A2D~%uint8       temp2A2D~%uint8       supply5VA~%uint8       supply5VDX~%uint8       supply53P3V~%uint8       supply10V~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus5)))
  "Returns full string definition for message of type 'EsrStatus5"
  (cl:format cl:nil "Header header~%~%# ESR status5~%string      canmsg~%uint8       swbattA2D~%uint8       ignpA2D~%uint8       temp1A2D~%uint8       temp2A2D~%uint8       supply5VA~%uint8       supply5VDX~%uint8       supply53P3V~%uint8       supply10V~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus5>))
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
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus5>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus5
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':swbattA2D (swbattA2D msg))
    (cl:cons ':ignpA2D (ignpA2D msg))
    (cl:cons ':temp1A2D (temp1A2D msg))
    (cl:cons ':temp2A2D (temp2A2D msg))
    (cl:cons ':supply5VA (supply5VA msg))
    (cl:cons ':supply5VDX (supply5VDX msg))
    (cl:cons ':supply53P3V (supply53P3V msg))
    (cl:cons ':supply10V (supply10V msg))
))
