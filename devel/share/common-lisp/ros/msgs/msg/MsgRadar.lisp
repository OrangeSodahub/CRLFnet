; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgRadar.msg.html

(cl:defclass <MsgRadar> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (total_vehicles_left
    :reader total_vehicles_left
    :initarg :total_vehicles_left
    :type cl:float
    :initform 0.0)
   (total_vehicles_right
    :reader total_vehicles_right
    :initarg :total_vehicles_right
    :type cl:float
    :initform 0.0)
   (ObjectList_left
    :reader ObjectList_left
    :initarg :ObjectList_left
    :type (cl:vector msgs-msg:MsgRadarObject)
   :initform (cl:make-array 0 :element-type 'msgs-msg:MsgRadarObject :initial-element (cl:make-instance 'msgs-msg:MsgRadarObject)))
   (ObjectList_right
    :reader ObjectList_right
    :initarg :ObjectList_right
    :type (cl:vector msgs-msg:MsgRadarObject)
   :initform (cl:make-array 0 :element-type 'msgs-msg:MsgRadarObject :initial-element (cl:make-instance 'msgs-msg:MsgRadarObject))))
)

(cl:defclass MsgRadar (<MsgRadar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgRadar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgRadar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<MsgRadar> is deprecated: use msgs-msg:MsgRadar instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:header-val is deprecated.  Use msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'total_vehicles_left-val :lambda-list '(m))
(cl:defmethod total_vehicles_left-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:total_vehicles_left-val is deprecated.  Use msgs-msg:total_vehicles_left instead.")
  (total_vehicles_left m))

(cl:ensure-generic-function 'total_vehicles_right-val :lambda-list '(m))
(cl:defmethod total_vehicles_right-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:total_vehicles_right-val is deprecated.  Use msgs-msg:total_vehicles_right instead.")
  (total_vehicles_right m))

(cl:ensure-generic-function 'ObjectList_left-val :lambda-list '(m))
(cl:defmethod ObjectList_left-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:ObjectList_left-val is deprecated.  Use msgs-msg:ObjectList_left instead.")
  (ObjectList_left m))

(cl:ensure-generic-function 'ObjectList_right-val :lambda-list '(m))
(cl:defmethod ObjectList_right-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:ObjectList_right-val is deprecated.  Use msgs-msg:ObjectList_right instead.")
  (ObjectList_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRadar>) ostream)
  "Serializes a message object of type '<MsgRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_vehicles_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_vehicles_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ObjectList_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ObjectList_left))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ObjectList_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ObjectList_right))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRadar>) istream)
  "Deserializes a message object of type '<MsgRadar>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_vehicles_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_vehicles_right) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ObjectList_left) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ObjectList_left)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'msgs-msg:MsgRadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ObjectList_right) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ObjectList_right)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'msgs-msg:MsgRadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgRadar>)))
  "Returns string type for a message object of type '<MsgRadar>"
  "msgs/MsgRadar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgRadar)))
  "Returns string type for a message object of type 'MsgRadar"
  "msgs/MsgRadar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgRadar>)))
  "Returns md5sum for a message object of type '<MsgRadar>"
  "a3c7315f9e8449ffdf3d76f6033062a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRadar)))
  "Returns md5sum for a message object of type 'MsgRadar"
  "a3c7315f9e8449ffdf3d76f6033062a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRadar>)))
  "Returns full string definition for message of type '<MsgRadar>"
  (cl:format cl:nil "Header header~%float32 total_vehicles_left~%float32 total_vehicles_right~%MsgRadarObject[] ObjectList_left~%MsgRadarObject[] ObjectList_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: msgs/MsgRadarObject~%Header header~%float32 range  # meters~%float32 range_rate # velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRadar)))
  "Returns full string definition for message of type 'MsgRadar"
  (cl:format cl:nil "Header header~%float32 total_vehicles_left~%float32 total_vehicles_right~%MsgRadarObject[] ObjectList_left~%MsgRadarObject[] ObjectList_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: msgs/MsgRadarObject~%Header header~%float32 range  # meters~%float32 range_rate # velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ObjectList_left) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ObjectList_right) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRadar
    (cl:cons ':header (header msg))
    (cl:cons ':total_vehicles_left (total_vehicles_left msg))
    (cl:cons ':total_vehicles_right (total_vehicles_right msg))
    (cl:cons ':ObjectList_left (ObjectList_left msg))
    (cl:cons ':ObjectList_right (ObjectList_right msg))
))
