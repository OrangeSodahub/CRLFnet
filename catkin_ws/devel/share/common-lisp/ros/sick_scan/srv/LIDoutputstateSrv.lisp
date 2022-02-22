; Auto-generated. Do not edit!


(cl:in-package sick_scan-srv)


;//! \htmlinclude LIDoutputstateSrv-request.msg.html

(cl:defclass <LIDoutputstateSrv-request> (roslisp-msg-protocol:ros-message)
  ((active
    :reader active
    :initarg :active
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LIDoutputstateSrv-request (<LIDoutputstateSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LIDoutputstateSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LIDoutputstateSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-srv:<LIDoutputstateSrv-request> is deprecated: use sick_scan-srv:LIDoutputstateSrv-request instead.")))

(cl:ensure-generic-function 'active-val :lambda-list '(m))
(cl:defmethod active-val ((m <LIDoutputstateSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-srv:active-val is deprecated.  Use sick_scan-srv:active instead.")
  (active m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LIDoutputstateSrv-request>) ostream)
  "Serializes a message object of type '<LIDoutputstateSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'active) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LIDoutputstateSrv-request>) istream)
  "Deserializes a message object of type '<LIDoutputstateSrv-request>"
    (cl:setf (cl:slot-value msg 'active) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LIDoutputstateSrv-request>)))
  "Returns string type for a service object of type '<LIDoutputstateSrv-request>"
  "sick_scan/LIDoutputstateSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LIDoutputstateSrv-request)))
  "Returns string type for a service object of type 'LIDoutputstateSrv-request"
  "sick_scan/LIDoutputstateSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LIDoutputstateSrv-request>)))
  "Returns md5sum for a message object of type '<LIDoutputstateSrv-request>"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LIDoutputstateSrv-request)))
  "Returns md5sum for a message object of type 'LIDoutputstateSrv-request"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LIDoutputstateSrv-request>)))
  "Returns full string definition for message of type '<LIDoutputstateSrv-request>"
  (cl:format cl:nil "# Definition of ROS service LIDoutputstate for sick_scan~%# Start or stop Send outputstate by event~%# Example call (ROS1):~%# rosservice call /sick_tim_7xx/LIDoutputstate \"{active: 1}\"~%# ~%~%# ~%# Request (input)~%# ~%~%bool active # start/stop send outputstate by event~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LIDoutputstateSrv-request)))
  "Returns full string definition for message of type 'LIDoutputstateSrv-request"
  (cl:format cl:nil "# Definition of ROS service LIDoutputstate for sick_scan~%# Start or stop Send outputstate by event~%# Example call (ROS1):~%# rosservice call /sick_tim_7xx/LIDoutputstate \"{active: 1}\"~%# ~%~%# ~%# Request (input)~%# ~%~%bool active # start/stop send outputstate by event~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LIDoutputstateSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LIDoutputstateSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LIDoutputstateSrv-request
    (cl:cons ':active (active msg))
))
;//! \htmlinclude LIDoutputstateSrv-response.msg.html

(cl:defclass <LIDoutputstateSrv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LIDoutputstateSrv-response (<LIDoutputstateSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LIDoutputstateSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LIDoutputstateSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-srv:<LIDoutputstateSrv-response> is deprecated: use sick_scan-srv:LIDoutputstateSrv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LIDoutputstateSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-srv:success-val is deprecated.  Use sick_scan-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LIDoutputstateSrv-response>) ostream)
  "Serializes a message object of type '<LIDoutputstateSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LIDoutputstateSrv-response>) istream)
  "Deserializes a message object of type '<LIDoutputstateSrv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LIDoutputstateSrv-response>)))
  "Returns string type for a service object of type '<LIDoutputstateSrv-response>"
  "sick_scan/LIDoutputstateSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LIDoutputstateSrv-response)))
  "Returns string type for a service object of type 'LIDoutputstateSrv-response"
  "sick_scan/LIDoutputstateSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LIDoutputstateSrv-response>)))
  "Returns md5sum for a message object of type '<LIDoutputstateSrv-response>"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LIDoutputstateSrv-response)))
  "Returns md5sum for a message object of type 'LIDoutputstateSrv-response"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LIDoutputstateSrv-response>)))
  "Returns full string definition for message of type '<LIDoutputstateSrv-response>"
  (cl:format cl:nil "~%# ~%# Response (output)~%# ~%~%bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LIDoutputstateSrv-response)))
  "Returns full string definition for message of type 'LIDoutputstateSrv-response"
  (cl:format cl:nil "~%# ~%# Response (output)~%# ~%~%bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LIDoutputstateSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LIDoutputstateSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LIDoutputstateSrv-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LIDoutputstateSrv)))
  'LIDoutputstateSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LIDoutputstateSrv)))
  'LIDoutputstateSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LIDoutputstateSrv)))
  "Returns string type for a service object of type '<LIDoutputstateSrv>"
  "sick_scan/LIDoutputstateSrv")