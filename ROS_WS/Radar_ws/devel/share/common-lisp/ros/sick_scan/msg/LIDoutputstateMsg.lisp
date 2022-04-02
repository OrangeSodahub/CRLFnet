; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude LIDoutputstateMsg.msg.html

(cl:defclass <LIDoutputstateMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (version_number
    :reader version_number
    :initarg :version_number
    :type cl:fixnum
    :initform 0)
   (system_counter
    :reader system_counter
    :initarg :system_counter
    :type cl:integer
    :initform 0)
   (output_state
    :reader output_state
    :initarg :output_state
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (output_count
    :reader output_count
    :initarg :output_count
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
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

(cl:defclass LIDoutputstateMsg (<LIDoutputstateMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LIDoutputstateMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LIDoutputstateMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<LIDoutputstateMsg> is deprecated: use sick_scan-msg:LIDoutputstateMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:header-val is deprecated.  Use sick_scan-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'version_number-val :lambda-list '(m))
(cl:defmethod version_number-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:version_number-val is deprecated.  Use sick_scan-msg:version_number instead.")
  (version_number m))

(cl:ensure-generic-function 'system_counter-val :lambda-list '(m))
(cl:defmethod system_counter-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:system_counter-val is deprecated.  Use sick_scan-msg:system_counter instead.")
  (system_counter m))

(cl:ensure-generic-function 'output_state-val :lambda-list '(m))
(cl:defmethod output_state-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:output_state-val is deprecated.  Use sick_scan-msg:output_state instead.")
  (output_state m))

(cl:ensure-generic-function 'output_count-val :lambda-list '(m))
(cl:defmethod output_count-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:output_count-val is deprecated.  Use sick_scan-msg:output_count instead.")
  (output_count m))

(cl:ensure-generic-function 'time_state-val :lambda-list '(m))
(cl:defmethod time_state-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:time_state-val is deprecated.  Use sick_scan-msg:time_state instead.")
  (time_state m))

(cl:ensure-generic-function 'year-val :lambda-list '(m))
(cl:defmethod year-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:year-val is deprecated.  Use sick_scan-msg:year instead.")
  (year m))

(cl:ensure-generic-function 'month-val :lambda-list '(m))
(cl:defmethod month-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:month-val is deprecated.  Use sick_scan-msg:month instead.")
  (month m))

(cl:ensure-generic-function 'day-val :lambda-list '(m))
(cl:defmethod day-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:day-val is deprecated.  Use sick_scan-msg:day instead.")
  (day m))

(cl:ensure-generic-function 'hour-val :lambda-list '(m))
(cl:defmethod hour-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:hour-val is deprecated.  Use sick_scan-msg:hour instead.")
  (hour m))

(cl:ensure-generic-function 'minute-val :lambda-list '(m))
(cl:defmethod minute-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:minute-val is deprecated.  Use sick_scan-msg:minute instead.")
  (minute m))

(cl:ensure-generic-function 'second-val :lambda-list '(m))
(cl:defmethod second-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:second-val is deprecated.  Use sick_scan-msg:second instead.")
  (second m))

(cl:ensure-generic-function 'microsecond-val :lambda-list '(m))
(cl:defmethod microsecond-val ((m <LIDoutputstateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:microsecond-val is deprecated.  Use sick_scan-msg:microsecond instead.")
  (microsecond m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LIDoutputstateMsg>) ostream)
  "Serializes a message object of type '<LIDoutputstateMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'version_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'version_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'system_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'system_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'system_counter)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'output_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'output_state))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'output_count))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'output_count))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LIDoutputstateMsg>) istream)
  "Deserializes a message object of type '<LIDoutputstateMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'version_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'version_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'system_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'system_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'system_counter)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'output_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'output_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'output_count) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'output_count)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LIDoutputstateMsg>)))
  "Returns string type for a message object of type '<LIDoutputstateMsg>"
  "sick_scan/LIDoutputstateMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LIDoutputstateMsg)))
  "Returns string type for a message object of type 'LIDoutputstateMsg"
  "sick_scan/LIDoutputstateMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LIDoutputstateMsg>)))
  "Returns md5sum for a message object of type '<LIDoutputstateMsg>"
  "e31d4eb61fa1d840e24cb97a0ef71ace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LIDoutputstateMsg)))
  "Returns md5sum for a message object of type 'LIDoutputstateMsg"
  "e31d4eb61fa1d840e24cb97a0ef71ace")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LIDoutputstateMsg>)))
  "Returns full string definition for message of type '<LIDoutputstateMsg>"
  (cl:format cl:nil "# This message contains the \"sSN LIDoutputstate\" message of a Sick laser scanner as an ros message.~%#~%~%Header header~%~%# Status code~%uint16 version_number # Status code version number~%uint32 system_counter # Status code system counter (time in microsec since power up, max. 71 min then starting from 0 again)~%~%# Array of output states (state and count)~%uint8[] output_state  # output states, each state with value 0 (not active), 1 (active) or 2 (not used)~%uint32[] output_count # output counter~%~%# Time block (sensortime from the last change of min. one of the outputs)~%uint16 time_state   # No time data: 0, Time data: 1~%uint16 year        # f.e. 2021~%uint8 month        # 1 ... 12~%uint8 day          # 1 ... 31~%uint8 hour         # 0 ... 23~%uint8 minute       # 0 ... 59~%uint8 second       # 0 ... 59~%uint32 microsecond # 0 ... 999999~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LIDoutputstateMsg)))
  "Returns full string definition for message of type 'LIDoutputstateMsg"
  (cl:format cl:nil "# This message contains the \"sSN LIDoutputstate\" message of a Sick laser scanner as an ros message.~%#~%~%Header header~%~%# Status code~%uint16 version_number # Status code version number~%uint32 system_counter # Status code system counter (time in microsec since power up, max. 71 min then starting from 0 again)~%~%# Array of output states (state and count)~%uint8[] output_state  # output states, each state with value 0 (not active), 1 (active) or 2 (not used)~%uint32[] output_count # output counter~%~%# Time block (sensortime from the last change of min. one of the outputs)~%uint16 time_state   # No time data: 0, Time data: 1~%uint16 year        # f.e. 2021~%uint8 month        # 1 ... 12~%uint8 day          # 1 ... 31~%uint8 hour         # 0 ... 23~%uint8 minute       # 0 ... 59~%uint8 second       # 0 ... 59~%uint32 microsecond # 0 ... 999999~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LIDoutputstateMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'output_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'output_count) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     2
     2
     1
     1
     1
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LIDoutputstateMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'LIDoutputstateMsg
    (cl:cons ':header (header msg))
    (cl:cons ':version_number (version_number msg))
    (cl:cons ':system_counter (system_counter msg))
    (cl:cons ':output_state (output_state msg))
    (cl:cons ':output_count (output_count msg))
    (cl:cons ':time_state (time_state msg))
    (cl:cons ':year (year msg))
    (cl:cons ':month (month msg))
    (cl:cons ':day (day msg))
    (cl:cons ':hour (hour msg))
    (cl:cons ':minute (minute msg))
    (cl:cons ':second (second msg))
    (cl:cons ':microsecond (microsecond msg))
))
