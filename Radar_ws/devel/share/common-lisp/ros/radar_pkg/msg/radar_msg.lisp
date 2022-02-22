; Auto-generated. Do not edit!


(cl:in-package radar_pkg-msg)


;//! \htmlinclude radar_msg.msg.html

(cl:defclass <radar_msg> (roslisp-msg-protocol:ros-message)
  ((msg_counter
    :reader msg_counter
    :initarg :msg_counter
    :type cl:integer
    :initform 0)
   (isObject
    :reader isObject
    :initarg :isObject
    :type cl:boolean
    :initform cl:nil)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass radar_msg (<radar_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <radar_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'radar_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name radar_pkg-msg:<radar_msg> is deprecated: use radar_pkg-msg:radar_msg instead.")))

(cl:ensure-generic-function 'msg_counter-val :lambda-list '(m))
(cl:defmethod msg_counter-val ((m <radar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pkg-msg:msg_counter-val is deprecated.  Use radar_pkg-msg:msg_counter instead.")
  (msg_counter m))

(cl:ensure-generic-function 'isObject-val :lambda-list '(m))
(cl:defmethod isObject-val ((m <radar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pkg-msg:isObject-val is deprecated.  Use radar_pkg-msg:isObject instead.")
  (isObject m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <radar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pkg-msg:distance-val is deprecated.  Use radar_pkg-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <radar_msg>) ostream)
  "Serializes a message object of type '<radar_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'msg_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'msg_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'msg_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'msg_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isObject) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <radar_msg>) istream)
  "Deserializes a message object of type '<radar_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'msg_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'msg_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'msg_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'msg_counter)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'isObject) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<radar_msg>)))
  "Returns string type for a message object of type '<radar_msg>"
  "radar_pkg/radar_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'radar_msg)))
  "Returns string type for a message object of type 'radar_msg"
  "radar_pkg/radar_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<radar_msg>)))
  "Returns md5sum for a message object of type '<radar_msg>"
  "cbc61f5430d101edd8000fb728a64c35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'radar_msg)))
  "Returns md5sum for a message object of type 'radar_msg"
  "cbc61f5430d101edd8000fb728a64c35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<radar_msg>)))
  "Returns full string definition for message of type '<radar_msg>"
  (cl:format cl:nil "uint32 msg_counter~%bool isObject~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'radar_msg)))
  "Returns full string definition for message of type 'radar_msg"
  (cl:format cl:nil "uint32 msg_counter~%bool isObject~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <radar_msg>))
  (cl:+ 0
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <radar_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'radar_msg
    (cl:cons ':msg_counter (msg_counter msg))
    (cl:cons ':isObject (isObject msg))
    (cl:cons ':distance (distance msg))
))
