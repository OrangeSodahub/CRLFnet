;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::Encoder)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'Encoder (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::ENCODER")
  (make-package "SICK_SCAN::ENCODER"))

(in-package "ROS")
;;//! \htmlinclude Encoder.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sick_scan::Encoder
  :super ros::object
  :slots (_header _enc_position _enc_speed ))

(defmethod sick_scan::Encoder
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:enc_position __enc_position) 0)
    ((:enc_speed __enc_speed) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _enc_position (round __enc_position))
   (setq _enc_speed (round __enc_speed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:enc_position
   (&optional __enc_position)
   (if __enc_position (setq _enc_position __enc_position)) _enc_position)
  (:enc_speed
   (&optional __enc_speed)
   (if __enc_speed (setq _enc_speed __enc_speed)) _enc_speed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _enc_position
    4
    ;; int16 _enc_speed
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _enc_position
       (write-long _enc_position s)
     ;; int16 _enc_speed
       (write-word _enc_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _enc_position
     (setq _enc_position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _enc_speed
     (setq _enc_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sick_scan::Encoder :md5sum-) "54930fcfc2dd947b1ad5f398b208008f")
(setf (get sick_scan::Encoder :datatype-) "sick_scan/Encoder")
(setf (get sick_scan::Encoder :definition-)
      "#This message contains the counter reading of the encoder at the datagram time (timestamp in header).

Header header           # same information as in laserscan and Pointcloud2 message

int32 enc_position     # number of ticks
int16 enc_speed         # number of ticks per millimeter

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

")



(provide :sick_scan/Encoder "54930fcfc2dd947b1ad5f398b208008f")


