; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarPreHeaderMeasurementParam1Block.msg.html

(cl:defclass <RadarPreHeaderMeasurementParam1Block> (roslisp-msg-protocol:ros-message)
  ((uiCycleDuration
    :reader uiCycleDuration
    :initarg :uiCycleDuration
    :type cl:integer
    :initform 0)
   (uiNoiseLevel
    :reader uiNoiseLevel
    :initarg :uiNoiseLevel
    :type cl:integer
    :initform 0))
)

(cl:defclass RadarPreHeaderMeasurementParam1Block (<RadarPreHeaderMeasurementParam1Block>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarPreHeaderMeasurementParam1Block>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarPreHeaderMeasurementParam1Block)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarPreHeaderMeasurementParam1Block> is deprecated: use sick_scan-msg:RadarPreHeaderMeasurementParam1Block instead.")))

(cl:ensure-generic-function 'uiCycleDuration-val :lambda-list '(m))
(cl:defmethod uiCycleDuration-val ((m <RadarPreHeaderMeasurementParam1Block>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiCycleDuration-val is deprecated.  Use sick_scan-msg:uiCycleDuration instead.")
  (uiCycleDuration m))

(cl:ensure-generic-function 'uiNoiseLevel-val :lambda-list '(m))
(cl:defmethod uiNoiseLevel-val ((m <RadarPreHeaderMeasurementParam1Block>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiNoiseLevel-val is deprecated.  Use sick_scan-msg:uiNoiseLevel instead.")
  (uiNoiseLevel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarPreHeaderMeasurementParam1Block>) ostream)
  "Serializes a message object of type '<RadarPreHeaderMeasurementParam1Block>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiCycleDuration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiCycleDuration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiCycleDuration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiCycleDuration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiNoiseLevel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiNoiseLevel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiNoiseLevel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiNoiseLevel)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarPreHeaderMeasurementParam1Block>) istream)
  "Deserializes a message object of type '<RadarPreHeaderMeasurementParam1Block>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiCycleDuration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiCycleDuration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiCycleDuration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiCycleDuration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiNoiseLevel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiNoiseLevel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiNoiseLevel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiNoiseLevel)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarPreHeaderMeasurementParam1Block>)))
  "Returns string type for a message object of type '<RadarPreHeaderMeasurementParam1Block>"
  "sick_scan/RadarPreHeaderMeasurementParam1Block")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarPreHeaderMeasurementParam1Block)))
  "Returns string type for a message object of type 'RadarPreHeaderMeasurementParam1Block"
  "sick_scan/RadarPreHeaderMeasurementParam1Block")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarPreHeaderMeasurementParam1Block>)))
  "Returns md5sum for a message object of type '<RadarPreHeaderMeasurementParam1Block>"
  "34fa13bb693fa69fead0a46da987eb62")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarPreHeaderMeasurementParam1Block)))
  "Returns md5sum for a message object of type 'RadarPreHeaderMeasurementParam1Block"
  "34fa13bb693fa69fead0a46da987eb62")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarPreHeaderMeasurementParam1Block>)))
  "Returns full string definition for message of type '<RadarPreHeaderMeasurementParam1Block>"
  (cl:format cl:nil "uint32 uiCycleDuration # Time in microseconds to detect this items~%uint32 uiNoiseLevel # [1/100dB]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarPreHeaderMeasurementParam1Block)))
  "Returns full string definition for message of type 'RadarPreHeaderMeasurementParam1Block"
  (cl:format cl:nil "uint32 uiCycleDuration # Time in microseconds to detect this items~%uint32 uiNoiseLevel # [1/100dB]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarPreHeaderMeasurementParam1Block>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarPreHeaderMeasurementParam1Block>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarPreHeaderMeasurementParam1Block
    (cl:cons ':uiCycleDuration (uiCycleDuration msg))
    (cl:cons ':uiNoiseLevel (uiNoiseLevel msg))
))
