; Auto-generated. Do not edit!


(cl:in-package sick_scan-srv)


;//! \htmlinclude ECRChangeArrSrv-request.msg.html

(cl:defclass <ECRChangeArrSrv-request> (roslisp-msg-protocol:ros-message)
  ((active
    :reader active
    :initarg :active
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ECRChangeArrSrv-request (<ECRChangeArrSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ECRChangeArrSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ECRChangeArrSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-srv:<ECRChangeArrSrv-request> is deprecated: use sick_scan-srv:ECRChangeArrSrv-request instead.")))

(cl:ensure-generic-function 'active-val :lambda-list '(m))
(cl:defmethod active-val ((m <ECRChangeArrSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-srv:active-val is deprecated.  Use sick_scan-srv:active instead.")
  (active m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ECRChangeArrSrv-request>) ostream)
  "Serializes a message object of type '<ECRChangeArrSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'active) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ECRChangeArrSrv-request>) istream)
  "Deserializes a message object of type '<ECRChangeArrSrv-request>"
    (cl:setf (cl:slot-value msg 'active) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ECRChangeArrSrv-request>)))
  "Returns string type for a service object of type '<ECRChangeArrSrv-request>"
  "sick_scan/ECRChangeArrSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ECRChangeArrSrv-request)))
  "Returns string type for a service object of type 'ECRChangeArrSrv-request"
  "sick_scan/ECRChangeArrSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ECRChangeArrSrv-request>)))
  "Returns md5sum for a message object of type '<ECRChangeArrSrv-request>"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ECRChangeArrSrv-request)))
  "Returns md5sum for a message object of type 'ECRChangeArrSrv-request"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ECRChangeArrSrv-request>)))
  "Returns full string definition for message of type '<ECRChangeArrSrv-request>"
  (cl:format cl:nil "# Definition of ROS service ECRChangeArr for sick_scan~%# Request status change of monitoring fields on event~%# Example call (ROS1):~%# rosservice call /sick_tim_7xx/ECRChangeArr \"{active: 1}\"~%# ~%~%# ~%# Request (input)~%# ~%~%bool active # start/stop monitoring for status change events~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ECRChangeArrSrv-request)))
  "Returns full string definition for message of type 'ECRChangeArrSrv-request"
  (cl:format cl:nil "# Definition of ROS service ECRChangeArr for sick_scan~%# Request status change of monitoring fields on event~%# Example call (ROS1):~%# rosservice call /sick_tim_7xx/ECRChangeArr \"{active: 1}\"~%# ~%~%# ~%# Request (input)~%# ~%~%bool active # start/stop monitoring for status change events~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ECRChangeArrSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ECRChangeArrSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ECRChangeArrSrv-request
    (cl:cons ':active (active msg))
))
;//! \htmlinclude ECRChangeArrSrv-response.msg.html

(cl:defclass <ECRChangeArrSrv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ECRChangeArrSrv-response (<ECRChangeArrSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ECRChangeArrSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ECRChangeArrSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-srv:<ECRChangeArrSrv-response> is deprecated: use sick_scan-srv:ECRChangeArrSrv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ECRChangeArrSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-srv:success-val is deprecated.  Use sick_scan-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ECRChangeArrSrv-response>) ostream)
  "Serializes a message object of type '<ECRChangeArrSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ECRChangeArrSrv-response>) istream)
  "Deserializes a message object of type '<ECRChangeArrSrv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ECRChangeArrSrv-response>)))
  "Returns string type for a service object of type '<ECRChangeArrSrv-response>"
  "sick_scan/ECRChangeArrSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ECRChangeArrSrv-response)))
  "Returns string type for a service object of type 'ECRChangeArrSrv-response"
  "sick_scan/ECRChangeArrSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ECRChangeArrSrv-response>)))
  "Returns md5sum for a message object of type '<ECRChangeArrSrv-response>"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ECRChangeArrSrv-response)))
  "Returns md5sum for a message object of type 'ECRChangeArrSrv-response"
  "83465e5956f4615e09223f5d055d1f12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ECRChangeArrSrv-response>)))
  "Returns full string definition for message of type '<ECRChangeArrSrv-response>"
  (cl:format cl:nil "~%# ~%# Response (output)~%# ~%~%bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ECRChangeArrSrv-response)))
  "Returns full string definition for message of type 'ECRChangeArrSrv-response"
  (cl:format cl:nil "~%# ~%# Response (output)~%# ~%~%bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ECRChangeArrSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ECRChangeArrSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ECRChangeArrSrv-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ECRChangeArrSrv)))
  'ECRChangeArrSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ECRChangeArrSrv)))
  'ECRChangeArrSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ECRChangeArrSrv)))
  "Returns string type for a service object of type '<ECRChangeArrSrv>"
  "sick_scan/ECRChangeArrSrv")