; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarPreHeaderDeviceBlock.msg.html

(cl:defclass <RadarPreHeaderDeviceBlock> (roslisp-msg-protocol:ros-message)
  ((uiIdent
    :reader uiIdent
    :initarg :uiIdent
    :type cl:integer
    :initform 0)
   (udiSerialNo
    :reader udiSerialNo
    :initarg :udiSerialNo
    :type cl:integer
    :initform 0)
   (bDeviceError
    :reader bDeviceError
    :initarg :bDeviceError
    :type cl:boolean
    :initform cl:nil)
   (bContaminationWarning
    :reader bContaminationWarning
    :initarg :bContaminationWarning
    :type cl:boolean
    :initform cl:nil)
   (bContaminationError
    :reader bContaminationError
    :initarg :bContaminationError
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RadarPreHeaderDeviceBlock (<RadarPreHeaderDeviceBlock>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarPreHeaderDeviceBlock>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarPreHeaderDeviceBlock)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarPreHeaderDeviceBlock> is deprecated: use sick_scan-msg:RadarPreHeaderDeviceBlock instead.")))

(cl:ensure-generic-function 'uiIdent-val :lambda-list '(m))
(cl:defmethod uiIdent-val ((m <RadarPreHeaderDeviceBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:uiIdent-val is deprecated.  Use sick_scan-msg:uiIdent instead.")
  (uiIdent m))

(cl:ensure-generic-function 'udiSerialNo-val :lambda-list '(m))
(cl:defmethod udiSerialNo-val ((m <RadarPreHeaderDeviceBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:udiSerialNo-val is deprecated.  Use sick_scan-msg:udiSerialNo instead.")
  (udiSerialNo m))

(cl:ensure-generic-function 'bDeviceError-val :lambda-list '(m))
(cl:defmethod bDeviceError-val ((m <RadarPreHeaderDeviceBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:bDeviceError-val is deprecated.  Use sick_scan-msg:bDeviceError instead.")
  (bDeviceError m))

(cl:ensure-generic-function 'bContaminationWarning-val :lambda-list '(m))
(cl:defmethod bContaminationWarning-val ((m <RadarPreHeaderDeviceBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:bContaminationWarning-val is deprecated.  Use sick_scan-msg:bContaminationWarning instead.")
  (bContaminationWarning m))

(cl:ensure-generic-function 'bContaminationError-val :lambda-list '(m))
(cl:defmethod bContaminationError-val ((m <RadarPreHeaderDeviceBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:bContaminationError-val is deprecated.  Use sick_scan-msg:bContaminationError instead.")
  (bContaminationError m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarPreHeaderDeviceBlock>) ostream)
  "Serializes a message object of type '<RadarPreHeaderDeviceBlock>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiIdent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiIdent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiIdent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiIdent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiSerialNo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiSerialNo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiSerialNo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiSerialNo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bDeviceError) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bContaminationWarning) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bContaminationError) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarPreHeaderDeviceBlock>) istream)
  "Deserializes a message object of type '<RadarPreHeaderDeviceBlock>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uiIdent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uiIdent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uiIdent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uiIdent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiSerialNo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiSerialNo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiSerialNo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiSerialNo)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bDeviceError) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'bContaminationWarning) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'bContaminationError) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarPreHeaderDeviceBlock>)))
  "Returns string type for a message object of type '<RadarPreHeaderDeviceBlock>"
  "sick_scan/RadarPreHeaderDeviceBlock")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarPreHeaderDeviceBlock)))
  "Returns string type for a message object of type 'RadarPreHeaderDeviceBlock"
  "sick_scan/RadarPreHeaderDeviceBlock")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarPreHeaderDeviceBlock>)))
  "Returns md5sum for a message object of type '<RadarPreHeaderDeviceBlock>"
  "8c1dc3fa07dfb079c66dfaa39765f5a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarPreHeaderDeviceBlock)))
  "Returns md5sum for a message object of type 'RadarPreHeaderDeviceBlock"
  "8c1dc3fa07dfb079c66dfaa39765f5a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarPreHeaderDeviceBlock>)))
  "Returns full string definition for message of type '<RadarPreHeaderDeviceBlock>"
  (cl:format cl:nil "#~%#~%#~%#~%~%# Logical number of the device\"~%uint32 uiIdent~%# Serial number of the device~%uint32 udiSerialNo~%# State of the device~%bool bDeviceError~%# Contamination Warning~%bool bContaminationWarning~%# Contamination Error~%bool bContaminationError~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarPreHeaderDeviceBlock)))
  "Returns full string definition for message of type 'RadarPreHeaderDeviceBlock"
  (cl:format cl:nil "#~%#~%#~%#~%~%# Logical number of the device\"~%uint32 uiIdent~%# Serial number of the device~%uint32 udiSerialNo~%# State of the device~%bool bDeviceError~%# Contamination Warning~%bool bContaminationWarning~%# Contamination Error~%bool bContaminationError~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarPreHeaderDeviceBlock>))
  (cl:+ 0
     4
     4
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarPreHeaderDeviceBlock>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarPreHeaderDeviceBlock
    (cl:cons ':uiIdent (uiIdent msg))
    (cl:cons ':udiSerialNo (udiSerialNo msg))
    (cl:cons ':bDeviceError (bDeviceError msg))
    (cl:cons ':bContaminationWarning (bContaminationWarning msg))
    (cl:cons ':bContaminationError (bContaminationError msg))
))
