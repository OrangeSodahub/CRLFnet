; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarPreHeader.msg.html

(cl:defclass <RadarPreHeader> (roslisp-msg-protocol:ros-message)
  ((uiVersionNo
    :reader uiVersionNo
    :initarg :uiVersionNo
    :type cl:fixnum
    :initform 0)
   (radarPreHeaderDeviceBlock
    :reader radarPreHeaderDeviceBlock
    :initarg :radarPreHeaderDeviceBlock
    :type sick_scan-msg:RadarPreHeaderDeviceBlock
    :initform (cl:make-instance 'sick_scan-msg:RadarPreHeaderDeviceBlock))
   (radarPreHeaderStatusBlock
    :reader radarPreHeaderStatusBlock
    :initarg :radarPreHeaderStatusBlock
    :type sick_scan-msg:RadarPreHeaderStatusBlock
    :initform (cl:make-instance 'sick_scan-msg:RadarPreHeaderStatusBlock))
   (radarPreHeaderMeasurementParam1Block
    :reader radarPreHeaderMeasurementParam1Block
    :initarg :radarPreHeaderMeasurementParam1Block
    :type sick_scan-msg:RadarPreHeaderMeasurementParam1Block
    :initform (cl:make-instance 'sick_scan-msg:RadarPreHeaderMeasurementParam1Block))
   (radarPreHeaderArrayEncoderBlock
    :reader radarPreHeaderArrayEncoderBlock
    :initarg :radarPreHeaderArrayEncoderBlock
    :type (cl:vector sick_scan-msg:RadarPreHeaderEncoderBlock)
   :initform (cl:make-array 0 :element-type 'sick_scan-msg:RadarPreHeaderEncoderBlock :initial-element (cl:make-instance 'sick_scan-msg:RadarPreHeaderEncoderBlock))))
)

(cl:defclass RadarPreHeader (<RadarPreHeader>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarPreHeader>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarPreHeader)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarPreHeader> is deprecated: use sick_scan-msg:RadarPreHeader instead.")))

(cl:ensure-generic-function 'uiVersionNo-val :lambda-list '(m))
(cl:defmethod uiVersionNo-val ((m <RadarPreHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiVersionNo-val is deprecated.  Use sick_scan-msg:uiVersionNo instead.")
  (uiVersionNo m))

(cl:ensure-generic-function 'radarPreHeaderDeviceBlock-val :lambda-list '(m))
(cl:defmethod radarPreHeaderDeviceBlock-val ((m <RadarPreHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:radarPreHeaderDeviceBlock-val is deprecated.  Use sick_scan-msg:radarPreHeaderDeviceBlock instead.")
  (radarPreHeaderDeviceBlock m))

(cl:ensure-generic-function 'radarPreHeaderStatusBlock-val :lambda-list '(m))
(cl:defmethod radarPreHeaderStatusBlock-val ((m <RadarPreHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:radarPreHeaderStatusBlock-val is deprecated.  Use sick_scan-msg:radarPreHeaderStatusBlock instead.")
  (radarPreHeaderStatusBlock m))

(cl:ensure-generic-function 'radarPreHeaderMeasurementParam1Block-val :lambda-list '(m))
(cl:defmethod radarPreHeaderMeasurementParam1Block-val ((m <RadarPreHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:radarPreHeaderMeasurementParam1Block-val is deprecated.  Use sick_scan-msg:radarPreHeaderMeasurementParam1Block instead.")
  (radarPreHeaderMeasurementParam1Block m))

(cl:ensure-generic-function 'radarPreHeaderArrayEncoderBlock-val :lambda-list '(m))
(cl:defmethod radarPreHeaderArrayEncoderBlock-val ((m <RadarPreHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:radarPreHeaderArrayEncoderBlock-val is deprecated.  Use sick_scan-msg:radarPreHeaderArrayEncoderBlock instead.")
  (radarPreHeaderArrayEncoderBlock m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarPreHeader>) ostream)
  "Serializes a message object of type '<RadarPreHeader>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiVersionNo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiVersionNo)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'radarPreHeaderDeviceBlock) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'radarPreHeaderStatusBlock) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'radarPreHeaderMeasurementParam1Block) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'radarPreHeaderArrayEncoderBlock))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'radarPreHeaderArrayEncoderBlock))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarPreHeader>) istream)
  "Deserializes a message object of type '<RadarPreHeader>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiVersionNo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiVersionNo)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'radarPreHeaderDeviceBlock) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'radarPreHeaderStatusBlock) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'radarPreHeaderMeasurementParam1Block) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'radarPreHeaderArrayEncoderBlock) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'radarPreHeaderArrayEncoderBlock)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sick_scan-msg:RadarPreHeaderEncoderBlock))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarPreHeader>)))
  "Returns string type for a message object of type '<RadarPreHeader>"
  "sick_scan/RadarPreHeader")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarPreHeader)))
  "Returns string type for a message object of type 'RadarPreHeader"
  "sick_scan/RadarPreHeader")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarPreHeader>)))
  "Returns md5sum for a message object of type '<RadarPreHeader>"
  "2b96d942f26bd5b00da7e631bf199685")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarPreHeader)))
  "Returns md5sum for a message object of type 'RadarPreHeader"
  "2b96d942f26bd5b00da7e631bf199685")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarPreHeader>)))
  "Returns full string definition for message of type '<RadarPreHeader>"
  (cl:format cl:nil "# Version information for this whole structure (MeasurementData)~%uint16 uiVersionNo~%sick_scan/RadarPreHeaderDeviceBlock radarPreHeaderDeviceBlock~%sick_scan/RadarPreHeaderStatusBlock radarPreHeaderStatusBlock~%sick_scan/RadarPreHeaderMeasurementParam1Block radarPreHeaderMeasurementParam1Block~%sick_scan/RadarPreHeaderEncoderBlock[] radarPreHeaderArrayEncoderBlock~%~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderDeviceBlock~%#~%#~%#~%#~%~%# Logical number of the device\"~%uint32 uiIdent~%# Serial number of the device~%uint32 udiSerialNo~%# State of the device~%bool bDeviceError~%# Contamination Warning~%bool bContaminationWarning~%# Contamination Error~%bool bContaminationError~%================================================================================~%MSG: sick_scan/RadarPreHeaderStatusBlock~%#~%#~%#~%uint32 uiTelegramCount # telegram number~%uint32 uiCycleCount # \"scan number\"~%uint32 udiSystemCountScan # system time since power on of scan gen. [us]~%uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]~%uint16 uiInputs # state of digital inputs~%uint16 uiOutputs # state of digital outputs~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderMeasurementParam1Block~%uint32 uiCycleDuration # Time in microseconds to detect this items~%uint32 uiNoiseLevel # [1/100dB]~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderEncoderBlock~%# Array with connected encoder sensors~%uint32 udiEncoderPos  # encoder position [inc]~%int16 iEncoderSpeed   # encoder speed [inc/mm]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarPreHeader)))
  "Returns full string definition for message of type 'RadarPreHeader"
  (cl:format cl:nil "# Version information for this whole structure (MeasurementData)~%uint16 uiVersionNo~%sick_scan/RadarPreHeaderDeviceBlock radarPreHeaderDeviceBlock~%sick_scan/RadarPreHeaderStatusBlock radarPreHeaderStatusBlock~%sick_scan/RadarPreHeaderMeasurementParam1Block radarPreHeaderMeasurementParam1Block~%sick_scan/RadarPreHeaderEncoderBlock[] radarPreHeaderArrayEncoderBlock~%~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderDeviceBlock~%#~%#~%#~%#~%~%# Logical number of the device\"~%uint32 uiIdent~%# Serial number of the device~%uint32 udiSerialNo~%# State of the device~%bool bDeviceError~%# Contamination Warning~%bool bContaminationWarning~%# Contamination Error~%bool bContaminationError~%================================================================================~%MSG: sick_scan/RadarPreHeaderStatusBlock~%#~%#~%#~%uint32 uiTelegramCount # telegram number~%uint32 uiCycleCount # \"scan number\"~%uint32 udiSystemCountScan # system time since power on of scan gen. [us]~%uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]~%uint16 uiInputs # state of digital inputs~%uint16 uiOutputs # state of digital outputs~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderMeasurementParam1Block~%uint32 uiCycleDuration # Time in microseconds to detect this items~%uint32 uiNoiseLevel # [1/100dB]~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderEncoderBlock~%# Array with connected encoder sensors~%uint32 udiEncoderPos  # encoder position [inc]~%int16 iEncoderSpeed   # encoder speed [inc/mm]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarPreHeader>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'radarPreHeaderDeviceBlock))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'radarPreHeaderStatusBlock))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'radarPreHeaderMeasurementParam1Block))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'radarPreHeaderArrayEncoderBlock) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarPreHeader>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarPreHeader
    (cl:cons ':uiVersionNo (uiVersionNo msg))
    (cl:cons ':radarPreHeaderDeviceBlock (radarPreHeaderDeviceBlock msg))
    (cl:cons ':radarPreHeaderStatusBlock (radarPreHeaderStatusBlock msg))
    (cl:cons ':radarPreHeaderMeasurementParam1Block (radarPreHeaderMeasurementParam1Block msg))
    (cl:cons ':radarPreHeaderArrayEncoderBlock (radarPreHeaderArrayEncoderBlock msg))
))
