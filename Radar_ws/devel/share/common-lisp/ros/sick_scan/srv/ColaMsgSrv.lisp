; Auto-generated. Do not edit!


(cl:in-package sick_scan-srv)


;//! \htmlinclude ColaMsgSrv-request.msg.html

(cl:defclass <ColaMsgSrv-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type cl:string
    :initform ""))
)

(cl:defclass ColaMsgSrv-request (<ColaMsgSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColaMsgSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColaMsgSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-srv:<ColaMsgSrv-request> is deprecated: use sick_scan-srv:ColaMsgSrv-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <ColaMsgSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-srv:request-val is deprecated.  Use sick_scan-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColaMsgSrv-request>) ostream)
  "Serializes a message object of type '<ColaMsgSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColaMsgSrv-request>) istream)
  "Deserializes a message object of type '<ColaMsgSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'request) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'request) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColaMsgSrv-request>)))
  "Returns string type for a service object of type '<ColaMsgSrv-request>"
  "sick_scan/ColaMsgSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColaMsgSrv-request)))
  "Returns string type for a service object of type 'ColaMsgSrv-request"
  "sick_scan/ColaMsgSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColaMsgSrv-request>)))
  "Returns md5sum for a message object of type '<ColaMsgSrv-request>"
  "33ea4e5aeb30f5913da681ca459d55f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColaMsgSrv-request)))
  "Returns md5sum for a message object of type 'ColaMsgSrv-request"
  "33ea4e5aeb30f5913da681ca459d55f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColaMsgSrv-request>)))
  "Returns full string definition for message of type '<ColaMsgSrv-request>"
  (cl:format cl:nil "# Definition of ROS service ColaMsg for sick_scan~%# Send a cola message to the Lidar~%# Example call (ROS1):~%# rosservice call /sick_tim_7xx/ColaMsg \"{request: 'sEN LIDoutputstate 1'}\"~%# ~%~%# ~%# Request (input)~%# ~%~%string request~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColaMsgSrv-request)))
  "Returns full string definition for message of type 'ColaMsgSrv-request"
  (cl:format cl:nil "# Definition of ROS service ColaMsg for sick_scan~%# Send a cola message to the Lidar~%# Example call (ROS1):~%# rosservice call /sick_tim_7xx/ColaMsg \"{request: 'sEN LIDoutputstate 1'}\"~%# ~%~%# ~%# Request (input)~%# ~%~%string request~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColaMsgSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColaMsgSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ColaMsgSrv-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude ColaMsgSrv-response.msg.html

(cl:defclass <ColaMsgSrv-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass ColaMsgSrv-response (<ColaMsgSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColaMsgSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColaMsgSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-srv:<ColaMsgSrv-response> is deprecated: use sick_scan-srv:ColaMsgSrv-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <ColaMsgSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-srv:response-val is deprecated.  Use sick_scan-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColaMsgSrv-response>) ostream)
  "Serializes a message object of type '<ColaMsgSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColaMsgSrv-response>) istream)
  "Deserializes a message object of type '<ColaMsgSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColaMsgSrv-response>)))
  "Returns string type for a service object of type '<ColaMsgSrv-response>"
  "sick_scan/ColaMsgSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColaMsgSrv-response)))
  "Returns string type for a service object of type 'ColaMsgSrv-response"
  "sick_scan/ColaMsgSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColaMsgSrv-response>)))
  "Returns md5sum for a message object of type '<ColaMsgSrv-response>"
  "33ea4e5aeb30f5913da681ca459d55f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColaMsgSrv-response)))
  "Returns md5sum for a message object of type 'ColaMsgSrv-response"
  "33ea4e5aeb30f5913da681ca459d55f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColaMsgSrv-response>)))
  "Returns full string definition for message of type '<ColaMsgSrv-response>"
  (cl:format cl:nil "~%# ~%# Response (output)~%# ~%~%string response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColaMsgSrv-response)))
  "Returns full string definition for message of type 'ColaMsgSrv-response"
  (cl:format cl:nil "~%# ~%# Response (output)~%# ~%~%string response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColaMsgSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColaMsgSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ColaMsgSrv-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ColaMsgSrv)))
  'ColaMsgSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ColaMsgSrv)))
  'ColaMsgSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColaMsgSrv)))
  "Returns string type for a service object of type '<ColaMsgSrv>"
  "sick_scan/ColaMsgSrv")