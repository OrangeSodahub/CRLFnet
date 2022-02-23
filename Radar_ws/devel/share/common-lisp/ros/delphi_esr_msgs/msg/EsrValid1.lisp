; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrValid1.msg.html

(cl:defclass <EsrValid1> (roslisp-msg-protocol:ros-message)
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
   (lrSN
    :reader lrSN
    :initarg :lrSN
    :type cl:fixnum
    :initform 0)
   (lrRange
    :reader lrRange
    :initarg :lrRange
    :type cl:float
    :initform 0.0)
   (lrRangeRate
    :reader lrRangeRate
    :initarg :lrRangeRate
    :type cl:float
    :initform 0.0)
   (lrAngle
    :reader lrAngle
    :initarg :lrAngle
    :type cl:float
    :initform 0.0)
   (lrPower
    :reader lrPower
    :initarg :lrPower
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EsrValid1 (<EsrValid1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrValid1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrValid1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrValid1> is deprecated: use delphi_esr_msgs-msg:EsrValid1 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'lrSN-val :lambda-list '(m))
(cl:defmethod lrSN-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lrSN-val is deprecated.  Use delphi_esr_msgs-msg:lrSN instead.")
  (lrSN m))

(cl:ensure-generic-function 'lrRange-val :lambda-list '(m))
(cl:defmethod lrRange-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lrRange-val is deprecated.  Use delphi_esr_msgs-msg:lrRange instead.")
  (lrRange m))

(cl:ensure-generic-function 'lrRangeRate-val :lambda-list '(m))
(cl:defmethod lrRangeRate-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lrRangeRate-val is deprecated.  Use delphi_esr_msgs-msg:lrRangeRate instead.")
  (lrRangeRate m))

(cl:ensure-generic-function 'lrAngle-val :lambda-list '(m))
(cl:defmethod lrAngle-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lrAngle-val is deprecated.  Use delphi_esr_msgs-msg:lrAngle instead.")
  (lrAngle m))

(cl:ensure-generic-function 'lrPower-val :lambda-list '(m))
(cl:defmethod lrPower-val ((m <EsrValid1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lrPower-val is deprecated.  Use delphi_esr_msgs-msg:lrPower instead.")
  (lrPower m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrValid1>) ostream)
  "Serializes a message object of type '<EsrValid1>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lrSN)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lrRange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lrRangeRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lrAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'lrPower)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrValid1>) istream)
  "Deserializes a message object of type '<EsrValid1>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lrSN)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lrRange) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lrRangeRate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lrAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lrPower) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrValid1>)))
  "Returns string type for a message object of type '<EsrValid1>"
  "delphi_esr_msgs/EsrValid1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrValid1)))
  "Returns string type for a message object of type 'EsrValid1"
  "delphi_esr_msgs/EsrValid1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrValid1>)))
  "Returns md5sum for a message object of type '<EsrValid1>"
  "c4abfbd505e6dac4796d76d198d45785")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrValid1)))
  "Returns md5sum for a message object of type 'EsrValid1"
  "c4abfbd505e6dac4796d76d198d45785")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrValid1>)))
  "Returns full string definition for message of type '<EsrValid1>"
  (cl:format cl:nil "Header header~%~%# ESR valid1~%string      canmsg~%uint8       lrSN~%float32     lrRange~%float32     lrRangeRate~%float32     lrAngle~%int8        lrPower~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrValid1)))
  "Returns full string definition for message of type 'EsrValid1"
  (cl:format cl:nil "Header header~%~%# ESR valid1~%string      canmsg~%uint8       lrSN~%float32     lrRange~%float32     lrRangeRate~%float32     lrAngle~%int8        lrPower~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrValid1>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     1
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrValid1>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrValid1
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':lrSN (lrSN msg))
    (cl:cons ':lrRange (lrRange msg))
    (cl:cons ':lrRangeRate (lrRangeRate msg))
    (cl:cons ':lrAngle (lrAngle msg))
    (cl:cons ':lrPower (lrPower msg))
))
