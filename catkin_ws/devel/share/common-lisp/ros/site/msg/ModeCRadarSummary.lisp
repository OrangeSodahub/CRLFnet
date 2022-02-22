; Auto-generated. Do not edit!


(cl:in-package site-msg)


;//! \htmlinclude ModeCRadarSummary.msg.html

(cl:defclass <ModeCRadarSummary> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (contacts
    :reader contacts
    :initarg :contacts
    :type (cl:vector site-msg:ModeCRadar)
   :initform (cl:make-array 0 :element-type 'site-msg:ModeCRadar :initial-element (cl:make-instance 'site-msg:ModeCRadar))))
)

(cl:defclass ModeCRadarSummary (<ModeCRadarSummary>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModeCRadarSummary>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModeCRadarSummary)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name site-msg:<ModeCRadarSummary> is deprecated: use site-msg:ModeCRadarSummary instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ModeCRadarSummary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader site-msg:header-val is deprecated.  Use site-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'contacts-val :lambda-list '(m))
(cl:defmethod contacts-val ((m <ModeCRadarSummary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader site-msg:contacts-val is deprecated.  Use site-msg:contacts instead.")
  (contacts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModeCRadarSummary>) ostream)
  "Serializes a message object of type '<ModeCRadarSummary>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'contacts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'contacts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModeCRadarSummary>) istream)
  "Deserializes a message object of type '<ModeCRadarSummary>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'contacts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'contacts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'site-msg:ModeCRadar))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModeCRadarSummary>)))
  "Returns string type for a message object of type '<ModeCRadarSummary>"
  "site/ModeCRadarSummary")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModeCRadarSummary)))
  "Returns string type for a message object of type 'ModeCRadarSummary"
  "site/ModeCRadarSummary")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModeCRadarSummary>)))
  "Returns md5sum for a message object of type '<ModeCRadarSummary>"
  "98cae80bd5cdf50d70e731ef44eb76ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModeCRadarSummary)))
  "Returns md5sum for a message object of type 'ModeCRadarSummary"
  "98cae80bd5cdf50d70e731ef44eb76ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModeCRadarSummary>)))
  "Returns full string definition for message of type '<ModeCRadarSummary>"
  (cl:format cl:nil "Header header~%ModeCRadar[] contacts~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: site/ModeCRadar~%Header header~%float32 range  # meters~%float32 bearing  # radians clockwise about Z axis of header frame~%float32 altitude  # Pressure altitude (m)~%uint16 code # Transponder code~%bool ident  # If ident button was pressed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModeCRadarSummary)))
  "Returns full string definition for message of type 'ModeCRadarSummary"
  (cl:format cl:nil "Header header~%ModeCRadar[] contacts~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: site/ModeCRadar~%Header header~%float32 range  # meters~%float32 bearing  # radians clockwise about Z axis of header frame~%float32 altitude  # Pressure altitude (m)~%uint16 code # Transponder code~%bool ident  # If ident button was pressed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModeCRadarSummary>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'contacts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModeCRadarSummary>))
  "Converts a ROS message object to a list"
  (cl:list 'ModeCRadarSummary
    (cl:cons ':header (header msg))
    (cl:cons ':contacts (contacts msg))
))
