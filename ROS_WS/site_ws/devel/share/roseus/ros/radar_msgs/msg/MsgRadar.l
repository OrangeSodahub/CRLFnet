;; Auto-generated. Do not edit!


(when (boundp 'radar_msgs::MsgRadar)
  (if (not (find-package "RADAR_MSGS"))
    (make-package "RADAR_MSGS"))
  (shadow 'MsgRadar (find-package "RADAR_MSGS")))
(unless (find-package "RADAR_MSGS::MSGRADAR")
  (make-package "RADAR_MSGS::MSGRADAR"))

(in-package "ROS")
;;//! \htmlinclude MsgRadar.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass radar_msgs::MsgRadar
  :super ros::object
  :slots (_header _total_vehicles _ObjectList ))

(defmethod radar_msgs::MsgRadar
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:total_vehicles __total_vehicles) 0.0)
    ((:ObjectList __ObjectList) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _total_vehicles (float __total_vehicles))
   (setq _ObjectList __ObjectList)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:total_vehicles
   (&optional __total_vehicles)
   (if __total_vehicles (setq _total_vehicles __total_vehicles)) _total_vehicles)
  (:ObjectList
   (&rest __ObjectList)
   (if (keywordp (car __ObjectList))
       (send* _ObjectList __ObjectList)
     (progn
       (if __ObjectList (setq _ObjectList (car __ObjectList)))
       _ObjectList)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _total_vehicles
    4
    ;; radar_msgs/MsgObject[] _ObjectList
    (apply #'+ (send-all _ObjectList :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _total_vehicles
       (sys::poke _total_vehicles (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; radar_msgs/MsgObject[] _ObjectList
     (write-long (length _ObjectList) s)
     (dolist (elem _ObjectList)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _total_vehicles
     (setq _total_vehicles (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; radar_msgs/MsgObject[] _ObjectList
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ObjectList (let (r) (dotimes (i n) (push (instance radar_msgs::MsgObject :init) r)) r))
     (dolist (elem- _ObjectList)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get radar_msgs::MsgRadar :md5sum-) "6c979660ea9f3cab98f883793f57d5c9")
(setf (get radar_msgs::MsgRadar :datatype-) "radar_msgs/MsgRadar")
(setf (get radar_msgs::MsgRadar :definition-)
      "Header header
float32 total_vehicles
MsgObject[] ObjectList
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
MSG: radar_msgs/MsgObject
Header header
float32 range  # meters
float32 range_rate # velocity
float32 angle_centroid
float32 obj_vcs_posex
float32 obj_vcs_posey
uint8 track_id
")



(provide :radar_msgs/MsgRadar "6c979660ea9f3cab98f883793f57d5c9")


