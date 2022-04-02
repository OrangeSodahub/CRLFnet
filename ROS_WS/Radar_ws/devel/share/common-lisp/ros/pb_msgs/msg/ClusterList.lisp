; Auto-generated. Do not edit!


(cl:in-package pb_msgs-msg)


;//! \htmlinclude ClusterList.msg.html

(cl:defclass <ClusterList> (roslisp-msg-protocol:ros-message)
  ((nof_targetsnear
    :reader nof_targetsnear
    :initarg :nof_targetsnear
    :type cl:fixnum
    :initform 0)
   (nof_targetsfar
    :reader nof_targetsfar
    :initarg :nof_targetsfar
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

(cl:defclass ClusterList (<ClusterList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClusterList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClusterList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pb_msgs-msg:<ClusterList> is deprecated: use pb_msgs-msg:ClusterList instead.")))

(cl:ensure-generic-function 'nof_targetsnear-val :lambda-list '(m))
(cl:defmethod nof_targetsnear-val ((m <ClusterList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:nof_targetsnear-val is deprecated.  Use pb_msgs-msg:nof_targetsnear instead.")
  (nof_targetsnear m))

(cl:ensure-generic-function 'nof_targetsfar-val :lambda-list '(m))
(cl:defmethod nof_targetsfar-val ((m <ClusterList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:nof_targetsfar-val is deprecated.  Use pb_msgs-msg:nof_targetsfar instead.")
  (nof_targetsfar m))

(cl:ensure-generic-function 'meas_counter-val :lambda-list '(m))
(cl:defmethod meas_counter-val ((m <ClusterList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:meas_counter-val is deprecated.  Use pb_msgs-msg:meas_counter instead.")
  (meas_counter m))

(cl:ensure-generic-function 'interface_version-val :lambda-list '(m))
(cl:defmethod interface_version-val ((m <ClusterList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pb_msgs-msg:interface_version-val is deprecated.  Use pb_msgs-msg:interface_version instead.")
  (interface_version m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClusterList>) ostream)
  "Serializes a message object of type '<ClusterList>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nof_targetsnear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nof_targetsfar)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'meas_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'interface_version)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClusterList>) istream)
  "Deserializes a message object of type '<ClusterList>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nof_targetsnear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nof_targetsfar)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'meas_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'interface_version)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClusterList>)))
  "Returns string type for a message object of type '<ClusterList>"
  "pb_msgs/ClusterList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClusterList)))
  "Returns string type for a message object of type 'ClusterList"
  "pb_msgs/ClusterList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClusterList>)))
  "Returns md5sum for a message object of type '<ClusterList>"
  "95a654931a9c98d760080cd397e1011c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClusterList)))
  "Returns md5sum for a message object of type 'ClusterList"
  "95a654931a9c98d760080cd397e1011c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClusterList>)))
  "Returns full string definition for message of type '<ClusterList>"
  (cl:format cl:nil "uint8 nof_targetsnear~%uint8 nof_targetsfar~%uint32 meas_counter~%uint8 interface_version~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClusterList)))
  "Returns full string definition for message of type 'ClusterList"
  (cl:format cl:nil "uint8 nof_targetsnear~%uint8 nof_targetsfar~%uint32 meas_counter~%uint8 interface_version~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClusterList>))
  (cl:+ 0
     1
     1
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClusterList>))
  "Converts a ROS message object to a list"
  (cl:list 'ClusterList
    (cl:cons ':nof_targetsnear (nof_targetsnear msg))
    (cl:cons ':nof_targetsfar (nof_targetsfar msg))
    (cl:cons ':meas_counter (meas_counter msg))
    (cl:cons ':interface_version (interface_version msg))
))
