; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrStatus4.msg.html

(cl:defclass <EsrStatus4> (roslisp-msg-protocol:ros-message)
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
   (rollingCount3
    :reader rollingCount3
    :initarg :rollingCount3
    :type cl:fixnum
    :initform 0)
   (mrlrMode
    :reader mrlrMode
    :initarg :mrlrMode
    :type cl:fixnum
    :initform 0)
   (patialBlockage
    :reader patialBlockage
    :initarg :patialBlockage
    :type cl:boolean
    :initform cl:nil)
   (sideLobeBlockage
    :reader sideLobeBlockage
    :initarg :sideLobeBlockage
    :type cl:boolean
    :initform cl:nil)
   (lrOnlyGratingLobeDet
    :reader lrOnlyGratingLobeDet
    :initarg :lrOnlyGratingLobeDet
    :type cl:boolean
    :initform cl:nil)
   (truckTargetDet
    :reader truckTargetDet
    :initarg :truckTargetDet
    :type cl:boolean
    :initform cl:nil)
   (pathIdAcc
    :reader pathIdAcc
    :initarg :pathIdAcc
    :type cl:fixnum
    :initform 0)
   (pathIdCmmbMove
    :reader pathIdCmmbMove
    :initarg :pathIdCmmbMove
    :type cl:fixnum
    :initform 0)
   (pathIdCmmbStat
    :reader pathIdCmmbStat
    :initarg :pathIdCmmbStat
    :type cl:fixnum
    :initform 0)
   (pathIdFcwMove
    :reader pathIdFcwMove
    :initarg :pathIdFcwMove
    :type cl:fixnum
    :initform 0)
   (pathIdFcwStat
    :reader pathIdFcwStat
    :initarg :pathIdFcwStat
    :type cl:fixnum
    :initform 0)
   (pathIdAccStat
    :reader pathIdAccStat
    :initarg :pathIdAccStat
    :type cl:fixnum
    :initform 0)
   (autoAlginAngle
    :reader autoAlginAngle
    :initarg :autoAlginAngle
    :type cl:float
    :initform 0.0))
)

(cl:defclass EsrStatus4 (<EsrStatus4>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrStatus4>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrStatus4)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrStatus4> is deprecated: use delphi_esr_msgs-msg:EsrStatus4 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'rollingCount3-val :lambda-list '(m))
(cl:defmethod rollingCount3-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:rollingCount3-val is deprecated.  Use delphi_esr_msgs-msg:rollingCount3 instead.")
  (rollingCount3 m))

(cl:ensure-generic-function 'mrlrMode-val :lambda-list '(m))
(cl:defmethod mrlrMode-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mrlrMode-val is deprecated.  Use delphi_esr_msgs-msg:mrlrMode instead.")
  (mrlrMode m))

(cl:ensure-generic-function 'patialBlockage-val :lambda-list '(m))
(cl:defmethod patialBlockage-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:patialBlockage-val is deprecated.  Use delphi_esr_msgs-msg:patialBlockage instead.")
  (patialBlockage m))

(cl:ensure-generic-function 'sideLobeBlockage-val :lambda-list '(m))
(cl:defmethod sideLobeBlockage-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:sideLobeBlockage-val is deprecated.  Use delphi_esr_msgs-msg:sideLobeBlockage instead.")
  (sideLobeBlockage m))

(cl:ensure-generic-function 'lrOnlyGratingLobeDet-val :lambda-list '(m))
(cl:defmethod lrOnlyGratingLobeDet-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lrOnlyGratingLobeDet-val is deprecated.  Use delphi_esr_msgs-msg:lrOnlyGratingLobeDet instead.")
  (lrOnlyGratingLobeDet m))

(cl:ensure-generic-function 'truckTargetDet-val :lambda-list '(m))
(cl:defmethod truckTargetDet-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:truckTargetDet-val is deprecated.  Use delphi_esr_msgs-msg:truckTargetDet instead.")
  (truckTargetDet m))

(cl:ensure-generic-function 'pathIdAcc-val :lambda-list '(m))
(cl:defmethod pathIdAcc-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIdAcc-val is deprecated.  Use delphi_esr_msgs-msg:pathIdAcc instead.")
  (pathIdAcc m))

(cl:ensure-generic-function 'pathIdCmmbMove-val :lambda-list '(m))
(cl:defmethod pathIdCmmbMove-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIdCmmbMove-val is deprecated.  Use delphi_esr_msgs-msg:pathIdCmmbMove instead.")
  (pathIdCmmbMove m))

(cl:ensure-generic-function 'pathIdCmmbStat-val :lambda-list '(m))
(cl:defmethod pathIdCmmbStat-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIdCmmbStat-val is deprecated.  Use delphi_esr_msgs-msg:pathIdCmmbStat instead.")
  (pathIdCmmbStat m))

(cl:ensure-generic-function 'pathIdFcwMove-val :lambda-list '(m))
(cl:defmethod pathIdFcwMove-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIdFcwMove-val is deprecated.  Use delphi_esr_msgs-msg:pathIdFcwMove instead.")
  (pathIdFcwMove m))

(cl:ensure-generic-function 'pathIdFcwStat-val :lambda-list '(m))
(cl:defmethod pathIdFcwStat-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIdFcwStat-val is deprecated.  Use delphi_esr_msgs-msg:pathIdFcwStat instead.")
  (pathIdFcwStat m))

(cl:ensure-generic-function 'pathIdAccStat-val :lambda-list '(m))
(cl:defmethod pathIdAccStat-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:pathIdAccStat-val is deprecated.  Use delphi_esr_msgs-msg:pathIdAccStat instead.")
  (pathIdAccStat m))

(cl:ensure-generic-function 'autoAlginAngle-val :lambda-list '(m))
(cl:defmethod autoAlginAngle-val ((m <EsrStatus4>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:autoAlginAngle-val is deprecated.  Use delphi_esr_msgs-msg:autoAlginAngle instead.")
  (autoAlginAngle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrStatus4>) ostream)
  "Serializes a message object of type '<EsrStatus4>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollingCount3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mrlrMode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'patialBlockage) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sideLobeBlockage) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lrOnlyGratingLobeDet) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'truckTargetDet) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdAcc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdCmmbMove)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdCmmbStat)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdFcwMove)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdFcwStat)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdAccStat)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'autoAlginAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrStatus4>) istream)
  "Deserializes a message object of type '<EsrStatus4>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rollingCount3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mrlrMode)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'patialBlockage) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sideLobeBlockage) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'lrOnlyGratingLobeDet) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'truckTargetDet) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdAcc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdCmmbMove)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdCmmbStat)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdFcwMove)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdFcwStat)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pathIdAccStat)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'autoAlginAngle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrStatus4>)))
  "Returns string type for a message object of type '<EsrStatus4>"
  "delphi_esr_msgs/EsrStatus4")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrStatus4)))
  "Returns string type for a message object of type 'EsrStatus4"
  "delphi_esr_msgs/EsrStatus4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrStatus4>)))
  "Returns md5sum for a message object of type '<EsrStatus4>"
  "abec2ac03bbfc0ae47f593463cff96cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrStatus4)))
  "Returns md5sum for a message object of type 'EsrStatus4"
  "abec2ac03bbfc0ae47f593463cff96cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrStatus4>)))
  "Returns full string definition for message of type '<EsrStatus4>"
  (cl:format cl:nil "Header header~%~%# ESR status4~%string      canmsg~%uint8       rollingCount3~%uint8       mrlrMode~%bool        patialBlockage~%bool        sideLobeBlockage~%bool        lrOnlyGratingLobeDet~%bool        truckTargetDet~%uint8       pathIdAcc~%uint8       pathIdCmmbMove~%uint8       pathIdCmmbStat~%uint8       pathIdFcwMove~%uint8       pathIdFcwStat~%uint8       pathIdAccStat~%float32     autoAlginAngle~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrStatus4)))
  "Returns full string definition for message of type 'EsrStatus4"
  (cl:format cl:nil "Header header~%~%# ESR status4~%string      canmsg~%uint8       rollingCount3~%uint8       mrlrMode~%bool        patialBlockage~%bool        sideLobeBlockage~%bool        lrOnlyGratingLobeDet~%bool        truckTargetDet~%uint8       pathIdAcc~%uint8       pathIdCmmbMove~%uint8       pathIdCmmbStat~%uint8       pathIdFcwMove~%uint8       pathIdFcwStat~%uint8       pathIdAccStat~%float32     autoAlginAngle~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrStatus4>))
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
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrStatus4>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrStatus4
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':rollingCount3 (rollingCount3 msg))
    (cl:cons ':mrlrMode (mrlrMode msg))
    (cl:cons ':patialBlockage (patialBlockage msg))
    (cl:cons ':sideLobeBlockage (sideLobeBlockage msg))
    (cl:cons ':lrOnlyGratingLobeDet (lrOnlyGratingLobeDet msg))
    (cl:cons ':truckTargetDet (truckTargetDet msg))
    (cl:cons ':pathIdAcc (pathIdAcc msg))
    (cl:cons ':pathIdCmmbMove (pathIdCmmbMove msg))
    (cl:cons ':pathIdCmmbStat (pathIdCmmbStat msg))
    (cl:cons ':pathIdFcwMove (pathIdFcwMove msg))
    (cl:cons ':pathIdFcwStat (pathIdFcwStat msg))
    (cl:cons ':pathIdAccStat (pathIdAccStat msg))
    (cl:cons ':autoAlginAngle (autoAlginAngle msg))
))
