; Auto-generated. Do not edit!


(cl:in-package delphi_esr_msgs-msg)


;//! \htmlinclude EsrVehicle2.msg.html

(cl:defclass <EsrVehicle2> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (scan_index_ack
    :reader scan_index_ack
    :initarg :scan_index_ack
    :type cl:fixnum
    :initform 0)
   (use_angle_misalignment
    :reader use_angle_misalignment
    :initarg :use_angle_misalignment
    :type cl:boolean
    :initform cl:nil)
   (clear_faults
    :reader clear_faults
    :initarg :clear_faults
    :type cl:boolean
    :initform cl:nil)
   (high_yaw_angle
    :reader high_yaw_angle
    :initarg :high_yaw_angle
    :type cl:fixnum
    :initform 0)
   (mr_only_transmit
    :reader mr_only_transmit
    :initarg :mr_only_transmit
    :type cl:boolean
    :initform cl:nil)
   (lr_only_transmit
    :reader lr_only_transmit
    :initarg :lr_only_transmit
    :type cl:boolean
    :initform cl:nil)
   (angle_misalignment
    :reader angle_misalignment
    :initarg :angle_misalignment
    :type cl:float
    :initform 0.0)
   (lateral_mounting_offset
    :reader lateral_mounting_offset
    :initarg :lateral_mounting_offset
    :type cl:float
    :initform 0.0)
   (radar_cmd_radiate
    :reader radar_cmd_radiate
    :initarg :radar_cmd_radiate
    :type cl:boolean
    :initform cl:nil)
   (blockage_disable
    :reader blockage_disable
    :initarg :blockage_disable
    :type cl:boolean
    :initform cl:nil)
   (maximum_tracks
    :reader maximum_tracks
    :initarg :maximum_tracks
    :type cl:fixnum
    :initform 0)
   (turn_signal_status
    :reader turn_signal_status
    :initarg :turn_signal_status
    :type cl:fixnum
    :initform 0)
   (vehicle_speed_valid
    :reader vehicle_speed_valid
    :initarg :vehicle_speed_valid
    :type cl:boolean
    :initform cl:nil)
   (mmr_upside_down
    :reader mmr_upside_down
    :initarg :mmr_upside_down
    :type cl:boolean
    :initform cl:nil)
   (grouping_mode
    :reader grouping_mode
    :initarg :grouping_mode
    :type cl:fixnum
    :initform 0)
   (wiper_status
    :reader wiper_status
    :initarg :wiper_status
    :type cl:boolean
    :initform cl:nil)
   (raw_data_enabled
    :reader raw_data_enabled
    :initarg :raw_data_enabled
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass EsrVehicle2 (<EsrVehicle2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EsrVehicle2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EsrVehicle2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delphi_esr_msgs-msg:<EsrVehicle2> is deprecated: use delphi_esr_msgs-msg:EsrVehicle2 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:header-val is deprecated.  Use delphi_esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'scan_index_ack-val :lambda-list '(m))
(cl:defmethod scan_index_ack-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:scan_index_ack-val is deprecated.  Use delphi_esr_msgs-msg:scan_index_ack instead.")
  (scan_index_ack m))

(cl:ensure-generic-function 'use_angle_misalignment-val :lambda-list '(m))
(cl:defmethod use_angle_misalignment-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:use_angle_misalignment-val is deprecated.  Use delphi_esr_msgs-msg:use_angle_misalignment instead.")
  (use_angle_misalignment m))

(cl:ensure-generic-function 'clear_faults-val :lambda-list '(m))
(cl:defmethod clear_faults-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:clear_faults-val is deprecated.  Use delphi_esr_msgs-msg:clear_faults instead.")
  (clear_faults m))

(cl:ensure-generic-function 'high_yaw_angle-val :lambda-list '(m))
(cl:defmethod high_yaw_angle-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:high_yaw_angle-val is deprecated.  Use delphi_esr_msgs-msg:high_yaw_angle instead.")
  (high_yaw_angle m))

(cl:ensure-generic-function 'mr_only_transmit-val :lambda-list '(m))
(cl:defmethod mr_only_transmit-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mr_only_transmit-val is deprecated.  Use delphi_esr_msgs-msg:mr_only_transmit instead.")
  (mr_only_transmit m))

(cl:ensure-generic-function 'lr_only_transmit-val :lambda-list '(m))
(cl:defmethod lr_only_transmit-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lr_only_transmit-val is deprecated.  Use delphi_esr_msgs-msg:lr_only_transmit instead.")
  (lr_only_transmit m))

(cl:ensure-generic-function 'angle_misalignment-val :lambda-list '(m))
(cl:defmethod angle_misalignment-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:angle_misalignment-val is deprecated.  Use delphi_esr_msgs-msg:angle_misalignment instead.")
  (angle_misalignment m))

(cl:ensure-generic-function 'lateral_mounting_offset-val :lambda-list '(m))
(cl:defmethod lateral_mounting_offset-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:lateral_mounting_offset-val is deprecated.  Use delphi_esr_msgs-msg:lateral_mounting_offset instead.")
  (lateral_mounting_offset m))

(cl:ensure-generic-function 'radar_cmd_radiate-val :lambda-list '(m))
(cl:defmethod radar_cmd_radiate-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:radar_cmd_radiate-val is deprecated.  Use delphi_esr_msgs-msg:radar_cmd_radiate instead.")
  (radar_cmd_radiate m))

(cl:ensure-generic-function 'blockage_disable-val :lambda-list '(m))
(cl:defmethod blockage_disable-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:blockage_disable-val is deprecated.  Use delphi_esr_msgs-msg:blockage_disable instead.")
  (blockage_disable m))

(cl:ensure-generic-function 'maximum_tracks-val :lambda-list '(m))
(cl:defmethod maximum_tracks-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:maximum_tracks-val is deprecated.  Use delphi_esr_msgs-msg:maximum_tracks instead.")
  (maximum_tracks m))

(cl:ensure-generic-function 'turn_signal_status-val :lambda-list '(m))
(cl:defmethod turn_signal_status-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:turn_signal_status-val is deprecated.  Use delphi_esr_msgs-msg:turn_signal_status instead.")
  (turn_signal_status m))

(cl:ensure-generic-function 'vehicle_speed_valid-val :lambda-list '(m))
(cl:defmethod vehicle_speed_valid-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:vehicle_speed_valid-val is deprecated.  Use delphi_esr_msgs-msg:vehicle_speed_valid instead.")
  (vehicle_speed_valid m))

(cl:ensure-generic-function 'mmr_upside_down-val :lambda-list '(m))
(cl:defmethod mmr_upside_down-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:mmr_upside_down-val is deprecated.  Use delphi_esr_msgs-msg:mmr_upside_down instead.")
  (mmr_upside_down m))

(cl:ensure-generic-function 'grouping_mode-val :lambda-list '(m))
(cl:defmethod grouping_mode-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:grouping_mode-val is deprecated.  Use delphi_esr_msgs-msg:grouping_mode instead.")
  (grouping_mode m))

(cl:ensure-generic-function 'wiper_status-val :lambda-list '(m))
(cl:defmethod wiper_status-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:wiper_status-val is deprecated.  Use delphi_esr_msgs-msg:wiper_status instead.")
  (wiper_status m))

(cl:ensure-generic-function 'raw_data_enabled-val :lambda-list '(m))
(cl:defmethod raw_data_enabled-val ((m <EsrVehicle2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delphi_esr_msgs-msg:raw_data_enabled-val is deprecated.  Use delphi_esr_msgs-msg:raw_data_enabled instead.")
  (raw_data_enabled m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EsrVehicle2>) ostream)
  "Serializes a message object of type '<EsrVehicle2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scan_index_ack)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scan_index_ack)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'use_angle_misalignment) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear_faults) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'high_yaw_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mr_only_transmit) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lr_only_transmit) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle_misalignment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lateral_mounting_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'radar_cmd_radiate) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blockage_disable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maximum_tracks)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'turn_signal_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'vehicle_speed_valid) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mmr_upside_down) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'grouping_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wiper_status) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'raw_data_enabled) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EsrVehicle2>) istream)
  "Deserializes a message object of type '<EsrVehicle2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scan_index_ack)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scan_index_ack)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'use_angle_misalignment) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'clear_faults) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'high_yaw_angle) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'mr_only_transmit) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'lr_only_transmit) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_misalignment) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateral_mounting_offset) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'radar_cmd_radiate) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blockage_disable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maximum_tracks)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'turn_signal_status)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vehicle_speed_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'mmr_upside_down) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'grouping_mode)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wiper_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'raw_data_enabled) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EsrVehicle2>)))
  "Returns string type for a message object of type '<EsrVehicle2>"
  "delphi_esr_msgs/EsrVehicle2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EsrVehicle2)))
  "Returns string type for a message object of type 'EsrVehicle2"
  "delphi_esr_msgs/EsrVehicle2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EsrVehicle2>)))
  "Returns md5sum for a message object of type '<EsrVehicle2>"
  "034f7a7ed6d34122e2b7d043548b7f0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EsrVehicle2)))
  "Returns md5sum for a message object of type 'EsrVehicle2"
  "034f7a7ed6d34122e2b7d043548b7f0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EsrVehicle2>)))
  "Returns full string definition for message of type '<EsrVehicle2>"
  (cl:format cl:nil "Header header~%~%# ESR vehicle2~%uint16      scan_index_ack~%bool        use_angle_misalignment~%bool        clear_faults~%int8        high_yaw_angle~%bool        mr_only_transmit~%bool        lr_only_transmit~%float32     angle_misalignment~%float32     lateral_mounting_offset~%bool        radar_cmd_radiate~%bool        blockage_disable~%uint8       maximum_tracks~%uint8       turn_signal_status~%bool        vehicle_speed_valid~%bool        mmr_upside_down~%uint8       grouping_mode~%bool        wiper_status~%bool        raw_data_enabled~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EsrVehicle2)))
  "Returns full string definition for message of type 'EsrVehicle2"
  (cl:format cl:nil "Header header~%~%# ESR vehicle2~%uint16      scan_index_ack~%bool        use_angle_misalignment~%bool        clear_faults~%int8        high_yaw_angle~%bool        mr_only_transmit~%bool        lr_only_transmit~%float32     angle_misalignment~%float32     lateral_mounting_offset~%bool        radar_cmd_radiate~%bool        blockage_disable~%uint8       maximum_tracks~%uint8       turn_signal_status~%bool        vehicle_speed_valid~%bool        mmr_upside_down~%uint8       grouping_mode~%bool        wiper_status~%bool        raw_data_enabled~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EsrVehicle2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     1
     1
     1
     1
     1
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EsrVehicle2>))
  "Converts a ROS message object to a list"
  (cl:list 'EsrVehicle2
    (cl:cons ':header (header msg))
    (cl:cons ':scan_index_ack (scan_index_ack msg))
    (cl:cons ':use_angle_misalignment (use_angle_misalignment msg))
    (cl:cons ':clear_faults (clear_faults msg))
    (cl:cons ':high_yaw_angle (high_yaw_angle msg))
    (cl:cons ':mr_only_transmit (mr_only_transmit msg))
    (cl:cons ':lr_only_transmit (lr_only_transmit msg))
    (cl:cons ':angle_misalignment (angle_misalignment msg))
    (cl:cons ':lateral_mounting_offset (lateral_mounting_offset msg))
    (cl:cons ':radar_cmd_radiate (radar_cmd_radiate msg))
    (cl:cons ':blockage_disable (blockage_disable msg))
    (cl:cons ':maximum_tracks (maximum_tracks msg))
    (cl:cons ':turn_signal_status (turn_signal_status msg))
    (cl:cons ':vehicle_speed_valid (vehicle_speed_valid msg))
    (cl:cons ':mmr_upside_down (mmr_upside_down msg))
    (cl:cons ':grouping_mode (grouping_mode msg))
    (cl:cons ':wiper_status (wiper_status msg))
    (cl:cons ':raw_data_enabled (raw_data_enabled msg))
))
