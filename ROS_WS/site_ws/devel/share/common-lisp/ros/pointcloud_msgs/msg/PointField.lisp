; Auto-generated. Do not edit!


(cl:in-package pointcloud_msgs-msg)


;//! \htmlinclude PointField.msg.html

(cl:defclass <PointField> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (offset
    :reader offset
    :initarg :offset
    :type cl:integer
    :initform 0)
   (datatype
    :reader datatype
    :initarg :datatype
    :type cl:fixnum
    :initform 0)
   (count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0))
)

(cl:defclass PointField (<PointField>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointField>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointField)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pointcloud_msgs-msg:<PointField> is deprecated: use pointcloud_msgs-msg:PointField instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pointcloud_msgs-msg:name-val is deprecated.  Use pointcloud_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'offset-val :lambda-list '(m))
(cl:defmethod offset-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pointcloud_msgs-msg:offset-val is deprecated.  Use pointcloud_msgs-msg:offset instead.")
  (offset m))

(cl:ensure-generic-function 'datatype-val :lambda-list '(m))
(cl:defmethod datatype-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pointcloud_msgs-msg:datatype-val is deprecated.  Use pointcloud_msgs-msg:datatype instead.")
  (datatype m))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <PointField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pointcloud_msgs-msg:count-val is deprecated.  Use pointcloud_msgs-msg:count instead.")
  (count m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PointField>)))
    "Constants for message type '<PointField>"
  '((:INT8 . 1)
    (:UINT8 . 2)
    (:INT16 . 3)
    (:UINT16 . 4)
    (:INT32 . 5)
    (:UINT32 . 6)
    (:FLOAT32 . 7)
    (:FLOAT64 . 8))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PointField)))
    "Constants for message type 'PointField"
  '((:INT8 . 1)
    (:UINT8 . 2)
    (:INT16 . 3)
    (:UINT16 . 4)
    (:INT32 . 5)
    (:UINT32 . 6)
    (:FLOAT32 . 7)
    (:FLOAT64 . 8))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointField>) ostream)
  "Serializes a message object of type '<PointField>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'datatype)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'count)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointField>) istream)
  "Deserializes a message object of type '<PointField>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'datatype)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'count)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointField>)))
  "Returns string type for a message object of type '<PointField>"
  "pointcloud_msgs/PointField")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointField)))
  "Returns string type for a message object of type 'PointField"
  "pointcloud_msgs/PointField")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointField>)))
  "Returns md5sum for a message object of type '<PointField>"
  "268eacb2962780ceac86cbd17e328150")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointField)))
  "Returns md5sum for a message object of type 'PointField"
  "268eacb2962780ceac86cbd17e328150")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointField>)))
  "Returns full string definition for message of type '<PointField>"
  (cl:format cl:nil "# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointField)))
  "Returns full string definition for message of type 'PointField"
  (cl:format cl:nil "# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointField>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointField>))
  "Converts a ROS message object to a list"
  (cl:list 'PointField
    (cl:cons ':name (name msg))
    (cl:cons ':offset (offset msg))
    (cl:cons ':datatype (datatype msg))
    (cl:cons ':count (count msg))
))
