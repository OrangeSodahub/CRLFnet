;; Auto-generated. Do not edit!


(when (boundp 'rslidar_msgs::rslidarScan)
  (if (not (find-package "RSLIDAR_MSGS"))
    (make-package "RSLIDAR_MSGS"))
  (shadow 'rslidarScan (find-package "RSLIDAR_MSGS")))
(unless (find-package "RSLIDAR_MSGS::RSLIDARSCAN")
  (make-package "RSLIDAR_MSGS::RSLIDARSCAN"))

(in-package "ROS")
;;//! \htmlinclude rslidarScan.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rslidar_msgs::rslidarScan
  :super ros::object
  :slots (_header _packets ))

(defmethod rslidar_msgs::rslidarScan
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:packets __packets) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _packets __packets)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:packets
   (&rest __packets)
   (if (keywordp (car __packets))
       (send* _packets __packets)
     (progn
       (if __packets (setq _packets (car __packets)))
       _packets)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; rslidar_msgs/rslidarPacket[] _packets
    (apply #'+ (send-all _packets :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; rslidar_msgs/rslidarPacket[] _packets
     (write-long (length _packets) s)
     (dolist (elem _packets)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; rslidar_msgs/rslidarPacket[] _packets
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _packets (let (r) (dotimes (i n) (push (instance rslidar_msgs::rslidarPacket :init) r)) r))
     (dolist (elem- _packets)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get rslidar_msgs::rslidarScan :md5sum-) "ff6baa58985b528481871cbaf1bb342f")
(setf (get rslidar_msgs::rslidarScan :datatype-) "rslidar_msgs/rslidarScan")
(setf (get rslidar_msgs::rslidarScan :definition-)
      "# LIDAR scan packets.

Header           header         # standard ROS message header
rslidarPacket[] packets        # vector of raw packets

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
MSG: rslidar_msgs/rslidarPacket
# Raw LIDAR packet.

time stamp              # packet timestamp
uint8[1248] data        # packet contents


")



(provide :rslidar_msgs/rslidarScan "ff6baa58985b528481871cbaf1bb342f")


