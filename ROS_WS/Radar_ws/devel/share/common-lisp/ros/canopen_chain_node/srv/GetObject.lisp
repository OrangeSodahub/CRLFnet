; Auto-generated. Do not edit!


(cl:in-package canopen_chain_node-srv)


;//! \htmlinclude GetObject-request.msg.html

(cl:defclass <GetObject-request> (roslisp-msg-protocol:ros-message)
  ((node
    :reader node
    :initarg :node
    :type cl:string
    :initform "")
   (object
    :reader object
    :initarg :object
    :type cl:string
    :initform "")
   (cached
    :reader cached
    :initarg :cached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GetObject-request (<GetObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name canopen_chain_node-srv:<GetObject-request> is deprecated: use canopen_chain_node-srv:GetObject-request instead.")))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <GetObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader canopen_chain_node-srv:node-val is deprecated.  Use canopen_chain_node-srv:node instead.")
  (node m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <GetObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader canopen_chain_node-srv:object-val is deprecated.  Use canopen_chain_node-srv:object instead.")
  (object m))

(cl:ensure-generic-function 'cached-val :lambda-list '(m))
(cl:defmethod cached-val ((m <GetObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader canopen_chain_node-srv:cached-val is deprecated.  Use canopen_chain_node-srv:cached instead.")
  (cached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetObject-request>) ostream)
  "Serializes a message object of type '<GetObject-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetObject-request>) istream)
  "Deserializes a message object of type '<GetObject-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'cached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetObject-request>)))
  "Returns string type for a service object of type '<GetObject-request>"
  "canopen_chain_node/GetObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObject-request)))
  "Returns string type for a service object of type 'GetObject-request"
  "canopen_chain_node/GetObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetObject-request>)))
  "Returns md5sum for a message object of type '<GetObject-request>"
  "acdd041126bee1cd6a04a75c17856af5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetObject-request)))
  "Returns md5sum for a message object of type 'GetObject-request"
  "acdd041126bee1cd6a04a75c17856af5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetObject-request>)))
  "Returns full string definition for message of type '<GetObject-request>"
  (cl:format cl:nil "string node~%string object~%bool cached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetObject-request)))
  "Returns full string definition for message of type 'GetObject-request"
  (cl:format cl:nil "string node~%string object~%bool cached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetObject-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'node))
     4 (cl:length (cl:slot-value msg 'object))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetObject-request
    (cl:cons ':node (node msg))
    (cl:cons ':object (object msg))
    (cl:cons ':cached (cached msg))
))
;//! \htmlinclude GetObject-response.msg.html

(cl:defclass <GetObject-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass GetObject-response (<GetObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name canopen_chain_node-srv:<GetObject-response> is deprecated: use canopen_chain_node-srv:GetObject-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader canopen_chain_node-srv:success-val is deprecated.  Use canopen_chain_node-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader canopen_chain_node-srv:message-val is deprecated.  Use canopen_chain_node-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <GetObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader canopen_chain_node-srv:value-val is deprecated.  Use canopen_chain_node-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetObject-response>) ostream)
  "Serializes a message object of type '<GetObject-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetObject-response>) istream)
  "Deserializes a message object of type '<GetObject-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetObject-response>)))
  "Returns string type for a service object of type '<GetObject-response>"
  "canopen_chain_node/GetObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObject-response)))
  "Returns string type for a service object of type 'GetObject-response"
  "canopen_chain_node/GetObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetObject-response>)))
  "Returns md5sum for a message object of type '<GetObject-response>"
  "acdd041126bee1cd6a04a75c17856af5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetObject-response)))
  "Returns md5sum for a message object of type 'GetObject-response"
  "acdd041126bee1cd6a04a75c17856af5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetObject-response>)))
  "Returns full string definition for message of type '<GetObject-response>"
  (cl:format cl:nil "bool success~%string message~%string value~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetObject-response)))
  "Returns full string definition for message of type 'GetObject-response"
  (cl:format cl:nil "bool success~%string message~%string value~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetObject-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetObject-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetObject)))
  'GetObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetObject)))
  'GetObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObject)))
  "Returns string type for a service object of type '<GetObject>"
  "canopen_chain_node/GetObject")