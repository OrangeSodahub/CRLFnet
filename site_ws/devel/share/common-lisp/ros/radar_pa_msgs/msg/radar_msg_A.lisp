; Auto-generated. Do not edit!


(cl:in-package radar_pa_msgs-msg)


;//! \htmlinclude radar_msg_A.msg.html

(cl:defclass <radar_msg_A> (roslisp-msg-protocol:ros-message)
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
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (power
    :reader power
    :initarg :power
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (is_target
    :reader is_target
    :initarg :is_target
    :type cl:fixnum
    :initform 0)
   (counter
    :reader counter
    :initarg :counter
    :type cl:fixnum
    :initform 0))
)

(cl:defclass radar_msg_A (<radar_msg_A>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <radar_msg_A>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'radar_msg_A)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name radar_pa_msgs-msg:<radar_msg_A> is deprecated: use radar_pa_msgs-msg:radar_msg_A instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:message-val is deprecated.  Use radar_pa_msgs-msg:message instead.")
  (message m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:ID-val is deprecated.  Use radar_pa_msgs-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:distance-val is deprecated.  Use radar_pa_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:velocity-val is deprecated.  Use radar_pa_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'power-val :lambda-list '(m))
(cl:defmethod power-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:power-val is deprecated.  Use radar_pa_msgs-msg:power instead.")
  (power m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:angle-val is deprecated.  Use radar_pa_msgs-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'is_target-val :lambda-list '(m))
(cl:defmethod is_target-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:is_target-val is deprecated.  Use radar_pa_msgs-msg:is_target instead.")
  (is_target m))

(cl:ensure-generic-function 'counter-val :lambda-list '(m))
(cl:defmethod counter-val ((m <radar_msg_A>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:counter-val is deprecated.  Use radar_pa_msgs-msg:counter instead.")
  (counter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <radar_msg_A>) ostream)
  "Serializes a message object of type '<radar_msg_A>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'message)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'power))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'is_target)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'counter)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <radar_msg_A>) istream)
  "Deserializes a message object of type '<radar_msg_A>"
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
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'is_target)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'counter)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<radar_msg_A>)))
  "Returns string type for a message object of type '<radar_msg_A>"
  "radar_pa_msgs/radar_msg_A")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'radar_msg_A)))
  "Returns string type for a message object of type 'radar_msg_A"
  "radar_pa_msgs/radar_msg_A")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<radar_msg_A>)))
  "Returns md5sum for a message object of type '<radar_msg_A>"
  "6263190fa969f78dbbac8590a9a4d965")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'radar_msg_A)))
  "Returns md5sum for a message object of type 'radar_msg_A"
  "6263190fa969f78dbbac8590a9a4d965")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<radar_msg_A>)))
  "Returns full string definition for message of type '<radar_msg_A>"
  (cl:format cl:nil "uint8   message~%uint32  ID~%float32 distance~%float32 velocity~%float32 power~%float32 angle~%uint8   is_target~%uint8   counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'radar_msg_A)))
  "Returns full string definition for message of type 'radar_msg_A"
  (cl:format cl:nil "uint8   message~%uint32  ID~%float32 distance~%float32 velocity~%float32 power~%float32 angle~%uint8   is_target~%uint8   counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <radar_msg_A>))
  (cl:+ 0
     1
     4
     4
     4
     4
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <radar_msg_A>))
  "Converts a ROS message object to a list"
  (cl:list 'radar_msg_A
    (cl:cons ':message (message msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':power (power msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':is_target (is_target msg))
    (cl:cons ':counter (counter msg))
))
