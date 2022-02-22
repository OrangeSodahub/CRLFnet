; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarPreHeaderEncoderBlock.msg.html

(cl:defclass <RadarPreHeaderEncoderBlock> (roslisp-msg-protocol:ros-message)
  ((udiEncoderPos
    :reader udiEncoderPos
    :initarg :udiEncoderPos
    :type cl:integer
    :initform 0)
   (iEncoderSpeed
    :reader iEncoderSpeed
    :initarg :iEncoderSpeed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RadarPreHeaderEncoderBlock (<RadarPreHeaderEncoderBlock>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarPreHeaderEncoderBlock>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarPreHeaderEncoderBlock)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarPreHeaderEncoderBlock> is deprecated: use sick_scan-msg:RadarPreHeaderEncoderBlock instead.")))

(cl:ensure-generic-function 'udiEncoderPos-val :lambda-list '(m))
(cl:defmethod udiEncoderPos-val ((m <RadarPreHeaderEncoderBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:udiEncoderPos-val is deprecated.  Use sick_scan-msg:udiEncoderPos instead.")
  (udiEncoderPos m))

(cl:ensure-generic-function 'iEncoderSpeed-val :lambda-list '(m))
(cl:defmethod iEncoderSpeed-val ((m <RadarPreHeaderEncoderBlock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:iEncoderSpeed-val is deprecated.  Use sick_scan-msg:iEncoderSpeed instead.")
  (iEncoderSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarPreHeaderEncoderBlock>) ostream)
  "Serializes a message object of type '<RadarPreHeaderEncoderBlock>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiEncoderPos)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiEncoderPos)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiEncoderPos)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiEncoderPos)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'iEncoderSpeed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarPreHeaderEncoderBlock>) istream)
  "Deserializes a message object of type '<RadarPreHeaderEncoderBlock>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'udiEncoderPos)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'udiEncoderPos)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'udiEncoderPos)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'udiEncoderPos)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'iEncoderSpeed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarPreHeaderEncoderBlock>)))
  "Returns string type for a message object of type '<RadarPreHeaderEncoderBlock>"
  "sick_scan/RadarPreHeaderEncoderBlock")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarPreHeaderEncoderBlock)))
  "Returns string type for a message object of type 'RadarPreHeaderEncoderBlock"
  "sick_scan/RadarPreHeaderEncoderBlock")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarPreHeaderEncoderBlock>)))
  "Returns md5sum for a message object of type '<RadarPreHeaderEncoderBlock>"
  "5af720e8adc927dc42f34b3cd0d0e8e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarPreHeaderEncoderBlock)))
  "Returns md5sum for a message object of type 'RadarPreHeaderEncoderBlock"
  "5af720e8adc927dc42f34b3cd0d0e8e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarPreHeaderEncoderBlock>)))
  "Returns full string definition for message of type '<RadarPreHeaderEncoderBlock>"
  (cl:format cl:nil "# Array with connected encoder sensors~%uint32 udiEncoderPos  # encoder position [inc]~%int16 iEncoderSpeed   # encoder speed [inc/mm]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarPreHeaderEncoderBlock)))
  "Returns full string definition for message of type 'RadarPreHeaderEncoderBlock"
  (cl:format cl:nil "# Array with connected encoder sensors~%uint32 udiEncoderPos  # encoder position [inc]~%int16 iEncoderSpeed   # encoder speed [inc/mm]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarPreHeaderEncoderBlock>))
  (cl:+ 0
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarPreHeaderEncoderBlock>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarPreHeaderEncoderBlock
    (cl:cons ':udiEncoderPos (udiEncoderPos msg))
    (cl:cons ':iEncoderSpeed (iEncoderSpeed msg))
))
