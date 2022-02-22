; Auto-generated. Do not edit!


(cl:in-package radar_pa_msgs-msg)


;//! \htmlinclude radar_msg.msg.html

(cl:defclass <radar_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data_A
    :reader data_A
    :initarg :data_A
    :type (cl:vector radar_pa_msgs-msg:radar_msg_A)
   :initform (cl:make-array 48 :element-type 'radar_pa_msgs-msg:radar_msg_A :initial-element (cl:make-instance 'radar_pa_msgs-msg:radar_msg_A)))
   (data_B
    :reader data_B
    :initarg :data_B
    :type (cl:vector radar_pa_msgs-msg:radar_msg_B)
   :initform (cl:make-array 48 :element-type 'radar_pa_msgs-msg:radar_msg_B :initial-element (cl:make-instance 'radar_pa_msgs-msg:radar_msg_B))))
)

(cl:defclass radar_msg (<radar_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <radar_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'radar_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name radar_pa_msgs-msg:<radar_msg> is deprecated: use radar_pa_msgs-msg:radar_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <radar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:header-val is deprecated.  Use radar_pa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data_A-val :lambda-list '(m))
(cl:defmethod data_A-val ((m <radar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:data_A-val is deprecated.  Use radar_pa_msgs-msg:data_A instead.")
  (data_A m))

(cl:ensure-generic-function 'data_B-val :lambda-list '(m))
(cl:defmethod data_B-val ((m <radar_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader radar_pa_msgs-msg:data_B-val is deprecated.  Use radar_pa_msgs-msg:data_B instead.")
  (data_B m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <radar_msg>) ostream)
  "Serializes a message object of type '<radar_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data_A))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data_B))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <radar_msg>) istream)
  "Deserializes a message object of type '<radar_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'data_A) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'data_A)))
    (cl:dotimes (i 48)
    (cl:setf (cl:aref vals i) (cl:make-instance 'radar_pa_msgs-msg:radar_msg_A))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  (cl:setf (cl:slot-value msg 'data_B) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'data_B)))
    (cl:dotimes (i 48)
    (cl:setf (cl:aref vals i) (cl:make-instance 'radar_pa_msgs-msg:radar_msg_B))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<radar_msg>)))
  "Returns string type for a message object of type '<radar_msg>"
  "radar_pa_msgs/radar_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'radar_msg)))
  "Returns string type for a message object of type 'radar_msg"
  "radar_pa_msgs/radar_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<radar_msg>)))
  "Returns md5sum for a message object of type '<radar_msg>"
  "61aec62f180ed30f21938b01f727fc33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'radar_msg)))
  "Returns md5sum for a message object of type 'radar_msg"
  "61aec62f180ed30f21938b01f727fc33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<radar_msg>)))
  "Returns full string definition for message of type '<radar_msg>"
  (cl:format cl:nil "Header header~%radar_msg_A[48] data_A~%radar_msg_B[48] data_B~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: radar_pa_msgs/radar_msg_A~%uint8   message~%uint32  ID~%float32 distance~%float32 velocity~%float32 power~%float32 angle~%uint8   is_target~%uint8   counter~%~%================================================================================~%MSG: radar_pa_msgs/radar_msg_B~%uint8   message~%uint32  ID~%float32 distance_deviation~%float32 velocity_deviation~%float32 angle_deviation~%float32 proability_target~%uint8   counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'radar_msg)))
  "Returns full string definition for message of type 'radar_msg"
  (cl:format cl:nil "Header header~%radar_msg_A[48] data_A~%radar_msg_B[48] data_B~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: radar_pa_msgs/radar_msg_A~%uint8   message~%uint32  ID~%float32 distance~%float32 velocity~%float32 power~%float32 angle~%uint8   is_target~%uint8   counter~%~%================================================================================~%MSG: radar_pa_msgs/radar_msg_B~%uint8   message~%uint32  ID~%float32 distance_deviation~%float32 velocity_deviation~%float32 angle_deviation~%float32 proability_target~%uint8   counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <radar_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data_A) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data_B) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <radar_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'radar_msg
    (cl:cons ':header (header msg))
    (cl:cons ':data_A (data_A msg))
    (cl:cons ':data_B (data_B msg))
))
