; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarPreHeaderStatusBlock.msg.html

(cl:defclass <RadarPreHeaderStatusBlock> (roslisp-msg-protocol:ros-message)
  ((uiTelegramCount
    :reader uiTelegramCount
    :initarg :uiTelegramCount
    :type cl:integer
    :initform 0)
   (uiCycleCount
    :reader uiCycleCount
    :initarg :uiCycleCount
    :type cl:integer
    :initform 0)
   (udiSystemCountScan
    :reader udiSystemCountScan
    :initarg :udiSystemCountScan
    :type cl:integer
    :initform 0)
   (udiSystemCountTransmit
    :reader udiSystemCountTransmit
    :initarg :udiSystemCountTransmit
    :type cl:integer
    :initform 0)
   (uiInputs
    :reader uiInputs
    :initarg :uiInputs
    :type cl:fixnum
    :initform 0)
   (uiOutputs
    :reader uiOutputs
    :initarg :uiOutputs
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RadarPreHeaderStatusBlock (<RadarPreHeaderStatusBlock>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarPreHeaderStatusBlock>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarPreHeaderStatusBlock)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarPreHeaderStatusBlock> is deprecated: use sick_scan-msg:RadarPreHeaderStatusBlock instead.")))

(cl:ensure-generic-function 'uiTelegramCount-val :lambda-list '(m))
(cl:defmethod uiTelegramCount-val ((m <RadarPreHeaderStatusBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiTelegramCount-val is deprecated.  Use sick_scan-msg:uiTelegramCount instead.")
  (uiTelegramCount m))

(cl:ensure-generic-function 'uiCycleCount-val :lambda-list '(m))
(cl:defmethod uiCycleCount-val ((m <RadarPreHeaderStatusBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiCycleCount-val is deprecated.  Use sick_scan-msg:uiCycleCount instead.")
  (uiCycleCount m))

(cl:ensure-generic-function 'udiSystemCountScan-val :lambda-list '(m))
(cl:defmethod udiSystemCountScan-val ((m <RadarPreHeaderStatusBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:udiSystemCountScan-val is deprecated.  Use sick_scan-msg:udiSystemCountScan instead.")
  (udiSystemCountScan m))

(cl:ensure-generic-function 'udiSystemCountTransmit-val :lambda-list '(m))
(cl:defmethod udiSystemCountTransmit-val ((m <RadarPreHeaderStatusBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:udiSystemCountTransmit-val is deprecated.  Use sick_scan-msg:udiSystemCountTransmit instead.")
  (udiSystemCountTransmit m))

(cl:ensure-generic-function 'uiInputs-val :lambda-list '(m))
(cl:defmethod uiInputs-val ((m <RadarPreHeaderStatusBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiInputs-val is deprecated.  Use sick_scan-msg:uiInputs instead.")
  (uiInputs m))

(cl:ensure-generic-function 'uiOutputs-val :lambda-list '(m))
(cl:defmethod uiOutputs-val ((m <RadarPreHeaderStatusBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiOutputs-val is deprecated.  Use sick_scan-msg:uiOutputs instead.")
  (uiOutputs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarPreHeaderStatusBlock>) ostream)
  "Serializes a message object of type '<RadarPreHeaderStatusBlock>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiTelegramCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiTelegramCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiTelegramCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiTelegramCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiCycleCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiCycleCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiCycleCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiCycleCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiSystemCountScan)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiSystemCountScan)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiSystemCountScan)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiSystemCountScan)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiSystemCountTransmit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiSystemCountTransmit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiSystemCountTransmit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiSystemCountTransmit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiInputs)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiInputs)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiOutputs)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiOutputs)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarPreHeaderStatusBlock>) istream)
  "Deserializes a message object of type '<RadarPreHeaderStatusBlock>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiTelegramCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiTelegramCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiTelegramCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiTelegramCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiCycleCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiCycleCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiCycleCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiCycleCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiSystemCountScan)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiSystemCountScan)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiSystemCountScan)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiSystemCountScan)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiSystemCountTransmit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiSystemCountTransmit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiSystemCountTransmit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiSystemCountTransmit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiInputs)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiInputs)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiOutputs)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiOutputs)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarPreHeaderStatusBlock>)))
  "Returns string type for a message object of type '<RadarPreHeaderStatusBlock>"
  "sick_scan/RadarPreHeaderStatusBlock")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarPreHeaderStatusBlock)))
  "Returns string type for a message object of type 'RadarPreHeaderStatusBlock"
  "sick_scan/RadarPreHeaderStatusBlock")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarPreHeaderStatusBlock>)))
  "Returns md5sum for a message object of type '<RadarPreHeaderStatusBlock>"
  "fa00447ba5857e64792524ca30b37274")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarPreHeaderStatusBlock)))
  "Returns md5sum for a message object of type 'RadarPreHeaderStatusBlock"
  "fa00447ba5857e64792524ca30b37274")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarPreHeaderStatusBlock>)))
  "Returns full string definition for message of type '<RadarPreHeaderStatusBlock>"
  (cl:format cl:nil "#~%#~%#~%uint32 uiTelegramCount # telegram number~%uint32 uiCycleCount # \"scan number\"~%uint32 udiSystemCountScan # system time since power on of scan gen. [us]~%uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]~%uint16 uiInputs # state of digital inputs~%uint16 uiOutputs # state of digital outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarPreHeaderStatusBlock)))
  "Returns full string definition for message of type 'RadarPreHeaderStatusBlock"
  (cl:format cl:nil "#~%#~%#~%uint32 uiTelegramCount # telegram number~%uint32 uiCycleCount # \"scan number\"~%uint32 udiSystemCountScan # system time since power on of scan gen. [us]~%uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]~%uint16 uiInputs # state of digital inputs~%uint16 uiOutputs # state of digital outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarPreHeaderStatusBlock>))
  (cl:+ 0
     4
     4
     4
     4
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarPreHeaderStatusBlock>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarPreHeaderStatusBlock
    (cl:cons ':uiTelegramCount (uiTelegramCount msg))
    (cl:cons ':uiCycleCount (uiCycleCount msg))
    (cl:cons ':udiSystemCountScan (udiSystemCountScan msg))
    (cl:cons ':udiSystemCountTransmit (udiSystemCountTransmit msg))
    (cl:cons ':uiInputs (uiInputs msg))
    (cl:cons ':uiOutputs (uiOutputs msg))
))
