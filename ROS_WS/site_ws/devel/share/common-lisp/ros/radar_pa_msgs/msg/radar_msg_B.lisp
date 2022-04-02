; Auto-generated. Do not edit!


(cl:in-package radar_pa_msgs-msg)


;//! \htmlinclude radar_msg_B.msg.html

(cl:defclass <radar_msg_B> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:fixnum
    :initform 0)
   (ID
    :reader ID
    :initarg :ID
    :type cl:integer
    :initform 0)
   (distance_deviation
    :reader distance_deviation
    :initarg :distance_deviation
    :type cl:float
    :initform 0.0)
   (velocity_deviation
    :reader velocity_deviation
    :initarg :velocity_deviation
    :type cl:float
    :initform 0.0)
   (angle_deviation
    :reader angle_deviation
    :initarg :angle_deviation
    :type cl:float
    :initform 0.0)
   (proability_target
    :reader proability_target
    :initarg :proability_target
    :type cl:float
    :initform 0.0)
   (counter
    :reader counter
    :initarg :counter
    :type cl:fixnum
    :initform 0))
)

(cl:defclass radar_msg_B (<radar_msg_B>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <radar_msg_B>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'radar_msg_B)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name radar_pa_msgs-msg:<radar_msg_B> is deprecated: use radar_pa_msgs-msg:radar_msg_B instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:message-val is deprecated.  Use radar_pa_msgs-msg:message instead.")
  (message m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:ID-val is deprecated.  Use radar_pa_msgs-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'distance_deviation-val :lambda-list '(m))
(cl:defmethod distance_deviation-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:distance_deviation-val is deprecated.  Use radar_pa_msgs-msg:distance_deviation instead.")
  (distance_deviation m))

(cl:ensure-generic-function 'velocity_deviation-val :lambda-list '(m))
(cl:defmethod velocity_deviation-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:velocity_deviation-val is deprecated.  Use radar_pa_msgs-msg:velocity_deviation instead.")
  (velocity_deviation m))

(cl:ensure-generic-function 'angle_deviation-val :lambda-list '(m))
(cl:defmethod angle_deviation-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:angle_deviation-val is deprecated.  Use radar_pa_msgs-msg:angle_deviation instead.")
  (angle_deviation m))

(cl:ensure-generic-function 'proability_target-val :lambda-list '(m))
(cl:defmethod proability_target-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:proability_target-val is deprecated.  Use radar_pa_msgs-msg:proability_target instead.")
  (proability_target m))

(cl:ensure-generic-function 'counter-val :lambda-list '(m))
(cl:defmethod counter-val ((m <radar_msg_B>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:counter-val is deprecated.  Use radar_pa_msgs-msg:counter instead.")
  (counter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <radar_msg_B>) ostream)
  "Serializes a message object of type '<radar_msg_B>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'message)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance_deviation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity_deviation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_deviation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proability_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'counter)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <radar_msg_B>) istream)
  "Deserializes a message object of type '<radar_msg_B>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'message)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_deviation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_deviation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_deviation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proability_target) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'counter)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<radar_msg_B>)))
  "Returns string type for a message object of type '<radar_msg_B>"
  "radar_pa_msgs/radar_msg_B")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'radar_msg_B)))
  "Returns string type for a message object of type 'radar_msg_B"
  "radar_pa_msgs/radar_msg_B")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<radar_msg_B>)))
  "Returns md5sum for a message object of type '<radar_msg_B>"
  "596d24d33b8a883eb8423004f314ff5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'radar_msg_B)))
  "Returns md5sum for a message object of type 'radar_msg_B"
  "596d24d33b8a883eb8423004f314ff5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<radar_msg_B>)))
  "Returns full string definition for message of type '<radar_msg_B>"
  (cl:format cl:nil "uint8   message~%uint32  ID~%float32 distance_deviation~%float32 velocity_deviation~%float32 angle_deviation~%float32 proability_target~%uint8   counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'radar_msg_B)))
  "Returns full string definition for message of type 'radar_msg_B"
  (cl:format cl:nil "uint8   message~%uint32  ID~%float32 distance_deviation~%float32 velocity_deviation~%float32 angle_deviation~%float32 proability_target~%uint8   counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <radar_msg_B>))
  (cl:+ 0
     1
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <radar_msg_B>))
  "Converts a ROS message object to a list"
  (cl:list 'radar_msg_B
    (cl:cons ':message (message msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':distance_deviation (distance_deviation msg))
    (cl:cons ':velocity_deviation (velocity_deviation msg))
    (cl:cons ':angle_deviation (angle_deviation msg))
    (cl:cons ':proability_target (proability_target msg))
    (cl:cons ':counter (counter msg))
))
