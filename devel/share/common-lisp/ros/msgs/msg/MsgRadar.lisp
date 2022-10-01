; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgRadar.msg.html

(cl:defclass <MsgRadar> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (num_left
    :reader num_left
    :initarg :num_left
    :type cl:fixnum
    :initform 0)
   (num_right
    :reader num_right
    :initarg :num_right
    :type cl:fixnum
    :initform 0)
   (objects_left
    :reader objects_left
    :initarg :objects_left
    :type (cl:vector msgs-msg:MsgRadarObject)
   :initform (cl:make-array 0 :element-type 'msgs-msg:MsgRadarObject :initial-element (cl:make-instance 'msgs-msg:MsgRadarObject)))
   (objects_right
    :reader objects_right
    :initarg :objects_right
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

(cl:ensure-generic-function 'num_left-val :lambda-list '(m))
(cl:defmethod num_left-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:num_left-val is deprecated.  Use msgs-msg:num_left instead.")
  (num_left m))

(cl:ensure-generic-function 'num_right-val :lambda-list '(m))
(cl:defmethod num_right-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:num_right-val is deprecated.  Use msgs-msg:num_right instead.")
  (num_right m))

(cl:ensure-generic-function 'objects_left-val :lambda-list '(m))
(cl:defmethod objects_left-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:objects_left-val is deprecated.  Use msgs-msg:objects_left instead.")
  (objects_left m))

(cl:ensure-generic-function 'objects_right-val :lambda-list '(m))
(cl:defmethod objects_right-val ((m <MsgRadar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:objects_right-val is deprecated.  Use msgs-msg:objects_right instead.")
  (objects_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRadar>) ostream)
  "Serializes a message object of type '<MsgRadar>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_right)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects_left))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects_right))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRadar>) istream)
  "Deserializes a message object of type '<MsgRadar>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_right)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects_left) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects_left)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'msgs-msg:MsgRadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects_right) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects_right)))
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
  "b60bab8d6e3388b4d94d6bd0bfb100f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRadar)))
  "Returns md5sum for a message object of type 'MsgRadar"
  "b60bab8d6e3388b4d94d6bd0bfb100f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRadar>)))
  "Returns full string definition for message of type '<MsgRadar>"
  (cl:format cl:nil "Header header~%uint8 num_left~%uint8 num_right~%MsgRadarObject[] objects_left~%MsgRadarObject[] objects_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: msgs/MsgRadarObject~%Header header~%float32 distance        # range~%float32 velocity        # range rate~%float32 angle_centroid~%float32 pos_x           # obj_vcs_posx~%float32 pos_y           # obj_vcs_posy~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRadar)))
  "Returns full string definition for message of type 'MsgRadar"
  (cl:format cl:nil "Header header~%uint8 num_left~%uint8 num_right~%MsgRadarObject[] objects_left~%MsgRadarObject[] objects_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: msgs/MsgRadarObject~%Header header~%float32 distance        # range~%float32 velocity        # range rate~%float32 angle_centroid~%float32 pos_x           # obj_vcs_posx~%float32 pos_y           # obj_vcs_posy~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRadar>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects_left) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects_right) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRadar>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRadar
    (cl:cons ':header (header msg))
    (cl:cons ':num_left (num_left msg))
    (cl:cons ':num_right (num_right msg))
    (cl:cons ':objects_left (objects_left msg))
    (cl:cons ':objects_right (objects_right msg))
))
