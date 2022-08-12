; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgLidCam.msg.html

(cl:defclass <MsgLidCam> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (num_circle
    :reader num_circle
    :initarg :num_circle
    :type cl:fixnum
    :initform 0)
   (num_intersection
    :reader num_intersection
    :initarg :num_intersection
    :type cl:fixnum
    :initform 0)
   (objects_circle
    :reader objects_circle
    :initarg :objects_circle
    :type (cl:vector msgs-msg:MsgLidCamObject)
   :initform (cl:make-array 0 :element-type 'msgs-msg:MsgLidCamObject :initial-element (cl:make-instance 'msgs-msg:MsgLidCamObject)))
   (objects_intersection
    :reader objects_intersection
    :initarg :objects_intersection
    :type (cl:vector msgs-msg:MsgLidCamObject)
   :initform (cl:make-array 0 :element-type 'msgs-msg:MsgLidCamObject :initial-element (cl:make-instance 'msgs-msg:MsgLidCamObject))))
)

(cl:defclass MsgLidCam (<MsgLidCam>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgLidCam>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgLidCam)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<MsgLidCam> is deprecated: use msgs-msg:MsgLidCam instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgLidCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:header-val is deprecated.  Use msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'num_circle-val :lambda-list '(m))
(cl:defmethod num_circle-val ((m <MsgLidCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:num_circle-val is deprecated.  Use msgs-msg:num_circle instead.")
  (num_circle m))

(cl:ensure-generic-function 'num_intersection-val :lambda-list '(m))
(cl:defmethod num_intersection-val ((m <MsgLidCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:num_intersection-val is deprecated.  Use msgs-msg:num_intersection instead.")
  (num_intersection m))

(cl:ensure-generic-function 'objects_circle-val :lambda-list '(m))
(cl:defmethod objects_circle-val ((m <MsgLidCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:objects_circle-val is deprecated.  Use msgs-msg:objects_circle instead.")
  (objects_circle m))

(cl:ensure-generic-function 'objects_intersection-val :lambda-list '(m))
(cl:defmethod objects_intersection-val ((m <MsgLidCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:objects_intersection-val is deprecated.  Use msgs-msg:objects_intersection instead.")
  (objects_intersection m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgLidCam>) ostream)
  "Serializes a message object of type '<MsgLidCam>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_circle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_intersection)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects_circle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects_circle))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects_intersection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects_intersection))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgLidCam>) istream)
  "Deserializes a message object of type '<MsgLidCam>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_circle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_intersection)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects_circle) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects_circle)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'msgs-msg:MsgLidCamObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects_intersection) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects_intersection)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'msgs-msg:MsgLidCamObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgLidCam>)))
  "Returns string type for a message object of type '<MsgLidCam>"
  "msgs/MsgLidCam")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgLidCam)))
  "Returns string type for a message object of type 'MsgLidCam"
  "msgs/MsgLidCam")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgLidCam>)))
  "Returns md5sum for a message object of type '<MsgLidCam>"
  "92aac1a08f2584ca8ae9e3d8d796fb74")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgLidCam)))
  "Returns md5sum for a message object of type 'MsgLidCam"
  "92aac1a08f2584ca8ae9e3d8d796fb74")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgLidCam>)))
  "Returns full string definition for message of type '<MsgLidCam>"
  (cl:format cl:nil "Header header~%uint8 num_circle~%uint8 num_intersection~%MsgLidCamObject[] objects_circle~%MsgLidCamObject[] objects_intersection~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: msgs/MsgLidCamObject~%Header header~%float32 alpha~%float32 pos_x           # obj_vcs_posx~%float32 pos_y           # obj_vcs_posy~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgLidCam)))
  "Returns full string definition for message of type 'MsgLidCam"
  (cl:format cl:nil "Header header~%uint8 num_circle~%uint8 num_intersection~%MsgLidCamObject[] objects_circle~%MsgLidCamObject[] objects_intersection~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: msgs/MsgLidCamObject~%Header header~%float32 alpha~%float32 pos_x           # obj_vcs_posx~%float32 pos_y           # obj_vcs_posy~%uint8 track_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgLidCam>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects_circle) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects_intersection) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgLidCam>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgLidCam
    (cl:cons ':header (header msg))
    (cl:cons ':num_circle (num_circle msg))
    (cl:cons ':num_intersection (num_intersection msg))
    (cl:cons ':objects_circle (objects_circle msg))
    (cl:cons ':objects_intersection (objects_intersection msg))
))
