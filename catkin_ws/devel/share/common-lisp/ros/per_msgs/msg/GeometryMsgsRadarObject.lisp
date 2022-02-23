; Auto-generated. Do not edit!


(cl:in-package per_msgs-msg)


;//! \htmlinclude GeometryMsgsRadarObject.msg.html

(cl:defclass <GeometryMsgsRadarObject> (roslisp-msg-protocol:ros-message)
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
    :type cl:integer
    :initform 0))
)

(cl:defclass GeometryMsgsRadarObject (<GeometryMsgsRadarObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GeometryMsgsRadarObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GeometryMsgsRadarObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name per_msgs-msg:<GeometryMsgsRadarObject> is deprecated: use per_msgs-msg:GeometryMsgsRadarObject instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:header-val is deprecated.  Use per_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:range-val is deprecated.  Use per_msgs-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'range_rate-val :lambda-list '(m))
(cl:defmethod range_rate-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:range_rate-val is deprecated.  Use per_msgs-msg:range_rate instead.")
  (range_rate m))

(cl:ensure-generic-function 'angle_centroid-val :lambda-list '(m))
(cl:defmethod angle_centroid-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:angle_centroid-val is deprecated.  Use per_msgs-msg:angle_centroid instead.")
  (angle_centroid m))

(cl:ensure-generic-function 'obj_vcs_posex-val :lambda-list '(m))
(cl:defmethod obj_vcs_posex-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:obj_vcs_posex-val is deprecated.  Use per_msgs-msg:obj_vcs_posex instead.")
  (obj_vcs_posex m))

(cl:ensure-generic-function 'obj_vcs_posey-val :lambda-list '(m))
(cl:defmethod obj_vcs_posey-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:obj_vcs_posey-val is deprecated.  Use per_msgs-msg:obj_vcs_posey instead.")
  (obj_vcs_posey m))

(cl:ensure-generic-function 'track_id-val :lambda-list '(m))
(cl:defmethod track_id-val ((m <GeometryMsgsRadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:track_id-val is deprecated.  Use per_msgs-msg:track_id instead.")
  (track_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GeometryMsgsRadarObject>) ostream)
  "Serializes a message object of type '<GeometryMsgsRadarObject>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'track_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GeometryMsgsRadarObject>) istream)
  "Deserializes a message object of type '<GeometryMsgsRadarObject>"
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
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GeometryMsgsRadarObject>)))
  "Returns string type for a message object of type '<GeometryMsgsRadarObject>"
  "per_msgs/GeometryMsgsRadarObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GeometryMsgsRadarObject)))
  "Returns string type for a message object of type 'GeometryMsgsRadarObject"
  "per_msgs/GeometryMsgsRadarObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GeometryMsgsRadarObject>)))
  "Returns md5sum for a message object of type '<GeometryMsgsRadarObject>"
  "f6e9b9d77e2c774b5c49c0eee3fe3bd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GeometryMsgsRadarObject)))
  "Returns md5sum for a message object of type 'GeometryMsgsRadarObject"
  "f6e9b9d77e2c774b5c49c0eee3fe3bd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GeometryMsgsRadarObject>)))
  "Returns full string definition for message of type '<GeometryMsgsRadarObject>"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 range_rate #velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint32 track_id~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GeometryMsgsRadarObject)))
  "Returns full string definition for message of type 'GeometryMsgsRadarObject"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 range_rate #velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint32 track_id~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GeometryMsgsRadarObject>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GeometryMsgsRadarObject>))
  "Converts a ROS message object to a list"
  (cl:list 'GeometryMsgsRadarObject
    (cl:cons ':header (header msg))
    (cl:cons ':range (range msg))
    (cl:cons ':range_rate (range_rate msg))
    (cl:cons ':angle_centroid (angle_centroid msg))
    (cl:cons ':obj_vcs_posex (obj_vcs_posex msg))
    (cl:cons ':obj_vcs_posey (obj_vcs_posey msg))
    (cl:cons ':track_id (track_id msg))
))
