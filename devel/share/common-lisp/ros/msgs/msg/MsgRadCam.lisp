; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgRadCam.msg.html

(cl:defclass <MsgRadCam> (roslisp-msg-protocol:ros-message)
  ((Header
    :reader Header
    :initarg :Header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (match_left
    :reader match_left
    :initarg :match_left
    :type cl:float
    :initform 0.0)
   (radar_left
    :reader radar_left
    :initarg :radar_left
    :type cl:float
    :initform 0.0)
   (camera_left
    :reader camera_left
    :initarg :camera_left
    :type cl:float
    :initform 0.0)
   (match_right
    :reader match_right
    :initarg :match_right
    :type cl:float
    :initform 0.0)
   (radar_right
    :reader radar_right
    :initarg :radar_right
    :type cl:float
    :initform 0.0)
   (camera_right
    :reader camera_right
    :initarg :camera_right
    :type cl:float
    :initform 0.0))
)

(cl:defclass MsgRadCam (<MsgRadCam>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgRadCam>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgRadCam)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<MsgRadCam> is deprecated: use msgs-msg:MsgRadCam instead.")))

(cl:ensure-generic-function 'Header-val :lambda-list '(m))
(cl:defmethod Header-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:Header-val is deprecated.  Use msgs-msg:Header instead.")
  (Header m))

(cl:ensure-generic-function 'match_left-val :lambda-list '(m))
(cl:defmethod match_left-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:match_left-val is deprecated.  Use msgs-msg:match_left instead.")
  (match_left m))

(cl:ensure-generic-function 'radar_left-val :lambda-list '(m))
(cl:defmethod radar_left-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:radar_left-val is deprecated.  Use msgs-msg:radar_left instead.")
  (radar_left m))

(cl:ensure-generic-function 'camera_left-val :lambda-list '(m))
(cl:defmethod camera_left-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:camera_left-val is deprecated.  Use msgs-msg:camera_left instead.")
  (camera_left m))

(cl:ensure-generic-function 'match_right-val :lambda-list '(m))
(cl:defmethod match_right-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:match_right-val is deprecated.  Use msgs-msg:match_right instead.")
  (match_right m))

(cl:ensure-generic-function 'radar_right-val :lambda-list '(m))
(cl:defmethod radar_right-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:radar_right-val is deprecated.  Use msgs-msg:radar_right instead.")
  (radar_right m))

(cl:ensure-generic-function 'camera_right-val :lambda-list '(m))
(cl:defmethod camera_right-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:camera_right-val is deprecated.  Use msgs-msg:camera_right instead.")
  (camera_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRadCam>) ostream)
  "Serializes a message object of type '<MsgRadCam>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'match_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radar_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'camera_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'match_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radar_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'camera_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRadCam>) istream)
  "Deserializes a message object of type '<MsgRadCam>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'match_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radar_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'camera_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'match_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radar_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'camera_right) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgRadCam>)))
  "Returns string type for a message object of type '<MsgRadCam>"
  "msgs/MsgRadCam")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgRadCam)))
  "Returns string type for a message object of type 'MsgRadCam"
  "msgs/MsgRadCam")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgRadCam>)))
  "Returns md5sum for a message object of type '<MsgRadCam>"
  "77843f8cca22df506f0bd8510a04bfe1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRadCam)))
  "Returns md5sum for a message object of type 'MsgRadCam"
  "77843f8cca22df506f0bd8510a04bfe1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRadCam>)))
  "Returns full string definition for message of type '<MsgRadCam>"
  (cl:format cl:nil "Header Header~%float32 match_left~%float32 radar_left~%float32 camera_left~%float32 match_right~%float32 radar_right~%float32 camera_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRadCam)))
  "Returns full string definition for message of type 'MsgRadCam"
  (cl:format cl:nil "Header Header~%float32 match_left~%float32 radar_left~%float32 camera_left~%float32 match_right~%float32 radar_right~%float32 camera_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRadCam>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Header))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRadCam>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRadCam
    (cl:cons ':Header (Header msg))
    (cl:cons ':match_left (match_left msg))
    (cl:cons ':radar_left (radar_left msg))
    (cl:cons ':camera_left (camera_left msg))
    (cl:cons ':match_right (match_right msg))
    (cl:cons ':radar_right (radar_right msg))
    (cl:cons ':camera_right (camera_right msg))
))
