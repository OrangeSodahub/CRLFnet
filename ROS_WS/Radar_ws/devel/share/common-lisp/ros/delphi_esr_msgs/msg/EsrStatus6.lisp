; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus6.msg.html

(cl:defclass <EsrStatus6> (roslisp-msg-protocol:ros-message)
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
   (supply1P8V
    :reader supply1P8V
    :initarg :supply1P8V
    :type cl:fixnum
    :initform 0)
   (supplyN5V
    :reader supplyN5V
    :initarg :supplyN5V
    :type cl:fixnum
    :initform 0)
   (waveDiffA2D
    :reader waveDiffA2D
    :initarg :waveDiffA2D
    :type cl:fixnum
    :initform 0)
   (swVersionDSP3rdByte
    :reader swVersionDSP3rdByte
    :initarg :swVersionDSP3rdByte
    :type cl:fixnum
    :initform 0)
   (verticalAlginUpdated
    :reader verticalAlginUpdated
    :initarg :verticalAlginUpdated
    :type cl:boolean
    :initform cl:nil)
   (systemPowerMode
    :reader systemPowerMode
    :initarg :systemPowerMode
    :type cl:fixnum
    :initform 0)
   (foundTarget
    :reader foundTarget
    :initarg :foundTarget
    :type cl:boolean
    :initform cl:nil)
   (recommendUnconverge
    :reader recommendUnconverge
    :initarg :recommendUnconverge
    :type cl:boolean
    :initform cl:nil)
   (factoryAlginStatus1
    :reader factoryAlginStatus1
    :initarg :factoryAlginStatus1
    :type cl:fixnum
    :initform 0)
   (factoryAlginStatus2
    :reader factoryAlginStatus2
    :initarg :factoryAlginStatus2
    :type cl:fixnum
    :initform 0)
   (factoryMisAlginment
    :reader factoryMisAlginment
    :initarg :factoryMisAlginment
    :type cl:float
    :initform 0.0)
   (servAlginUpdatesDone
    :reader servAlginUpdatesDone
    :initarg :servAlginUpdatesDone
    :type cl:fixnum
    :initform 0)
   (verticalMisAlginment
    :reader verticalMisAlginment
    :initarg :verticalMisAlginment
    :type cl:float
    :initform 0.0))
)

(cl:defclass EsrStatus6 (<EsrStatus6>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus6>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus6)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus6> is deprecated: use delphi_esr_msgs-msg:EsrStatus6 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'supply1P8V-val :lambda-list '(m))
(cl:defmethod supply1P8V-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:supply1P8V-val is deprecated.  Use delphi_esr_msgs-msg:supply1P8V instead.")
  (supply1P8V m))

(cl:ensure-generic-function 'supplyN5V-val :lambda-list '(m))
(cl:defmethod supplyN5V-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:supplyN5V-val is deprecated.  Use delphi_esr_msgs-msg:supplyN5V instead.")
  (supplyN5V m))

(cl:ensure-generic-function 'waveDiffA2D-val :lambda-list '(m))
(cl:defmethod waveDiffA2D-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:waveDiffA2D-val is deprecated.  Use delphi_esr_msgs-msg:waveDiffA2D instead.")
  (waveDiffA2D m))

(cl:ensure-generic-function 'swVersionDSP3rdByte-val :lambda-list '(m))
(cl:defmethod swVersionDSP3rdByte-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:swVersionDSP3rdByte-val is deprecated.  Use delphi_esr_msgs-msg:swVersionDSP3rdByte instead.")
  (swVersionDSP3rdByte m))

(cl:ensure-generic-function 'verticalAlginUpdated-val :lambda-list '(m))
(cl:defmethod verticalAlginUpdated-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:verticalAlginUpdated-val is deprecated.  Use delphi_esr_msgs-msg:verticalAlginUpdated instead.")
  (verticalAlginUpdated m))

(cl:ensure-generic-function 'systemPowerMode-val :lambda-list '(m))
(cl:defmethod systemPowerMode-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:systemPowerMode-val is deprecated.  Use delphi_esr_msgs-msg:systemPowerMode instead.")
  (systemPowerMode m))

(cl:ensure-generic-function 'foundTarget-val :lambda-list '(m))
(cl:defmethod foundTarget-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:foundTarget-val is deprecated.  Use delphi_esr_msgs-msg:foundTarget instead.")
  (foundTarget m))

(cl:ensure-generic-function 'recommendUnconverge-val :lambda-list '(m))
(cl:defmethod recommendUnconverge-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:recommendUnconverge-val is deprecated.  Use delphi_esr_msgs-msg:recommendUnconverge instead.")
  (recommendUnconverge m))

(cl:ensure-generic-function 'factoryAlginStatus1-val :lambda-list '(m))
(cl:defmethod factoryAlginStatus1-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:factoryAlginStatus1-val is deprecated.  Use delphi_esr_msgs-msg:factoryAlginStatus1 instead.")
  (factoryAlginStatus1 m))

(cl:ensure-generic-function 'factoryAlginStatus2-val :lambda-list '(m))
(cl:defmethod factoryAlginStatus2-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:factoryAlginStatus2-val is deprecated.  Use delphi_esr_msgs-msg:factoryAlginStatus2 instead.")
  (factoryAlginStatus2 m))

(cl:ensure-generic-function 'factoryMisAlginment-val :lambda-list '(m))
(cl:defmethod factoryMisAlginment-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:factoryMisAlginment-val is deprecated.  Use delphi_esr_msgs-msg:factoryMisAlginment instead.")
  (factoryMisAlginment m))

(cl:ensure-generic-function 'servAlginUpdatesDone-val :lambda-list '(m))
(cl:defmethod servAlginUpdatesDone-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:servAlginUpdatesDone-val is deprecated.  Use delphi_esr_msgs-msg:servAlginUpdatesDone instead.")
  (servAlginUpdatesDone m))

(cl:ensure-generic-function 'verticalMisAlginment-val :lambda-list '(m))
(cl:defmethod verticalMisAlginment-val ((m <EsrStatus6>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:verticalMisAlginment-val is deprecated.  Use delphi_esr_msgs-msg:verticalMisAlginment instead.")
  (verticalMisAlginment m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus6>) ostream)
  "Serializes a message object of type '<EsrStatus6>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply1P8V)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supplyN5V)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'waveDiffA2D)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swVersionDSP3rdByte)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'verticalAlginUpdated) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemPowerMode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'foundTarget) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'recommendUnconverge) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'factoryAlginStatus1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'factoryAlginStatus2)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'factoryMisAlginment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servAlginUpdatesDone)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'verticalMisAlginment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus6>) istream)
  "Deserializes a message object of type '<EsrStatus6>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supply1P8V)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supplyN5V)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'waveDiffA2D)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swVersionDSP3rdByte)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'verticalAlginUpdated) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemPowerMode)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'foundTarget) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'recommendUnconverge) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'factoryAlginStatus1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'factoryAlginStatus2)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'factoryMisAlginment) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servAlginUpdatesDone)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'verticalMisAlginment) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus6>)))
  "Returns string type for a message object of type '<EsrStatus6>"
  "delphi_esr_msgs/EsrStatus6")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus6)))
  "Returns string type for a message object of type 'EsrStatus6"
  "delphi_esr_msgs/EsrStatus6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus6>)))
  "Returns md5sum for a message object of type '<EsrStatus6>"
  "fab6045bfaa2bc768f235e17159502ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus6)))
  "Returns md5sum for a message object of type 'EsrStatus6"
  "fab6045bfaa2bc768f235e17159502ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus6>)))
  "Returns full string definition for message of type '<EsrStatus6>"
  (cl:format cl:nil "Header header~%~%# ESR status6~%string      canmsg~%uint8       supply1P8V~%uint8       supplyN5V~%uint8       waveDiffA2D~%uint8       swVersionDSP3rdByte~%bool        verticalAlginUpdated~%uint8       systemPowerMode~%bool        foundTarget~%bool        recommendUnconverge~%uint8       factoryAlginStatus1~%uint8       factoryAlginStatus2~%float32     factoryMisAlginment~%uint8       servAlginUpdatesDone~%float32     verticalMisAlginment~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus6)))
  "Returns full string definition for message of type 'EsrStatus6"
  (cl:format cl:nil "Header header~%~%# ESR status6~%string      canmsg~%uint8       supply1P8V~%uint8       supplyN5V~%uint8       waveDiffA2D~%uint8       swVersionDSP3rdByte~%bool        verticalAlginUpdated~%uint8       systemPowerMode~%bool        foundTarget~%bool        recommendUnconverge~%uint8       factoryAlginStatus1~%uint8       factoryAlginStatus2~%float32     factoryMisAlginment~%uint8       servAlginUpdatesDone~%float32     verticalMisAlginment~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus6>))
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
     1
     1
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus6>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus6
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':supply1P8V (supply1P8V msg))
    (cl:cons ':supplyN5V (supplyN5V msg))
    (cl:cons ':waveDiffA2D (waveDiffA2D msg))
    (cl:cons ':swVersionDSP3rdByte (swVersionDSP3rdByte msg))
    (cl:cons ':verticalAlginUpdated (verticalAlginUpdated msg))
    (cl:cons ':systemPowerMode (systemPowerMode msg))
    (cl:cons ':foundTarget (foundTarget msg))
    (cl:cons ':recommendUnconverge (recommendUnconverge msg))
    (cl:cons ':factoryAlginStatus1 (factoryAlginStatus1 msg))
    (cl:cons ':factoryAlginStatus2 (factoryAlginStatus2 msg))
    (cl:cons ':factoryMisAlginment (factoryMisAlginment msg))
    (cl:cons ':servAlginUpdatesDone (servAlginUpdatesDone msg))
    (cl:cons ':verticalMisAlginment (verticalMisAlginment msg))
))
