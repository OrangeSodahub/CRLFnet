; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude LFErecFieldMsg.msg.html

(cl:defclass <LFErecFieldMsg> (roslisp-msg-protocol:ros-message)
  ((version_number
    :reader version_number
    :initarg :version_number
    :type cl:fixnum
    :initform 0)
   (field_index
    :reader field_index
    :initarg :field_index
    :type cl:fixnum
    :initform 0)
   (sys_count
    :reader sys_count
    :initarg :sys_count
    :type cl:integer
    :initform 0)
   (dist_scale_factor
    :reader dist_scale_factor
    :initarg :dist_scale_factor
    :type cl:float
    :initform 0.0)
   (dist_scale_offset
    :reader dist_scale_offset
    :initarg :dist_scale_offset
    :type cl:float
    :initform 0.0)
   (angle_scale_factor
    :reader angle_scale_factor
    :initarg :angle_scale_factor
    :type cl:integer
    :initform 0)
   (angle_scale_offset
    :reader angle_scale_offset
    :initarg :angle_scale_offset
    :type cl:integer
    :initform 0)
   (field_result_mrs
    :reader field_result_mrs
    :initarg :field_result_mrs
    :type cl:fixnum
    :initform 0)
   (time_state
    :reader time_state
    :initarg :time_state
    :type cl:fixnum
    :initform 0)
   (year
    :reader year
    :initarg :year
    :type cl:fixnum
    :initform 0)
   (month
    :reader month
    :initarg :month
    :type cl:fixnum
    :initform 0)
   (day
    :reader day
    :initarg :day
    :type cl:fixnum
    :initform 0)
   (hour
    :reader hour
    :initarg :hour
    :type cl:fixnum
    :initform 0)
   (minute
    :reader minute
    :initarg :minute
    :type cl:fixnum
    :initform 0)
   (second
    :reader second
    :initarg :second
    :type cl:fixnum
    :initform 0)
   (microsecond
    :reader microsecond
    :initarg :microsecond
    :type cl:integer
    :initform 0))
)

(cl:defclass LFErecFieldMsg (<LFErecFieldMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LFErecFieldMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LFErecFieldMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<LFErecFieldMsg> is deprecated: use sick_scan-msg:LFErecFieldMsg instead.")))

(cl:ensure-generic-function 'version_number-val :lambda-list '(m))
(cl:defmethod version_number-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:version_number-val is deprecated.  Use sick_scan-msg:version_number instead.")
  (version_number m))

(cl:ensure-generic-function 'field_index-val :lambda-list '(m))
(cl:defmethod field_index-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:field_index-val is deprecated.  Use sick_scan-msg:field_index instead.")
  (field_index m))

(cl:ensure-generic-function 'sys_count-val :lambda-list '(m))
(cl:defmethod sys_count-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:sys_count-val is deprecated.  Use sick_scan-msg:sys_count instead.")
  (sys_count m))

(cl:ensure-generic-function 'dist_scale_factor-val :lambda-list '(m))
(cl:defmethod dist_scale_factor-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:dist_scale_factor-val is deprecated.  Use sick_scan-msg:dist_scale_factor instead.")
  (dist_scale_factor m))

(cl:ensure-generic-function 'dist_scale_offset-val :lambda-list '(m))
(cl:defmethod dist_scale_offset-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:dist_scale_offset-val is deprecated.  Use sick_scan-msg:dist_scale_offset instead.")
  (dist_scale_offset m))

(cl:ensure-generic-function 'angle_scale_factor-val :lambda-list '(m))
(cl:defmethod angle_scale_factor-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:angle_scale_factor-val is deprecated.  Use sick_scan-msg:angle_scale_factor instead.")
  (angle_scale_factor m))

(cl:ensure-generic-function 'angle_scale_offset-val :lambda-list '(m))
(cl:defmethod angle_scale_offset-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:angle_scale_offset-val is deprecated.  Use sick_scan-msg:angle_scale_offset instead.")
  (angle_scale_offset m))

(cl:ensure-generic-function 'field_result_mrs-val :lambda-list '(m))
(cl:defmethod field_result_mrs-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:field_result_mrs-val is deprecated.  Use sick_scan-msg:field_result_mrs instead.")
  (field_result_mrs m))

(cl:ensure-generic-function 'time_state-val :lambda-list '(m))
(cl:defmethod time_state-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:time_state-val is deprecated.  Use sick_scan-msg:time_state instead.")
  (time_state m))

(cl:ensure-generic-function 'year-val :lambda-list '(m))
(cl:defmethod year-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:year-val is deprecated.  Use sick_scan-msg:year instead.")
  (year m))

(cl:ensure-generic-function 'month-val :lambda-list '(m))
(cl:defmethod month-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:month-val is deprecated.  Use sick_scan-msg:month instead.")
  (month m))

(cl:ensure-generic-function 'day-val :lambda-list '(m))
(cl:defmethod day-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:day-val is deprecated.  Use sick_scan-msg:day instead.")
  (day m))

(cl:ensure-generic-function 'hour-val :lambda-list '(m))
(cl:defmethod hour-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:hour-val is deprecated.  Use sick_scan-msg:hour instead.")
  (hour m))

(cl:ensure-generic-function 'minute-val :lambda-list '(m))
(cl:defmethod minute-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:minute-val is deprecated.  Use sick_scan-msg:minute instead.")
  (minute m))

(cl:ensure-generic-function 'second-val :lambda-list '(m))
(cl:defmethod second-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:second-val is deprecated.  Use sick_scan-msg:second instead.")
  (second m))

(cl:ensure-generic-function 'microsecond-val :lambda-list '(m))
(cl:defmethod microsecond-val ((m <LFErecFieldMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:microsecond-val is deprecated.  Use sick_scan-msg:microsecond instead.")
  (microsecond m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LFErecFieldMsg>) ostream)
  "Serializes a message object of type '<LFErecFieldMsg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'version_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'version_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'field_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sys_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sys_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sys_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sys_count)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist_scale_factor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist_scale_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle_scale_factor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle_scale_factor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'angle_scale_factor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'angle_scale_factor)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'angle_scale_offset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'field_result_mrs)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'year)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'year)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'month)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'day)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hour)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'minute)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'second)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'microsecond)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'microsecond)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'microsecond)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'microsecond)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LFErecFieldMsg>) istream)
  "Deserializes a message object of type '<LFErecFieldMsg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'version_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'version_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'field_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sys_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sys_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sys_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sys_count)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_scale_factor) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_scale_offset) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle_scale_factor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle_scale_factor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'angle_scale_factor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'angle_scale_factor)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle_scale_offset) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'field_result_mrs)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'year)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'year)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'month)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'day)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hour)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'minute)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'second)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'microsecond)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'microsecond)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'microsecond)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'microsecond)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LFErecFieldMsg>)))
  "Returns string type for a message object of type '<LFErecFieldMsg>"
  "sick_scan/LFErecFieldMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LFErecFieldMsg)))
  "Returns string type for a message object of type 'LFErecFieldMsg"
  "sick_scan/LFErecFieldMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LFErecFieldMsg>)))
  "Returns md5sum for a message object of type '<LFErecFieldMsg>"
  "268600f47eb96b8f384e54c8bc6e18f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LFErecFieldMsg)))
  "Returns md5sum for a message object of type 'LFErecFieldMsg"
  "268600f47eb96b8f384e54c8bc6e18f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LFErecFieldMsg>)))
  "Returns full string definition for message of type '<LFErecFieldMsg>"
  (cl:format cl:nil "# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.~%# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.~%# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have~%# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)~%# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%~%uint16 version_number~%uint8 field_index~%uint32 sys_count~%float32 dist_scale_factor~%float32 dist_scale_offset~%uint32 angle_scale_factor~%int32 angle_scale_offset~%uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Time block~%uint16 time_state  # No time data: 0, Time data: 1~%uint16 year        # f.e. 2021~%uint8 month        # 1 ... 12~%uint8 day          # 1 ... 31~%uint8 hour         # 0 ... 23~%uint8 minute       # 0 ... 59~%uint8 second       # 0 ... 59~%uint32 microsecond # 0 ... 999999~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LFErecFieldMsg)))
  "Returns full string definition for message of type 'LFErecFieldMsg"
  (cl:format cl:nil "# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.~%# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.~%# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have~%# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)~%# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%~%uint16 version_number~%uint8 field_index~%uint32 sys_count~%float32 dist_scale_factor~%float32 dist_scale_offset~%uint32 angle_scale_factor~%int32 angle_scale_offset~%uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Time block~%uint16 time_state  # No time data: 0, Time data: 1~%uint16 year        # f.e. 2021~%uint8 month        # 1 ... 12~%uint8 day          # 1 ... 31~%uint8 hour         # 0 ... 23~%uint8 minute       # 0 ... 59~%uint8 second       # 0 ... 59~%uint32 microsecond # 0 ... 999999~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LFErecFieldMsg>))
  (cl:+ 0
     2
     1
     4
     4
     4
     4
     4
     1
     2
     2
     1
     1
     1
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LFErecFieldMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'LFErecFieldMsg
    (cl:cons ':version_number (version_number msg))
    (cl:cons ':field_index (field_index msg))
    (cl:cons ':sys_count (sys_count msg))
    (cl:cons ':dist_scale_factor (dist_scale_factor msg))
    (cl:cons ':dist_scale_offset (dist_scale_offset msg))
    (cl:cons ':angle_scale_factor (angle_scale_factor msg))
    (cl:cons ':angle_scale_offset (angle_scale_offset msg))
    (cl:cons ':field_result_mrs (field_result_mrs msg))
    (cl:cons ':time_state (time_state msg))
    (cl:cons ':year (year msg))
    (cl:cons ':month (month msg))
    (cl:cons ':day (day msg))
    (cl:cons ':hour (hour msg))
    (cl:cons ':minute (minute msg))
    (cl:cons ':second (second msg))
    (cl:cons ':microsecond (microsecond msg))
))
