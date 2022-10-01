; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude MsgRadCam.msg.html

(cl:defclass <MsgRadCam> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (num_overpass
    :reader num_overpass
    :initarg :num_overpass
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MsgRadCam (<MsgRadCam>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgRadCam>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgRadCam)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<MsgRadCam> is deprecated: use msgs-msg:MsgRadCam instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:header-val is deprecated.  Use msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'num_overpass-val :lambda-list '(m))
(cl:defmethod num_overpass-val ((m <MsgRadCam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:num_overpass-val is deprecated.  Use msgs-msg:num_overpass instead.")
  (num_overpass m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRadCam>) ostream)
  "Serializes a message object of type '<MsgRadCam>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_overpass)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRadCam>) istream)
  "Deserializes a message object of type '<MsgRadCam>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_overpass)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgRadCam>)))
  "Returns string type for a message object of type '<MsgRadCam>"
  "msgs/MsgRadCam")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgRadCam)))
  "Returns string type for a message object of type 'MsgRadCam"
  "msgs/MsgRadCam")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgRadCam>)))
  "Returns md5sum for a message object of type '<MsgRadCam>"
  "6c5400334bac6c91e919c72dca73df9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRadCam)))
  "Returns md5sum for a message object of type 'MsgRadCam"
  "6c5400334bac6c91e919c72dca73df9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRadCam>)))
  "Returns full string definition for message of type '<MsgRadCam>"
  (cl:format cl:nil "Header header~%uint8 num_overpass~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRadCam)))
  "Returns full string definition for message of type 'MsgRadCam"
  (cl:format cl:nil "Header header~%uint8 num_overpass~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRadCam>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRadCam>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRadCam
    (cl:cons ':header (header msg))
    (cl:cons ':num_overpass (num_overpass msg))
))
