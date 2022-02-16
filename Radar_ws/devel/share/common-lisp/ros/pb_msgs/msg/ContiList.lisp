; Auto-generated. Do not edit!


(cl:in-package pb_msgs-msg)


;//! \htmlinclude ContiList.msg.html

(cl:defclass <ContiList> (roslisp-msg-protocol:ros-message)
  ((nof_objects
    :reader nof_objects
    :initarg :nof_objects
    :type cl:fixnum
    :initform 0)
   (meas_counter
    :reader meas_counter
    :initarg :meas_counter
    :type cl:integer
    :initform 0)
   (interface_version
    :reader interface_version
    :initarg :interface_version
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ContiList (<ContiList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContiList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContiList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pb_msgs-msg:<ContiList> is deprecated: use pb_msgs-msg:ContiList instead.")))

(cl:ensure-generic-function 'nof_objects-val :lambda-list '(m))
(cl:defmethod nof_objects-val ((m <ContiList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:nof_objects-val is deprecated.  Use pb_msgs-msg:nof_objects instead.")
  (nof_objects m))

(cl:ensure-generic-function 'meas_counter-val :lambda-list '(m))
(cl:defmethod meas_counter-val ((m <ContiList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:meas_counter-val is deprecated.  Use pb_msgs-msg:meas_counter instead.")
  (meas_counter m))

(cl:ensure-generic-function 'interface_version-val :lambda-list '(m))
(cl:defmethod interface_version-val ((m <ContiList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:interface_version-val is deprecated.  Use pb_msgs-msg:interface_version instead.")
  (interface_version m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContiList>) ostream)
  "Serializes a message object of type '<ContiList>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nof_objects)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'interface_version)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContiList>) istream)
  "Deserializes a message object of type '<ContiList>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nof_objects)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'interface_version)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContiList>)))
  "Returns string type for a message object of type '<ContiList>"
  "pb_msgs/ContiList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContiList)))
  "Returns string type for a message object of type 'ContiList"
  "pb_msgs/ContiList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContiList>)))
  "Returns md5sum for a message object of type '<ContiList>"
  "2a28291b0d17e16489f6a48ab5e30241")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContiList)))
  "Returns md5sum for a message object of type 'ContiList"
  "2a28291b0d17e16489f6a48ab5e30241")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContiList>)))
  "Returns full string definition for message of type '<ContiList>"
  (cl:format cl:nil "uint8 nof_objects~%uint32 meas_counter~%uint8 interface_version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContiList)))
  "Returns full string definition for message of type 'ContiList"
  (cl:format cl:nil "uint8 nof_objects~%uint32 meas_counter~%uint8 interface_version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContiList>))
  (cl:+ 0
     1
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContiList>))
  "Converts a ROS message object to a list"
  (cl:list 'ContiList
    (cl:cons ':nof_objects (nof_objects msg))
    (cl:cons ':meas_counter (meas_counter msg))
    (cl:cons ':interface_version (interface_version msg))
))
