; Auto-generated. Do not edit!


(cl:in-package gazebo_radar_plugin-msg)


;//! \htmlinclude ModeCRadar.msg.html

(cl:defclass <ModeCRadar> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0)
   (bearing
    :reader bearing
    :initarg :bearing
    :type cl:float
    :initform 0.0)
   (altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0)
   (code
    :reader code
    :initarg :code
    :type cl:fixnum
    :initform 0)
   (ident
    :reader ident
    :initarg :ident
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ModeCRadar (<ModeCRadar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModeCRadar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModeCRadar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_radar_plugin-msg:<ModeCRadar> is deprecated: use gazebo_radar_plugin-msg:ModeCRadar instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ModeCRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_radar_plugin-msg:header-val is deprecated.  Use gazebo_radar_plugin-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <ModeCRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_radar_plugin-msg:range-val is deprecated.  Use gazebo_radar_plugin-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'bearing-val :lambda-list '(m))
(cl:defmethod bearing-val ((m <ModeCRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_radar_plugin-msg:bearing-val is deprecated.  Use gazebo_radar_plugin-msg:bearing instead.")
  (bearing m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <ModeCRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_radar_plugin-msg:altitude-val is deprecated.  Use gazebo_radar_plugin-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <ModeCRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_radar_plugin-msg:code-val is deprecated.  Use gazebo_radar_plugin-msg:code instead.")
  (code m))

(cl:ensure-generic-function 'ident-val :lambda-list '(m))
(cl:defmethod ident-val ((m <ModeCRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_radar_plugin-msg:ident-val is deprecated.  Use gazebo_radar_plugin-msg:ident instead.")
  (ident m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModeCRadar>) ostream)
  "Serializes a message object of type '<ModeCRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bearing))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ident) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModeCRadar>) istream)
  "Deserializes a message object of type '<ModeCRadar>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bearing) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'code)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ident) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModeCRadar>)))
  "Returns string type for a message object of type '<ModeCRadar>"
  "gazebo_radar_plugin/ModeCRadar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModeCRadar)))
  "Returns string type for a message object of type 'ModeCRadar"
  "gazebo_radar_plugin/ModeCRadar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModeCRadar>)))
  "Returns md5sum for a message object of type '<ModeCRadar>"
  "19c4f5ea27d7018d84f81236837f5bfe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModeCRadar)))
  "Returns md5sum for a message object of type 'ModeCRadar"
  "19c4f5ea27d7018d84f81236837f5bfe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModeCRadar>)))
  "Returns full string definition for message of type '<ModeCRadar>"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 bearing  # radians clockwise about Z axis of header frame~%float32 altitude  # Pressure altitude (m)~%uint16 code # Transponder code~%bool ident  # If ident button was pressed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModeCRadar)))
  "Returns full string definition for message of type 'ModeCRadar"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 bearing  # radians clockwise about Z axis of header frame~%float32 altitude  # Pressure altitude (m)~%uint16 code # Transponder code~%bool ident  # If ident button was pressed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModeCRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModeCRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'ModeCRadar
    (cl:cons ':header (header msg))
    (cl:cons ':range (range msg))
    (cl:cons ':bearing (bearing msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':code (code msg))
    (cl:cons ':ident (ident msg))
))
