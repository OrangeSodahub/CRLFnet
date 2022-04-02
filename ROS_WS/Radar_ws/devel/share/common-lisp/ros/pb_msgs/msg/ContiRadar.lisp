; Auto-generated. Do not edit!


(cl:in-package pb_msgs-msg)


;//! \htmlinclude ContiRadar.msg.html

(cl:defclass <ContiRadar> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (obstacle_id
    :reader obstacle_id
    :initarg :obstacle_id
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
    :initform 0.0)
   (orientation_angle
    :reader orientation_angle
    :initarg :orientation_angle
    :type cl:float
    :initform 0.0)
   (length
    :reader length
    :initarg :length
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (obstacle_class
    :reader obstacle_class
    :initarg :obstacle_class
    :type cl:string
    :initform "")
   (meas_state
    :reader meas_state
    :initarg :meas_state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ContiRadar (<ContiRadar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContiRadar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContiRadar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pb_msgs-msg:<ContiRadar> is deprecated: use pb_msgs-msg:ContiRadar instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:header-val is deprecated.  Use pb_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'obstacle_id-val :lambda-list '(m))
(cl:defmethod obstacle_id-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:obstacle_id-val is deprecated.  Use pb_msgs-msg:obstacle_id instead.")
  (obstacle_id m))

(cl:ensure-generic-function 'longitude_dist-val :lambda-list '(m))
(cl:defmethod longitude_dist-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:longitude_dist-val is deprecated.  Use pb_msgs-msg:longitude_dist instead.")
  (longitude_dist m))

(cl:ensure-generic-function 'lateral_dist-val :lambda-list '(m))
(cl:defmethod lateral_dist-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:lateral_dist-val is deprecated.  Use pb_msgs-msg:lateral_dist instead.")
  (lateral_dist m))

(cl:ensure-generic-function 'longitude_vel-val :lambda-list '(m))
(cl:defmethod longitude_vel-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:longitude_vel-val is deprecated.  Use pb_msgs-msg:longitude_vel instead.")
  (longitude_vel m))

(cl:ensure-generic-function 'lateral_vel-val :lambda-list '(m))
(cl:defmethod lateral_vel-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:lateral_vel-val is deprecated.  Use pb_msgs-msg:lateral_vel instead.")
  (lateral_vel m))

(cl:ensure-generic-function 'rcs-val :lambda-list '(m))
(cl:defmethod rcs-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:rcs-val is deprecated.  Use pb_msgs-msg:rcs instead.")
  (rcs m))

(cl:ensure-generic-function 'orientation_angle-val :lambda-list '(m))
(cl:defmethod orientation_angle-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:orientation_angle-val is deprecated.  Use pb_msgs-msg:orientation_angle instead.")
  (orientation_angle m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:length-val is deprecated.  Use pb_msgs-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:width-val is deprecated.  Use pb_msgs-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'obstacle_class-val :lambda-list '(m))
(cl:defmethod obstacle_class-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:obstacle_class-val is deprecated.  Use pb_msgs-msg:obstacle_class instead.")
  (obstacle_class m))

(cl:ensure-generic-function 'meas_state-val :lambda-list '(m))
(cl:defmethod meas_state-val ((m <ContiRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:meas_state-val is deprecated.  Use pb_msgs-msg:meas_state instead.")
  (meas_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContiRadar>) ostream)
  "Serializes a message object of type '<ContiRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obstacle_id)) ostream)
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orientation_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'obstacle_class))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'obstacle_class))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'meas_state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContiRadar>) istream)
  "Deserializes a message object of type '<ContiRadar>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'obstacle_id)) (cl:read-byte istream))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orientation_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'obstacle_class) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'obstacle_class) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'meas_state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContiRadar>)))
  "Returns string type for a message object of type '<ContiRadar>"
  "pb_msgs/ContiRadar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContiRadar)))
  "Returns string type for a message object of type 'ContiRadar"
  "pb_msgs/ContiRadar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContiRadar>)))
  "Returns md5sum for a message object of type '<ContiRadar>"
  "57e1ab636428c459e0b7de26a4d272b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContiRadar)))
  "Returns md5sum for a message object of type 'ContiRadar"
  "57e1ab636428c459e0b7de26a4d272b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContiRadar>)))
  "Returns full string definition for message of type '<ContiRadar>"
  (cl:format cl:nil "Header header~%uint8 obstacle_id~%float32 longitude_dist~%float32 lateral_dist~%float32 longitude_vel~%float32 lateral_vel~%float32 rcs~%float32 orientation_angle~%float32 length~%float32 width~%string obstacle_class~%uint8 meas_state~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContiRadar)))
  "Returns full string definition for message of type 'ContiRadar"
  (cl:format cl:nil "Header header~%uint8 obstacle_id~%float32 longitude_dist~%float32 lateral_dist~%float32 longitude_vel~%float32 lateral_vel~%float32 rcs~%float32 orientation_angle~%float32 length~%float32 width~%string obstacle_class~%uint8 meas_state~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContiRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
     4
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'obstacle_class))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContiRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'ContiRadar
    (cl:cons ':header (header msg))
    (cl:cons ':obstacle_id (obstacle_id msg))
    (cl:cons ':longitude_dist (longitude_dist msg))
    (cl:cons ':lateral_dist (lateral_dist msg))
    (cl:cons ':longitude_vel (longitude_vel msg))
    (cl:cons ':lateral_vel (lateral_vel msg))
    (cl:cons ':rcs (rcs msg))
    (cl:cons ':orientation_angle (orientation_angle msg))
    (cl:cons ':length (length msg))
    (cl:cons ':width (width msg))
    (cl:cons ':obstacle_class (obstacle_class msg))
    (cl:cons ':meas_state (meas_state msg))
))
