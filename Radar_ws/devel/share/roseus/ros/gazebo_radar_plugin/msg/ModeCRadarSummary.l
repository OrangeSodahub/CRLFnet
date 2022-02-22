;; Auto-generated. Do not edit!


(when (boundp 'gazebo_radar_plugin::ModeCRadarSummary)
  (if (not (find-package "GAZEBO_RADAR_PLUGIN"))
    (make-package "GAZEBO_RADAR_PLUGIN"))
  (shadow 'ModeCRadarSummary (find-package "GAZEBO_RADAR_PLUGIN")))
(unless (find-package "GAZEBO_RADAR_PLUGIN::MODECRADARSUMMARY")
  (make-package "GAZEBO_RADAR_PLUGIN::MODECRADARSUMMARY"))

(in-package "ROS")
;;//! \htmlinclude ModeCRadarSummary.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass gazebo_radar_plugin::ModeCRadarSummary
  :super ros::object
  :slots (_header _contacts ))

(defmethod gazebo_radar_plugin::ModeCRadarSummary
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:contacts __contacts) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _contacts __contacts)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:contacts
   (&rest __contacts)
   (if (keywordp (car __contacts))
       (send* _contacts __contacts)
     (progn
       (if __contacts (setq _contacts (car __contacts)))
       _contacts)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; gazebo_radar_plugin/ModeCRadar[] _contacts
    (apply #'+ (send-all _contacts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; gazebo_radar_plugin/ModeCRadar[] _contacts
     (write-long (length _contacts) s)
     (dolist (elem _contacts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; gazebo_radar_plugin/ModeCRadar[] _contacts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _contacts (let (r) (dotimes (i n) (push (instance gazebo_radar_plugin::ModeCRadar :init) r)) r))
     (dolist (elem- _contacts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get gazebo_radar_plugin::ModeCRadarSummary :md5sum-) "98cae80bd5cdf50d70e731ef44eb76ea")
(setf (get gazebo_radar_plugin::ModeCRadarSummary :datatype-) "gazebo_radar_plugin/ModeCRadarSummary")
(setf (get gazebo_radar_plugin::ModeCRadarSummary :definition-)
      "Header header
ModeCRadar[] contacts

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
MSG: gazebo_radar_plugin/ModeCRadar
Header header
float32 range  # meters
float32 bearing  # radians clockwise about Z axis of header frame
float32 altitude  # Pressure altitude (m)
uint16 code # Transponder code
bool ident  # If ident button was pressed

")



(provide :gazebo_radar_plugin/ModeCRadarSummary "98cae80bd5cdf50d70e731ef44eb76ea")


