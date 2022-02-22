;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::LFErecMsg)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'LFErecMsg (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::LFERECMSG")
  (make-package "SICK_SCAN::LFERECMSG"))

(in-package "ROS")
;;//! \htmlinclude LFErecMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sick_scan::LFErecMsg
  :super ros::object
  :slots (_header _fields_number _fields ))

(defmethod sick_scan::LFErecMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:fields_number __fields_number) 0)
    ((:fields __fields) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _fields_number (round __fields_number))
   (setq _fields __fields)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:fields_number
   (&optional __fields_number)
   (if __fields_number (setq _fields_number __fields_number)) _fields_number)
  (:fields
   (&rest __fields)
   (if (keywordp (car __fields))
       (send* _fields __fields)
     (progn
       (if __fields (setq _fields (car __fields)))
       _fields)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _fields_number
    2
    ;; sick_scan/LFErecFieldMsg[] _fields
    (apply #'+ (send-all _fields :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _fields_number
       (write-word _fields_number s)
     ;; sick_scan/LFErecFieldMsg[] _fields
     (write-long (length _fields) s)
     (dolist (elem _fields)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _fields_number
     (setq _fields_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; sick_scan/LFErecFieldMsg[] _fields
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fields (let (r) (dotimes (i n) (push (instance sick_scan::LFErecFieldMsg :init) r)) r))
     (dolist (elem- _fields)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sick_scan::LFErecMsg :md5sum-) "41b1ad74a61b1c63ee0183843d182e5b")
(setf (get sick_scan::LFErecMsg :datatype-) "sick_scan/LFErecMsg")
(setf (get sick_scan::LFErecMsg :definition-)
      "# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.
# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.
# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have
# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)
# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)

Header header

uint16 fields_number # number of fields
sick_scan/LFErecFieldMsg[] fields # 3 fields for TiM871S

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sick_scan/LFErecFieldMsg
# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.
# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.
# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have
# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)
# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)

uint16 version_number
uint8 field_index
uint32 sys_count
float32 dist_scale_factor
float32 dist_scale_offset
uint32 angle_scale_factor
int32 angle_scale_offset
uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
# Time block
uint16 time_state  # No time data: 0, Time data: 1
uint16 year        # f.e. 2021
uint8 month        # 1 ... 12
uint8 day          # 1 ... 31
uint8 hour         # 0 ... 23
uint8 minute       # 0 ... 59
uint8 second       # 0 ... 59
uint32 microsecond # 0 ... 999999

")



(provide :sick_scan/LFErecMsg "41b1ad74a61b1c63ee0183843d182e5b")


