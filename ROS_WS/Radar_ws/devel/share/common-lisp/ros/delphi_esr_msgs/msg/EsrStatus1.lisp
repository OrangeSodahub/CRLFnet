; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus1.msg.html

(cl:defclass <EsrStatus1> (roslisp-msg-protocol:ros-message)
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
   (timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:fixnum
    :initform 0)
   (rollingCount
    :reader rollingCount
    :initarg :rollingCount
    :type cl:fixnum
    :initform 0)
   (commError
    :reader commError
    :initarg :commError
    :type cl:boolean
    :initform cl:nil)
   (curvature
    :reader curvature
    :initarg :curvature
    :type cl:fixnum
    :initform 0)
   (scanId
    :reader scanId
    :initarg :scanId
    :type cl:fixnum
    :initform 0)
   (yawRate
    :reader yawRate
    :initarg :yawRate
    :type cl:float
    :initform 0.0)
   (vehicleSpeedCalc
    :reader vehicleSpeedCalc
    :initarg :vehicleSpeedCalc
    :type cl:float
    :initform 0.0))
)

(cl:defclass EsrStatus1 (<EsrStatus1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus1> is deprecated: use delphi_esr_msgs-msg:EsrStatus1 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:timeStamp-val is deprecated.  Use delphi_esr_msgs-msg:timeStamp instead.")
  (timeStamp m))

(cl:ensure-generic-function 'rollingCount-val :lambda-list '(m))
(cl:defmethod rollingCount-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:rollingCount-val is deprecated.  Use delphi_esr_msgs-msg:rollingCount instead.")
  (rollingCount m))

(cl:ensure-generic-function 'commError-val :lambda-list '(m))
(cl:defmethod commError-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:commError-val is deprecated.  Use delphi_esr_msgs-msg:commError instead.")
  (commError m))

(cl:ensure-generic-function 'curvature-val :lambda-list '(m))
(cl:defmethod curvature-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:curvature-val is deprecated.  Use delphi_esr_msgs-msg:curvature instead.")
  (curvature m))

(cl:ensure-generic-function 'scanId-val :lambda-list '(m))
(cl:defmethod scanId-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:scanId-val is deprecated.  Use delphi_esr_msgs-msg:scanId instead.")
  (scanId m))

(cl:ensure-generic-function 'yawRate-val :lambda-list '(m))
(cl:defmethod yawRate-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:yawRate-val is deprecated.  Use delphi_esr_msgs-msg:yawRate instead.")
  (yawRate m))

(cl:ensure-generic-function 'vehicleSpeedCalc-val :lambda-list '(m))
(cl:defmethod vehicleSpeedCalc-val ((m <EsrStatus1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:vehicleSpeedCalc-val is deprecated.  Use delphi_esr_msgs-msg:vehicleSpeedCalc instead.")
  (vehicleSpeedCalc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus1>) ostream)
  "Serializes a message object of type '<EsrStatus1>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeStamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollingCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'commError) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'curvature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scanId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scanId)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yawRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vehicleSpeedCalc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus1>) istream)
  "Deserializes a message object of type '<EsrStatus1>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeStamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollingCount)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'commError) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'curvature) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scanId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scanId)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yawRate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vehicleSpeedCalc) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus1>)))
  "Returns string type for a message object of type '<EsrStatus1>"
  "delphi_esr_msgs/EsrStatus1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus1)))
  "Returns string type for a message object of type 'EsrStatus1"
  "delphi_esr_msgs/EsrStatus1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus1>)))
  "Returns md5sum for a message object of type '<EsrStatus1>"
  "2bab6477be87782f9154c54c75ec5117")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus1)))
  "Returns md5sum for a message object of type 'EsrStatus1"
  "2bab6477be87782f9154c54c75ec5117")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus1>)))
  "Returns full string definition for message of type '<EsrStatus1>"
  (cl:format cl:nil "Header header~%~%# ESR status1~%string      canmsg~%uint8       timeStamp~%uint8       rollingCount~%bool        commError~%int16       curvature~%uint16      scanId~%float32     yawRate~%float32     vehicleSpeedCalc~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus1)))
  "Returns full string definition for message of type 'EsrStatus1"
  (cl:format cl:nil "Header header~%~%# ESR status1~%string      canmsg~%uint8       timeStamp~%uint8       rollingCount~%bool        commError~%int16       curvature~%uint16      scanId~%float32     yawRate~%float32     vehicleSpeedCalc~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus1>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     1
     1
     1
     2
     2
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus1>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus1
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':timeStamp (timeStamp msg))
    (cl:cons ':rollingCount (rollingCount msg))
    (cl:cons ':commError (commError msg))
    (cl:cons ':curvature (curvature msg))
    (cl:cons ':scanId (scanId msg))
    (cl:cons ':yawRate (yawRate msg))
    (cl:cons ':vehicleSpeedCalc (vehicleSpeedCalc msg))
))
