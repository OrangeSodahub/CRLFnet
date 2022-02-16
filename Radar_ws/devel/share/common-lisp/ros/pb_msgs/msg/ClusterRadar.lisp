; Auto-generated. Do not edit!


(cl:in-package pb_msgs-msg)


;//! \htmlinclude ClusterRadar.msg.html

(cl:defclass <ClusterRadar> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (target_id
    :reader target_id
    :initarg :target_id
    :type cl:fixnum
    :initform 0)
   (longitude_dist
    :reader longitude_dist
    :initarg :longitude_dist
    :type cl:float
    :initform 0.0)
   (lateral_dist
    :reader lateral_dist
    :initarg :lateral_dist
    :type cl:float
    :initform 0.0)
   (longitude_vel
    :reader longitude_vel
    :initarg :longitude_vel
    :type cl:float
    :initform 0.0)
   (lateral_vel
    :reader lateral_vel
    :initarg :lateral_vel
    :type cl:float
    :initform 0.0)
   (rcs
    :reader rcs
    :initarg :rcs
    :type cl:float
    :initform 0.0))
)

(cl:defclass ClusterRadar (<ClusterRadar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClusterRadar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClusterRadar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pb_msgs-msg:<ClusterRadar> is deprecated: use pb_msgs-msg:ClusterRadar instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:header-val is deprecated.  Use pb_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'target_id-val :lambda-list '(m))
(cl:defmethod target_id-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:target_id-val is deprecated.  Use pb_msgs-msg:target_id instead.")
  (target_id m))

(cl:ensure-generic-function 'longitude_dist-val :lambda-list '(m))
(cl:defmethod longitude_dist-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:longitude_dist-val is deprecated.  Use pb_msgs-msg:longitude_dist instead.")
  (longitude_dist m))

(cl:ensure-generic-function 'lateral_dist-val :lambda-list '(m))
(cl:defmethod lateral_dist-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:lateral_dist-val is deprecated.  Use pb_msgs-msg:lateral_dist instead.")
  (lateral_dist m))

(cl:ensure-generic-function 'longitude_vel-val :lambda-list '(m))
(cl:defmethod longitude_vel-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:longitude_vel-val is deprecated.  Use pb_msgs-msg:longitude_vel instead.")
  (longitude_vel m))

(cl:ensure-generic-function 'lateral_vel-val :lambda-list '(m))
(cl:defmethod lateral_vel-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:lateral_vel-val is deprecated.  Use pb_msgs-msg:lateral_vel instead.")
  (lateral_vel m))

(cl:ensure-generic-function 'rcs-val :lambda-list '(m))
(cl:defmethod rcs-val ((m <ClusterRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:rcs-val is deprecated.  Use pb_msgs-msg:rcs instead.")
  (rcs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClusterRadar>) ostream)
  "Serializes a message object of type '<ClusterRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lateral_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lateral_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rcs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClusterRadar>) istream)
  "Deserializes a message object of type '<ClusterRadar>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude_dist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateral_dist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude_vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateral_vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rcs) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClusterRadar>)))
  "Returns string type for a message object of type '<ClusterRadar>"
  "pb_msgs/ClusterRadar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClusterRadar)))
  "Returns string type for a message object of type 'ClusterRadar"
  "pb_msgs/ClusterRadar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClusterRadar>)))
  "Returns md5sum for a message object of type '<ClusterRadar>"
  "ccd4422744fe0f3d40c70da9e394ee5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClusterRadar)))
  "Returns md5sum for a message object of type 'ClusterRadar"
  "ccd4422744fe0f3d40c70da9e394ee5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClusterRadar>)))
  "Returns full string definition for message of type '<ClusterRadar>"
  (cl:format cl:nil "Header header~%uint8 target_id~%float32 longitude_dist~%float32 lateral_dist~%float32 longitude_vel~%float32 lateral_vel~%float32 rcs~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClusterRadar)))
  "Returns full string definition for message of type 'ClusterRadar"
  (cl:format cl:nil "Header header~%uint8 target_id~%float32 longitude_dist~%float32 lateral_dist~%float32 longitude_vel~%float32 lateral_vel~%float32 rcs~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClusterRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClusterRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'ClusterRadar
    (cl:cons ':header (header msg))
    (cl:cons ':target_id (target_id msg))
    (cl:cons ':longitude_dist (longitude_dist msg))
    (cl:cons ':lateral_dist (lateral_dist msg))
    (cl:cons ':longitude_vel (longitude_vel msg))
    (cl:cons ':lateral_vel (lateral_vel msg))
    (cl:cons ':rcs (rcs msg))
))
