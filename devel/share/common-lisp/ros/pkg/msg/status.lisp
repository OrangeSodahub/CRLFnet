; Auto-generated. Do not edit!


(cl:in-package pkg-msg)


;//! \htmlinclude status.msg.html

(cl:defclass <status> (roslisp-msg-protocol:ros-message)
  ((leader
    :reader leader
    :initarg :leader
    :type cl:string
    :initform "")
   (follower1
    :reader follower1
    :initarg :follower1
    :type cl:string
    :initform "")
   (follower2
    :reader follower2
    :initarg :follower2
    :type cl:string
    :initform "")
   (follower3
    :reader follower3
    :initarg :follower3
    :type cl:string
    :initform "")
   (follower4
    :reader follower4
    :initarg :follower4
    :type cl:string
    :initform "")
   (formation
    :reader formation
    :initarg :formation
    :type cl:fixnum
    :initform 0))
)

(cl:defclass status (<status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pkg-msg:<status> is deprecated: use pkg-msg:status instead.")))

(cl:ensure-generic-function 'leader-val :lambda-list '(m))
(cl:defmethod leader-val ((m <status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pkg-msg:leader-val is deprecated.  Use pkg-msg:leader instead.")
  (leader m))

(cl:ensure-generic-function 'follower1-val :lambda-list '(m))
(cl:defmethod follower1-val ((m <status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pkg-msg:follower1-val is deprecated.  Use pkg-msg:follower1 instead.")
  (follower1 m))

(cl:ensure-generic-function 'follower2-val :lambda-list '(m))
(cl:defmethod follower2-val ((m <status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pkg-msg:follower2-val is deprecated.  Use pkg-msg:follower2 instead.")
  (follower2 m))

(cl:ensure-generic-function 'follower3-val :lambda-list '(m))
(cl:defmethod follower3-val ((m <status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pkg-msg:follower3-val is deprecated.  Use pkg-msg:follower3 instead.")
  (follower3 m))

(cl:ensure-generic-function 'follower4-val :lambda-list '(m))
(cl:defmethod follower4-val ((m <status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pkg-msg:follower4-val is deprecated.  Use pkg-msg:follower4 instead.")
  (follower4 m))

(cl:ensure-generic-function 'formation-val :lambda-list '(m))
(cl:defmethod formation-val ((m <status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pkg-msg:formation-val is deprecated.  Use pkg-msg:formation instead.")
  (formation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <status>) ostream)
  "Serializes a message object of type '<status>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'leader))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'leader))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'follower1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'follower1))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'follower2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'follower2))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'follower3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'follower3))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'follower4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'follower4))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'formation)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <status>) istream)
  "Deserializes a message object of type '<status>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'leader) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'leader) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'follower1) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'follower1) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'follower2) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'follower2) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'follower3) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'follower3) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'follower4) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'follower4) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'formation)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<status>)))
  "Returns string type for a message object of type '<status>"
  "pkg/status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'status)))
  "Returns string type for a message object of type 'status"
  "pkg/status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<status>)))
  "Returns md5sum for a message object of type '<status>"
  "7f786ce8ae9e22085ec0c660926ddd4c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'status)))
  "Returns md5sum for a message object of type 'status"
  "7f786ce8ae9e22085ec0c660926ddd4c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<status>)))
  "Returns full string definition for message of type '<status>"
  (cl:format cl:nil "string leader~%string follower1~%string follower2~%string follower3~%string follower4~%uint8 formation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'status)))
  "Returns full string definition for message of type 'status"
  (cl:format cl:nil "string leader~%string follower1~%string follower2~%string follower3~%string follower4~%uint8 formation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <status>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'leader))
     4 (cl:length (cl:slot-value msg 'follower1))
     4 (cl:length (cl:slot-value msg 'follower2))
     4 (cl:length (cl:slot-value msg 'follower3))
     4 (cl:length (cl:slot-value msg 'follower4))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <status>))
  "Converts a ROS message object to a list"
  (cl:list 'status
    (cl:cons ':leader (leader msg))
    (cl:cons ':follower1 (follower1 msg))
    (cl:cons ':follower2 (follower2 msg))
    (cl:cons ':follower3 (follower3 msg))
    (cl:cons ':follower4 (follower4 msg))
    (cl:cons ':formation (formation msg))
))
