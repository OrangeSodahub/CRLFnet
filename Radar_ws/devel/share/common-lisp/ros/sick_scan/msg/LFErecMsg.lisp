; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude LFErecMsg.msg.html

(cl:defclass <LFErecMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fields_number
    :reader fields_number
    :initarg :fields_number
    :type cl:fixnum
    :initform 0)
   (fields
    :reader fields
    :initarg :fields
    :type (cl:vector sick_scan-msg:LFErecFieldMsg)
   :initform (cl:make-array 0 :element-type 'sick_scan-msg:LFErecFieldMsg :initial-element (cl:make-instance 'sick_scan-msg:LFErecFieldMsg))))
)

(cl:defclass LFErecMsg (<LFErecMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LFErecMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LFErecMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<LFErecMsg> is deprecated: use sick_scan-msg:LFErecMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LFErecMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:header-val is deprecated.  Use sick_scan-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'fields_number-val :lambda-list '(m))
(cl:defmethod fields_number-val ((m <LFErecMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:fields_number-val is deprecated.  Use sick_scan-msg:fields_number instead.")
  (fields_number m))

(cl:ensure-generic-function 'fields-val :lambda-list '(m))
(cl:defmethod fields-val ((m <LFErecMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:fields-val is deprecated.  Use sick_scan-msg:fields instead.")
  (fields m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LFErecMsg>) ostream)
  "Serializes a message object of type '<LFErecMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fields_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fields_number)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fields))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'fields))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LFErecMsg>) istream)
  "Deserializes a message object of type '<LFErecMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fields_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fields_number)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fields) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fields)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sick_scan-msg:LFErecFieldMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LFErecMsg>)))
  "Returns string type for a message object of type '<LFErecMsg>"
  "sick_scan/LFErecMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LFErecMsg)))
  "Returns string type for a message object of type 'LFErecMsg"
  "sick_scan/LFErecMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LFErecMsg>)))
  "Returns md5sum for a message object of type '<LFErecMsg>"
  "41b1ad74a61b1c63ee0183843d182e5b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LFErecMsg)))
  "Returns md5sum for a message object of type 'LFErecMsg"
  "41b1ad74a61b1c63ee0183843d182e5b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LFErecMsg>)))
  "Returns full string definition for message of type '<LFErecMsg>"
  (cl:format cl:nil "# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.~%# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.~%# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have~%# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)~%# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%~%Header header~%~%uint16 fields_number # number of fields~%sick_scan/LFErecFieldMsg[] fields # 3 fields for TiM871S~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sick_scan/LFErecFieldMsg~%# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.~%# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.~%# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have~%# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)~%# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%~%uint16 version_number~%uint8 field_index~%uint32 sys_count~%float32 dist_scale_factor~%float32 dist_scale_offset~%uint32 angle_scale_factor~%int32 angle_scale_offset~%uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Time block~%uint16 time_state  # No time data: 0, Time data: 1~%uint16 year        # f.e. 2021~%uint8 month        # 1 ... 12~%uint8 day          # 1 ... 31~%uint8 hour         # 0 ... 23~%uint8 minute       # 0 ... 59~%uint8 second       # 0 ... 59~%uint32 microsecond # 0 ... 999999~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LFErecMsg)))
  "Returns full string definition for message of type 'LFErecMsg"
  (cl:format cl:nil "# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.~%# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.~%# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have~%# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)~%# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%~%Header header~%~%uint16 fields_number # number of fields~%sick_scan/LFErecFieldMsg[] fields # 3 fields for TiM871S~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sick_scan/LFErecFieldMsg~%# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.~%# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.~%# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have~%# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)~%# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)~%~%uint16 version_number~%uint8 field_index~%uint32 sys_count~%float32 dist_scale_factor~%float32 dist_scale_offset~%uint32 angle_scale_factor~%int32 angle_scale_offset~%uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)~%# Time block~%uint16 time_state  # No time data: 0, Time data: 1~%uint16 year        # f.e. 2021~%uint8 month        # 1 ... 12~%uint8 day          # 1 ... 31~%uint8 hour         # 0 ... 23~%uint8 minute       # 0 ... 59~%uint8 second       # 0 ... 59~%uint32 microsecond # 0 ... 999999~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LFErecMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fields) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LFErecMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'LFErecMsg
    (cl:cons ':header (header msg))
    (cl:cons ':fields_number (fields_number msg))
    (cl:cons ':fields (fields msg))
))
