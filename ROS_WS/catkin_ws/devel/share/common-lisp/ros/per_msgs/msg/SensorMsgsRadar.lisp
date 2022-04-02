; Auto-generated. Do not edit!


(cl:in-package per_msgs-msg)


;//! \htmlinclude SensorMsgsRadar.msg.html

(cl:defclass <SensorMsgsRadar> (roslisp-msg-protocol:ros-message)
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
   (total_front_esr_tracks
    :reader total_front_esr_tracks
    :initarg :total_front_esr_tracks
    :type cl:float
    :initform 0.0)
   (total_front_right_esr_tracks
    :reader total_front_right_esr_tracks
    :initarg :total_front_right_esr_tracks
    :type cl:float
    :initform 0.0)
   (total_front_left_esr_tracks
    :reader total_front_left_esr_tracks
    :initarg :total_front_left_esr_tracks
    :type cl:float
    :initform 0.0)
   (front_esr_tracker_counter
    :reader front_esr_tracker_counter
    :initarg :front_esr_tracker_counter
    :type cl:float
    :initform 0.0)
   (front_left_esr_tracker_counter
    :reader front_left_esr_tracker_counter
    :initarg :front_left_esr_tracker_counter
    :type cl:float
    :initform 0.0)
   (front_right_esr_tracker_counter
    :reader front_right_esr_tracker_counter
    :initarg :front_right_esr_tracker_counter
    :type cl:float
    :initform 0.0)
   (total_rear_sbmp_tracks
    :reader total_rear_sbmp_tracks
    :initarg :total_rear_sbmp_tracks
    :type cl:float
    :initform 0.0)
   (rear_sbmp_tracker_counter
    :reader rear_sbmp_tracker_counter
    :initarg :rear_sbmp_tracker_counter
    :type cl:float
    :initform 0.0)
   (rear_sbmp_tracklist
    :reader rear_sbmp_tracklist
    :initarg :rear_sbmp_tracklist
    :type cl:float
    :initform 0.0)
   (total_fsm4_tracks
    :reader total_fsm4_tracks
    :initarg :total_fsm4_tracks
    :type cl:float
    :initform 0.0)
   (fsm4_tracklist
    :reader fsm4_tracklist
    :initarg :fsm4_tracklist
    :type cl:float
    :initform 0.0)
   (fsm4_tracker_counter
    :reader fsm4_tracker_counter
    :initarg :fsm4_tracker_counter
    :type cl:float
    :initform 0.0)
   (front_esr_tracklist
    :reader front_esr_tracklist
    :initarg :front_esr_tracklist
    :type (cl:vector per_msgs-msg:GeometryMsgsRadarObject)
   :initform (cl:make-array 0 :element-type 'per_msgs-msg:GeometryMsgsRadarObject :initial-element (cl:make-instance 'per_msgs-msg:GeometryMsgsRadarObject)))
   (front_right_esr_tracklist
    :reader front_right_esr_tracklist
    :initarg :front_right_esr_tracklist
    :type (cl:vector per_msgs-msg:GeometryMsgsRadarObject)
   :initform (cl:make-array 0 :element-type 'per_msgs-msg:GeometryMsgsRadarObject :initial-element (cl:make-instance 'per_msgs-msg:GeometryMsgsRadarObject)))
   (front_left_esr_tracklist
    :reader front_left_esr_tracklist
    :initarg :front_left_esr_tracklist
    :type (cl:vector per_msgs-msg:GeometryMsgsRadarObject)
   :initform (cl:make-array 0 :element-type 'per_msgs-msg:GeometryMsgsRadarObject :initial-element (cl:make-instance 'per_msgs-msg:GeometryMsgsRadarObject))))
)

(cl:defclass SensorMsgsRadar (<SensorMsgsRadar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorMsgsRadar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorMsgsRadar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name per_msgs-msg:<SensorMsgsRadar> is deprecated: use per_msgs-msg:SensorMsgsRadar instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:header-val is deprecated.  Use per_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:range-val is deprecated.  Use per_msgs-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'total_front_esr_tracks-val :lambda-list '(m))
(cl:defmethod total_front_esr_tracks-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:total_front_esr_tracks-val is deprecated.  Use per_msgs-msg:total_front_esr_tracks instead.")
  (total_front_esr_tracks m))

(cl:ensure-generic-function 'total_front_right_esr_tracks-val :lambda-list '(m))
(cl:defmethod total_front_right_esr_tracks-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:total_front_right_esr_tracks-val is deprecated.  Use per_msgs-msg:total_front_right_esr_tracks instead.")
  (total_front_right_esr_tracks m))

(cl:ensure-generic-function 'total_front_left_esr_tracks-val :lambda-list '(m))
(cl:defmethod total_front_left_esr_tracks-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:total_front_left_esr_tracks-val is deprecated.  Use per_msgs-msg:total_front_left_esr_tracks instead.")
  (total_front_left_esr_tracks m))

(cl:ensure-generic-function 'front_esr_tracker_counter-val :lambda-list '(m))
(cl:defmethod front_esr_tracker_counter-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:front_esr_tracker_counter-val is deprecated.  Use per_msgs-msg:front_esr_tracker_counter instead.")
  (front_esr_tracker_counter m))

(cl:ensure-generic-function 'front_left_esr_tracker_counter-val :lambda-list '(m))
(cl:defmethod front_left_esr_tracker_counter-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:front_left_esr_tracker_counter-val is deprecated.  Use per_msgs-msg:front_left_esr_tracker_counter instead.")
  (front_left_esr_tracker_counter m))

(cl:ensure-generic-function 'front_right_esr_tracker_counter-val :lambda-list '(m))
(cl:defmethod front_right_esr_tracker_counter-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:front_right_esr_tracker_counter-val is deprecated.  Use per_msgs-msg:front_right_esr_tracker_counter instead.")
  (front_right_esr_tracker_counter m))

(cl:ensure-generic-function 'total_rear_sbmp_tracks-val :lambda-list '(m))
(cl:defmethod total_rear_sbmp_tracks-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:total_rear_sbmp_tracks-val is deprecated.  Use per_msgs-msg:total_rear_sbmp_tracks instead.")
  (total_rear_sbmp_tracks m))

(cl:ensure-generic-function 'rear_sbmp_tracker_counter-val :lambda-list '(m))
(cl:defmethod rear_sbmp_tracker_counter-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:rear_sbmp_tracker_counter-val is deprecated.  Use per_msgs-msg:rear_sbmp_tracker_counter instead.")
  (rear_sbmp_tracker_counter m))

(cl:ensure-generic-function 'rear_sbmp_tracklist-val :lambda-list '(m))
(cl:defmethod rear_sbmp_tracklist-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:rear_sbmp_tracklist-val is deprecated.  Use per_msgs-msg:rear_sbmp_tracklist instead.")
  (rear_sbmp_tracklist m))

(cl:ensure-generic-function 'total_fsm4_tracks-val :lambda-list '(m))
(cl:defmethod total_fsm4_tracks-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:total_fsm4_tracks-val is deprecated.  Use per_msgs-msg:total_fsm4_tracks instead.")
  (total_fsm4_tracks m))

(cl:ensure-generic-function 'fsm4_tracklist-val :lambda-list '(m))
(cl:defmethod fsm4_tracklist-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:fsm4_tracklist-val is deprecated.  Use per_msgs-msg:fsm4_tracklist instead.")
  (fsm4_tracklist m))

(cl:ensure-generic-function 'fsm4_tracker_counter-val :lambda-list '(m))
(cl:defmethod fsm4_tracker_counter-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:fsm4_tracker_counter-val is deprecated.  Use per_msgs-msg:fsm4_tracker_counter instead.")
  (fsm4_tracker_counter m))

(cl:ensure-generic-function 'front_esr_tracklist-val :lambda-list '(m))
(cl:defmethod front_esr_tracklist-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:front_esr_tracklist-val is deprecated.  Use per_msgs-msg:front_esr_tracklist instead.")
  (front_esr_tracklist m))

(cl:ensure-generic-function 'front_right_esr_tracklist-val :lambda-list '(m))
(cl:defmethod front_right_esr_tracklist-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:front_right_esr_tracklist-val is deprecated.  Use per_msgs-msg:front_right_esr_tracklist instead.")
  (front_right_esr_tracklist m))

(cl:ensure-generic-function 'front_left_esr_tracklist-val :lambda-list '(m))
(cl:defmethod front_left_esr_tracklist-val ((m <SensorMsgsRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader per_msgs-msg:front_left_esr_tracklist-val is deprecated.  Use per_msgs-msg:front_left_esr_tracklist instead.")
  (front_left_esr_tracklist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorMsgsRadar>) ostream)
  "Serializes a message object of type '<SensorMsgsRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_front_esr_tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_front_right_esr_tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_front_left_esr_tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'front_esr_tracker_counter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'front_left_esr_tracker_counter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'front_right_esr_tracker_counter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_rear_sbmp_tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rear_sbmp_tracker_counter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rear_sbmp_tracklist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_fsm4_tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fsm4_tracklist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fsm4_tracker_counter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'front_esr_tracklist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'front_esr_tracklist))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'front_right_esr_tracklist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'front_right_esr_tracklist))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'front_left_esr_tracklist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'front_left_esr_tracklist))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorMsgsRadar>) istream)
  "Deserializes a message object of type '<SensorMsgsRadar>"
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
    (cl:setf (cl:slot-value msg 'total_front_esr_tracks) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_front_right_esr_tracks) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_front_left_esr_tracks) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'front_esr_tracker_counter) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'front_left_esr_tracker_counter) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'front_right_esr_tracker_counter) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_rear_sbmp_tracks) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rear_sbmp_tracker_counter) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rear_sbmp_tracklist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_fsm4_tracks) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fsm4_tracklist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fsm4_tracker_counter) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'front_esr_tracklist) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'front_esr_tracklist)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'per_msgs-msg:GeometryMsgsRadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'front_right_esr_tracklist) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'front_right_esr_tracklist)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'per_msgs-msg:GeometryMsgsRadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'front_left_esr_tracklist) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'front_left_esr_tracklist)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'per_msgs-msg:GeometryMsgsRadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorMsgsRadar>)))
  "Returns string type for a message object of type '<SensorMsgsRadar>"
  "per_msgs/SensorMsgsRadar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorMsgsRadar)))
  "Returns string type for a message object of type 'SensorMsgsRadar"
  "per_msgs/SensorMsgsRadar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorMsgsRadar>)))
  "Returns md5sum for a message object of type '<SensorMsgsRadar>"
  "0c024c9d8ad963f855e814137a581c47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorMsgsRadar)))
  "Returns md5sum for a message object of type 'SensorMsgsRadar"
  "0c024c9d8ad963f855e814137a581c47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorMsgsRadar>)))
  "Returns full string definition for message of type '<SensorMsgsRadar>"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 total_front_esr_tracks~%float32 total_front_right_esr_tracks~%float32 total_front_left_esr_tracks~%float32 front_esr_tracker_counter~%float32 front_left_esr_tracker_counter~%float32 front_right_esr_tracker_counter~%float32 total_rear_sbmp_tracks~%float32 rear_sbmp_tracker_counter~%float32 rear_sbmp_tracklist~%float32 total_fsm4_tracks~%float32 fsm4_tracklist~%float32 fsm4_tracker_counter~%GeometryMsgsRadarObject[] front_esr_tracklist~%GeometryMsgsRadarObject[] front_right_esr_tracklist~%GeometryMsgsRadarObject[] front_left_esr_tracklist~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: per_msgs/GeometryMsgsRadarObject~%Header header~%float32 range  # meters~%float32 range_rate #velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorMsgsRadar)))
  "Returns full string definition for message of type 'SensorMsgsRadar"
  (cl:format cl:nil "Header header~%float32 range  # meters~%float32 total_front_esr_tracks~%float32 total_front_right_esr_tracks~%float32 total_front_left_esr_tracks~%float32 front_esr_tracker_counter~%float32 front_left_esr_tracker_counter~%float32 front_right_esr_tracker_counter~%float32 total_rear_sbmp_tracks~%float32 rear_sbmp_tracker_counter~%float32 rear_sbmp_tracklist~%float32 total_fsm4_tracks~%float32 fsm4_tracklist~%float32 fsm4_tracker_counter~%GeometryMsgsRadarObject[] front_esr_tracklist~%GeometryMsgsRadarObject[] front_right_esr_tracklist~%GeometryMsgsRadarObject[] front_left_esr_tracklist~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: per_msgs/GeometryMsgsRadarObject~%Header header~%float32 range  # meters~%float32 range_rate #velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorMsgsRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'front_esr_tracklist) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'front_right_esr_tracklist) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'front_left_esr_tracklist) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorMsgsRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorMsgsRadar
    (cl:cons ':header (header msg))
    (cl:cons ':range (range msg))
    (cl:cons ':total_front_esr_tracks (total_front_esr_tracks msg))
    (cl:cons ':total_front_right_esr_tracks (total_front_right_esr_tracks msg))
    (cl:cons ':total_front_left_esr_tracks (total_front_left_esr_tracks msg))
    (cl:cons ':front_esr_tracker_counter (front_esr_tracker_counter msg))
    (cl:cons ':front_left_esr_tracker_counter (front_left_esr_tracker_counter msg))
    (cl:cons ':front_right_esr_tracker_counter (front_right_esr_tracker_counter msg))
    (cl:cons ':total_rear_sbmp_tracks (total_rear_sbmp_tracks msg))
    (cl:cons ':rear_sbmp_tracker_counter (rear_sbmp_tracker_counter msg))
    (cl:cons ':rear_sbmp_tracklist (rear_sbmp_tracklist msg))
    (cl:cons ':total_fsm4_tracks (total_fsm4_tracks msg))
    (cl:cons ':fsm4_tracklist (fsm4_tracklist msg))
    (cl:cons ':fsm4_tracker_counter (fsm4_tracker_counter msg))
    (cl:cons ':front_esr_tracklist (front_esr_tracklist msg))
    (cl:cons ':front_right_esr_tracklist (front_right_esr_tracklist msg))
    (cl:cons ':front_left_esr_tracklist (front_left_esr_tracklist msg))
))
