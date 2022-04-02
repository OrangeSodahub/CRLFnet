; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrValid2.msg.html

(cl:defclass <EsrValid2> (roslisp-msg-protocol:ros-message)
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
   (mrSN
    :reader mrSN
    :initarg :mrSN
    :type cl:fixnum
    :initform 0)
   (mrRange
    :reader mrRange
    :initarg :mrRange
    :type cl:float
    :initform 0.0)
   (mrRangeRate
    :reader mrRangeRate
    :initarg :mrRangeRate
    :type cl:float
    :initform 0.0)
   (mrAngle
    :reader mrAngle
    :initarg :mrAngle
    :type cl:float
    :initform 0.0)
   (mrPower
    :reader mrPower
    :initarg :mrPower
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrValid2 (<EsrValid2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrValid2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrValid2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrValid2> is deprecated: use delphi_esr_msgs-msg:EsrValid2 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'mrSN-val :lambda-list '(m))
(cl:defmethod mrSN-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mrSN-val is deprecated.  Use delphi_esr_msgs-msg:mrSN instead.")
  (mrSN m))

(cl:ensure-generic-function 'mrRange-val :lambda-list '(m))
(cl:defmethod mrRange-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mrRange-val is deprecated.  Use delphi_esr_msgs-msg:mrRange instead.")
  (mrRange m))

(cl:ensure-generic-function 'mrRangeRate-val :lambda-list '(m))
(cl:defmethod mrRangeRate-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mrRangeRate-val is deprecated.  Use delphi_esr_msgs-msg:mrRangeRate instead.")
  (mrRangeRate m))

(cl:ensure-generic-function 'mrAngle-val :lambda-list '(m))
(cl:defmethod mrAngle-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mrAngle-val is deprecated.  Use delphi_esr_msgs-msg:mrAngle instead.")
  (mrAngle m))

(cl:ensure-generic-function 'mrPower-val :lambda-list '(m))
(cl:defmethod mrPower-val ((m <EsrValid2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mrPower-val is deprecated.  Use delphi_esr_msgs-msg:mrPower instead.")
  (mrPower m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrValid2>) ostream)
  "Serializes a message object of type '<EsrValid2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mrSN)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mrRange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mrRangeRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mrAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'mrPower)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrValid2>) istream)
  "Deserializes a message object of type '<EsrValid2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mrSN)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mrRange) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mrRangeRate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mrAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mrPower) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrValid2>)))
  "Returns string type for a message object of type '<EsrValid2>"
  "delphi_esr_msgs/EsrValid2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrValid2)))
  "Returns string type for a message object of type 'EsrValid2"
  "delphi_esr_msgs/EsrValid2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrValid2>)))
  "Returns md5sum for a message object of type '<EsrValid2>"
  "9358feca721eb3835f63862d71ddc71c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrValid2)))
  "Returns md5sum for a message object of type 'EsrValid2"
  "9358feca721eb3835f63862d71ddc71c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrValid2>)))
  "Returns full string definition for message of type '<EsrValid2>"
  (cl:format cl:nil "Header header~%~%# ESR valid2~%string      canmsg~%uint8       mrSN~%float32     mrRange~%float32     mrRangeRate~%float32     mrAngle~%int8        mrPower~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrValid2)))
  "Returns full string definition for message of type 'EsrValid2"
  (cl:format cl:nil "Header header~%~%# ESR valid2~%string      canmsg~%uint8       mrSN~%float32     mrRange~%float32     mrRangeRate~%float32     mrAngle~%int8        mrPower~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrValid2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     1
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrValid2>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrValid2
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':mrSN (mrSN msg))
    (cl:cons ':mrRange (mrRange msg))
    (cl:cons ':mrRangeRate (mrRangeRate msg))
    (cl:cons ':mrAngle (mrAngle msg))
    (cl:cons ':mrPower (mrPower msg))
))
