; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrTrack.msg.html

(cl:defclass <EsrTrack> (roslisp-msg-protocol:ros-message)
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
   (track_ID
    :reader track_ID
    :initarg :track_ID
    :type cl:fixnum
    :initform 0)
   (track_lat_rate
    :reader track_lat_rate
    :initarg :track_lat_rate
    :type cl:float
    :initform 0.0)
   (track_group_changed
    :reader track_group_changed
    :initarg :track_group_changed
    :type cl:boolean
    :initform cl:nil)
   (track_status
    :reader track_status
    :initarg :track_status
    :type cl:fixnum
    :initform 0)
   (track_angle
    :reader track_angle
    :initarg :track_angle
    :type cl:float
    :initform 0.0)
   (track_range
    :reader track_range
    :initarg :track_range
    :type cl:float
    :initform 0.0)
   (track_bridge_object
    :reader track_bridge_object
    :initarg :track_bridge_object
    :type cl:boolean
    :initform cl:nil)
   (track_rolling_count
    :reader track_rolling_count
    :initarg :track_rolling_count
    :type cl:boolean
    :initform cl:nil)
   (track_width
    :reader track_width
    :initarg :track_width
    :type cl:float
    :initform 0.0)
   (track_range_accel
    :reader track_range_accel
    :initarg :track_range_accel
    :type cl:float
    :initform 0.0)
   (track_med_range_mode
    :reader track_med_range_mode
    :initarg :track_med_range_mode
    :type cl:fixnum
    :initform 0)
   (track_range_rate
    :reader track_range_rate
    :initarg :track_range_rate
    :type cl:float
    :initform 0.0))
)

(cl:defclass EsrTrack (<EsrTrack>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrTrack>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrTrack)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrTrack> is deprecated: use delphi_esr_msgs-msg:EsrTrack instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'canmsg-val :lambda-list '(m))
(cl:defmethod canmsg-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:canmsg-val is deprecated.  Use delphi_esr_msgs-msg:canmsg instead.")
  (canmsg m))

(cl:ensure-generic-function 'track_ID-val :lambda-list '(m))
(cl:defmethod track_ID-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_ID-val is deprecated.  Use delphi_esr_msgs-msg:track_ID instead.")
  (track_ID m))

(cl:ensure-generic-function 'track_lat_rate-val :lambda-list '(m))
(cl:defmethod track_lat_rate-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_lat_rate-val is deprecated.  Use delphi_esr_msgs-msg:track_lat_rate instead.")
  (track_lat_rate m))

(cl:ensure-generic-function 'track_group_changed-val :lambda-list '(m))
(cl:defmethod track_group_changed-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_group_changed-val is deprecated.  Use delphi_esr_msgs-msg:track_group_changed instead.")
  (track_group_changed m))

(cl:ensure-generic-function 'track_status-val :lambda-list '(m))
(cl:defmethod track_status-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_status-val is deprecated.  Use delphi_esr_msgs-msg:track_status instead.")
  (track_status m))

(cl:ensure-generic-function 'track_angle-val :lambda-list '(m))
(cl:defmethod track_angle-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_angle-val is deprecated.  Use delphi_esr_msgs-msg:track_angle instead.")
  (track_angle m))

(cl:ensure-generic-function 'track_range-val :lambda-list '(m))
(cl:defmethod track_range-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_range-val is deprecated.  Use delphi_esr_msgs-msg:track_range instead.")
  (track_range m))

(cl:ensure-generic-function 'track_bridge_object-val :lambda-list '(m))
(cl:defmethod track_bridge_object-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_bridge_object-val is deprecated.  Use delphi_esr_msgs-msg:track_bridge_object instead.")
  (track_bridge_object m))

(cl:ensure-generic-function 'track_rolling_count-val :lambda-list '(m))
(cl:defmethod track_rolling_count-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_rolling_count-val is deprecated.  Use delphi_esr_msgs-msg:track_rolling_count instead.")
  (track_rolling_count m))

(cl:ensure-generic-function 'track_width-val :lambda-list '(m))
(cl:defmethod track_width-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_width-val is deprecated.  Use delphi_esr_msgs-msg:track_width instead.")
  (track_width m))

(cl:ensure-generic-function 'track_range_accel-val :lambda-list '(m))
(cl:defmethod track_range_accel-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_range_accel-val is deprecated.  Use delphi_esr_msgs-msg:track_range_accel instead.")
  (track_range_accel m))

(cl:ensure-generic-function 'track_med_range_mode-val :lambda-list '(m))
(cl:defmethod track_med_range_mode-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_med_range_mode-val is deprecated.  Use delphi_esr_msgs-msg:track_med_range_mode instead.")
  (track_med_range_mode m))

(cl:ensure-generic-function 'track_range_rate-val :lambda-list '(m))
(cl:defmethod track_range_rate-val ((m <EsrTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:track_range_rate-val is deprecated.  Use delphi_esr_msgs-msg:track_range_rate instead.")
  (track_range_rate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrTrack>) ostream)
  "Serializes a message object of type '<EsrTrack>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'canmsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'canmsg))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_lat_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'track_group_changed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_status)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'track_bridge_object) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'track_rolling_count) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_range_accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_med_range_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'track_range_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrTrack>) istream)
  "Deserializes a message object of type '<EsrTrack>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'canmsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'canmsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_ID)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_lat_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'track_group_changed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_status)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'track_bridge_object) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'track_rolling_count) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_range_accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_med_range_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track_range_rate) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrTrack>)))
  "Returns string type for a message object of type '<EsrTrack>"
  "delphi_esr_msgs/EsrTrack")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrTrack)))
  "Returns string type for a message object of type 'EsrTrack"
  "delphi_esr_msgs/EsrTrack")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrTrack>)))
  "Returns md5sum for a message object of type '<EsrTrack>"
  "0a9beb5caea714982a56115450f110c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrTrack)))
  "Returns md5sum for a message object of type 'EsrTrack"
  "0a9beb5caea714982a56115450f110c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrTrack>)))
  "Returns full string definition for message of type '<EsrTrack>"
  (cl:format cl:nil "Header header~%~%# ESR Track Msg~%string        canmsg~%uint8         track_ID~%float32       track_lat_rate~%bool          track_group_changed~%uint8         track_status~%float32       track_angle~%float32       track_range~%bool          track_bridge_object~%bool          track_rolling_count~%float32       track_width~%float32       track_range_accel~%uint8         track_med_range_mode~%float32       track_range_rate~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrTrack)))
  "Returns full string definition for message of type 'EsrTrack"
  (cl:format cl:nil "Header header~%~%# ESR Track Msg~%string        canmsg~%uint8         track_ID~%float32       track_lat_rate~%bool          track_group_changed~%uint8         track_status~%float32       track_angle~%float32       track_range~%bool          track_bridge_object~%bool          track_rolling_count~%float32       track_width~%float32       track_range_accel~%uint8         track_med_range_mode~%float32       track_range_rate~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrTrack>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'canmsg))
     1
     4
     1
     1
     4
     4
     1
     1
     4
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrTrack>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrTrack
    (cl:cons ':header (header msg))
    (cl:cons ':canmsg (canmsg msg))
    (cl:cons ':track_ID (track_ID msg))
    (cl:cons ':track_lat_rate (track_lat_rate msg))
    (cl:cons ':track_group_changed (track_group_changed msg))
    (cl:cons ':track_status (track_status msg))
    (cl:cons ':track_angle (track_angle msg))
    (cl:cons ':track_range (track_range msg))
    (cl:cons ':track_bridge_object (track_bridge_object msg))
    (cl:cons ':track_rolling_count (track_rolling_count msg))
    (cl:cons ':track_width (track_width msg))
    (cl:cons ':track_range_accel (track_range_accel msg))
    (cl:cons ':track_med_range_mode (track_med_range_mode msg))
    (cl:cons ':track_range_rate (track_range_rate msg))
))
