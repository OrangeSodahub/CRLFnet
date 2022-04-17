; Auto-generated. Do not edit!


(cl:in-package radar_msgs-msg)


;//! \htmlinclude MsgRadar.msg.html

(cl:defclass <MsgRadar> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (total_vehicles
    :reader total_vehicles
    :initarg :total_vehicles
    :type cl:float
    :initform 0.0)
   (ObjectList
    :reader ObjectList
    :initarg :ObjectList
    :type (cl:vector radar_msgs-msg:MsgObject)
   :initform (cl:make-array 0 :element-type 'radar_msgs-msg:MsgObject :initial-element (cl:make-instance 'radar_msgs-msg:MsgObject))))
)

(cl:defclass MsgRadar (<MsgRadar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgRadar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgRadar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name radar_msgs-msg:<MsgRadar> is deprecated: use radar_msgs-msg:MsgRadar instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_msgs-msg:header-val is deprecated.  Use radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'total_vehicles-val :lambda-list '(m))
(cl:defmethod total_vehicles-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_msgs-msg:total_vehicles-val is deprecated.  Use radar_msgs-msg:total_vehicles instead.")
  (total_vehicles m))

(cl:ensure-generic-function 'ObjectList-val :lambda-list '(m))
(cl:defmethod ObjectList-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_msgs-msg:ObjectList-val is deprecated.  Use radar_msgs-msg:ObjectList instead.")
  (ObjectList m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRadar>) ostream)
  "Serializes a message object of type '<MsgRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'total_vehicles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ObjectList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ObjectList))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRadar>) istream)
  "Deserializes a message object of type '<MsgRadar>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_vehicles) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ObjectList) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ObjectList)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'radar_msgs-msg:MsgObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgRadar>)))
  "Returns string type for a message object of type '<MsgRadar>"
  "radar_msgs/MsgRadar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgRadar)))
  "Returns string type for a message object of type 'MsgRadar"
  "radar_msgs/MsgRadar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgRadar>)))
  "Returns md5sum for a message object of type '<MsgRadar>"
  "6c979660ea9f3cab98f883793f57d5c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRadar)))
  "Returns md5sum for a message object of type 'MsgRadar"
  "6c979660ea9f3cab98f883793f57d5c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRadar>)))
  "Returns full string definition for message of type '<MsgRadar>"
  (cl:format cl:nil "Header header~%float32 total_vehicles~%MsgObject[] ObjectList~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: radar_msgs/MsgObject~%Header header~%float32 range  # meters~%float32 range_rate # velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRadar)))
  "Returns full string definition for message of type 'MsgRadar"
  (cl:format cl:nil "Header header~%float32 total_vehicles~%MsgObject[] ObjectList~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: radar_msgs/MsgObject~%Header header~%float32 range  # meters~%float32 range_rate # velocity~%float32 angle_centroid~%float32 obj_vcs_posex~%float32 obj_vcs_posey~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ObjectList) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRadar
    (cl:cons ':header (header msg))
    (cl:cons ':total_vehicles (total_vehicles msg))
    (cl:cons ':ObjectList (ObjectList msg))
))
