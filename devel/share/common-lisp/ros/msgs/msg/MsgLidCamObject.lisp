; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgLidCamObject.msg.html

(cl:defclass <MsgLidCamObject> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (alpha
    :reader alpha
    :initarg :alpha
    :type cl:float
    :initform 0.0)
   (pos_x
    :reader pos_x
    :initarg :pos_x
    :type cl:float
    :initform 0.0)
   (pos_y
    :reader pos_y
    :initarg :pos_y
    :type cl:float
    :initform 0.0)
   (track_id
    :reader track_id
    :initarg :track_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MsgLidCamObject (<MsgLidCamObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgLidCamObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgLidCamObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<MsgLidCamObject> is deprecated: use msgs-msg:MsgLidCamObject instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgLidCamObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:header-val is deprecated.  Use msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'alpha-val :lambda-list '(m))
(cl:defmethod alpha-val ((m <MsgLidCamObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:alpha-val is deprecated.  Use msgs-msg:alpha instead.")
  (alpha m))

(cl:ensure-generic-function 'pos_x-val :lambda-list '(m))
(cl:defmethod pos_x-val ((m <MsgLidCamObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:pos_x-val is deprecated.  Use msgs-msg:pos_x instead.")
  (pos_x m))

(cl:ensure-generic-function 'pos_y-val :lambda-list '(m))
(cl:defmethod pos_y-val ((m <MsgLidCamObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:pos_y-val is deprecated.  Use msgs-msg:pos_y instead.")
  (pos_y m))

(cl:ensure-generic-function 'track_id-val :lambda-list '(m))
(cl:defmethod track_id-val ((m <MsgLidCamObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:track_id-val is deprecated.  Use msgs-msg:track_id instead.")
  (track_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgLidCamObject>) ostream)
  "Serializes a message object of type '<MsgLidCamObject>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'alpha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgLidCamObject>) istream)
  "Deserializes a message object of type '<MsgLidCamObject>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgLidCamObject>)))
  "Returns string type for a message object of type '<MsgLidCamObject>"
  "msgs/MsgLidCamObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgLidCamObject)))
  "Returns string type for a message object of type 'MsgLidCamObject"
  "msgs/MsgLidCamObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgLidCamObject>)))
  "Returns md5sum for a message object of type '<MsgLidCamObject>"
  "7c8b7292cb11f95b4598c6ce61ded5f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgLidCamObject)))
  "Returns md5sum for a message object of type 'MsgLidCamObject"
  "7c8b7292cb11f95b4598c6ce61ded5f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgLidCamObject>)))
  "Returns full string definition for message of type '<MsgLidCamObject>"
  (cl:format cl:nil "Header header~%float32 alpha~%float32 pos_x           # obj_vcs_posx~%float32 pos_y           # obj_vcs_posy~%uint8 track_id~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgLidCamObject)))
  "Returns full string definition for message of type 'MsgLidCamObject"
  (cl:format cl:nil "Header header~%float32 alpha~%float32 pos_x           # obj_vcs_posx~%float32 pos_y           # obj_vcs_posy~%uint8 track_id~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgLidCamObject>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgLidCamObject>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgLidCamObject
    (cl:cons ':header (header msg))
    (cl:cons ':alpha (alpha msg))
    (cl:cons ':pos_x (pos_x msg))
    (cl:cons ':pos_y (pos_y msg))
    (cl:cons ':track_id (track_id msg))
))
