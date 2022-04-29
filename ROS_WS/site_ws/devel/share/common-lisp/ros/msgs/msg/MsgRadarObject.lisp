; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgRadarObject.msg.html

(cl:defclass <MsgRadarObject> (roslisp-msg-protocol:ros-message)
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
   (range_rate
    :reader range_rate
    :initarg :range_rate
    :type cl:float
    :initform 0.0)
   (angle_centroid
    :reader angle_centroid
    :initarg :angle_centroid
    :type cl:float
    :initform 0.0)
   (obj_vcs_posex
    :reader obj_vcs_posex
    :initarg :obj_vcs_posex
    :type cl:float
    :initform 0.0)
   (obj_vcs_posey
    :reader obj_vcs_posey
    :initarg :obj_vcs_posey
    :type cl:float
    :initform 0.0)
   (track_id
    :reader track_id
    :initarg :track_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MsgRadarObject (<MsgRadarObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgRadarObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgRadarObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<MsgRadarObject> is deprecated: use msgs-msg:MsgRadarObject instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:header-val is deprecated.  Use msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:range-val is deprecated.  Use msgs-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'range_rate-val :lambda-list '(m))
(cl:defmethod range_rate-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:range_rate-val is deprecated.  Use msgs-msg:range_rate instead.")
  (range_rate m))

(cl:ensure-generic-function 'angle_centroid-val :lambda-list '(m))
(cl:defmethod angle_centroid-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:angle_centroid-val is deprecated.  Use msgs-msg:angle_centroid instead.")
  (angle_centroid m))

(cl:ensure-generic-function 'obj_vcs_posex-val :lambda-list '(m))
(cl:defmethod obj_vcs_posex-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:obj_vcs_posex-val is deprecated.  Use msgs-msg:obj_vcs_posex instead.")
  (obj_vcs_posex m))

(cl:ensure-generic-function 'obj_vcs_posey-val :lambda-list '(m))
(cl:defmethod obj_vcs_posey-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:obj_vcs_posey-val is deprecated.  Use msgs-msg:obj_vcs_posey instead.")
  (obj_vcs_posey m))

(cl:ensure-generic-function 'track_id-val :lambda-list '(m))
(cl:defmethod track_id-val ((m <MsgRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:track_id-val is deprecated.  Use msgs-msg:track_id instead.")
  (track_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRadarObject>) ostream)
  "Serializes a message object of type '<MsgRadarObject>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_centroid))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'obj_vcs_posex))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'obj_vcs_posey))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRadarObject>) istream)
  "Deserializes a message object of type '<MsgRadarObject>"
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
    (cl:setf (cl:slot-value msg 'range_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_centroid) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_vcs_posex) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_vcs_posey) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgRadarObject>)))
  "Returns string type for a message object of type '<MsgRadarObject>"
  "msgs/MsgRadarObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgRadarObject)))
  "Returns string type for a message object of type 'MsgRadarObject"
  "msgs/MsgRadarObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgRadarObject>)))
  "Returns md5sum for a message object of type '<MsgRadarObject>"
  "c025781ebbd73797667e4f989e96e8b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRadarObject)))
  "Returns md5sum for a message object of type 'MsgRadarObject"
  "c025781ebbd73797667e4f989e96e8b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRadarObject>)))
  "Returns full string definition for message of type '<MsgRadarObject>"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 range_rate # velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRadarObject)))
  "Returns full string definition for message of type 'MsgRadarObject"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 range_rate # velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRadarObject>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRadarObject>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRadarObject
    (cl:cons ':header (header msg))
    (cl:cons ':range (range msg))
    (cl:cons ':range_rate (range_rate msg))
    (cl:cons ':angle_centroid (angle_centroid msg))
    (cl:cons ':obj_vcs_posex (obj_vcs_posex msg))
    (cl:cons ':obj_vcs_posey (obj_vcs_posey msg))
    (cl:cons ':track_id (track_id msg))
))
