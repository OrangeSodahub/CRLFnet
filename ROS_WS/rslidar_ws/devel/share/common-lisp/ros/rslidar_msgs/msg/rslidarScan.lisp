; Auto-generated. Do not edit!


(cl:in-package rslidar_msgs-msg)


;//! \htmlinclude rslidarScan.msg.html

(cl:defclass <rslidarScan> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (packets
    :reader packets
    :initarg :packets
    :type (cl:vector rslidar_msgs-msg:rslidarPacket)
   :initform (cl:make-array 0 :element-type 'rslidar_msgs-msg:rslidarPacket :initial-element (cl:make-instance 'rslidar_msgs-msg:rslidarPacket))))
)

(cl:defclass rslidarScan (<rslidarScan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rslidarScan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rslidarScan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rslidar_msgs-msg:<rslidarScan> is deprecated: use rslidar_msgs-msg:rslidarScan instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <rslidarScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rslidar_msgs-msg:header-val is deprecated.  Use rslidar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'packets-val :lambda-list '(m))
(cl:defmethod packets-val ((m <rslidarScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rslidar_msgs-msg:packets-val is deprecated.  Use rslidar_msgs-msg:packets instead.")
  (packets m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rslidarScan>) ostream)
  "Serializes a message object of type '<rslidarScan>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'packets))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'packets))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rslidarScan>) istream)
  "Deserializes a message object of type '<rslidarScan>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'packets) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'packets)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'rslidar_msgs-msg:rslidarPacket))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rslidarScan>)))
  "Returns string type for a message object of type '<rslidarScan>"
  "rslidar_msgs/rslidarScan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rslidarScan)))
  "Returns string type for a message object of type 'rslidarScan"
  "rslidar_msgs/rslidarScan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rslidarScan>)))
  "Returns md5sum for a message object of type '<rslidarScan>"
  "ff6baa58985b528481871cbaf1bb342f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rslidarScan)))
  "Returns md5sum for a message object of type 'rslidarScan"
  "ff6baa58985b528481871cbaf1bb342f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rslidarScan>)))
  "Returns full string definition for message of type '<rslidarScan>"
  (cl:format cl:nil "# LIDAR scan packets.~%~%Header           header         # standard ROS message header~%rslidarPacket[] packets        # vector of raw packets~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: rslidar_msgs/rslidarPacket~%# Raw LIDAR packet.~%~%time stamp              # packet timestamp~%uint8[1248] data        # packet contents~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rslidarScan)))
  "Returns full string definition for message of type 'rslidarScan"
  (cl:format cl:nil "# LIDAR scan packets.~%~%Header           header         # standard ROS message header~%rslidarPacket[] packets        # vector of raw packets~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: rslidar_msgs/rslidarPacket~%# Raw LIDAR packet.~%~%time stamp              # packet timestamp~%uint8[1248] data        # packet contents~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rslidarScan>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'packets) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rslidarScan>))
  "Converts a ROS message object to a list"
  (cl:list 'rslidarScan
    (cl:cons ':header (header msg))
    (cl:cons ':packets (packets msg))
))
