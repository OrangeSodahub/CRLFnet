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
  :slots (_header _total_vehicles_left _total_vehicles_right _ObjectList_left _ObjectList_right ))

(defmethod radar_msgs::MsgRadar
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:total_vehicles_left __total_vehicles_left) 0.0)
    ((:total_vehicles_right __total_vehicles_right) 0.0)
    ((:ObjectList_left __ObjectList_left) ())
    ((:ObjectList_right __ObjectList_right) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _total_vehicles_left (float __total_vehicles_left))
   (setq _total_vehicles_right (float __total_vehicles_right))
   (setq _ObjectList_left __ObjectList_left)
   (setq _ObjectList_right __ObjectList_right)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:total_vehicles_left
   (&optional __total_vehicles_left)
   (if __total_vehicles_left (setq _total_vehicles_left __total_vehicles_left)) _total_vehicles_left)
  (:total_vehicles_right
   (&optional __total_vehicles_right)
   (if __total_vehicles_right (setq _total_vehicles_right __total_vehicles_right)) _total_vehicles_right)
  (:ObjectList_left
   (&rest __ObjectList_left)
   (if (keywordp (car __ObjectList_left))
       (send* _ObjectList_left __ObjectList_left)
     (progn
       (if __ObjectList_left (setq _ObjectList_left (car __ObjectList_left)))
       _ObjectList_left)))
  (:ObjectList_right
   (&rest __ObjectList_right)
   (if (keywordp (car __ObjectList_right))
       (send* _ObjectList_right __ObjectList_right)
     (progn
       (if __ObjectList_right (setq _ObjectList_right (car __ObjectList_right)))
       _ObjectList_right)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _total_vehicles_left
    4
    ;; float32 _total_vehicles_right
    4
    ;; radar_msgs/MsgObject[] _ObjectList_left
    (apply #'+ (send-all _ObjectList_left :serialization-length)) 4
    ;; radar_msgs/MsgObject[] _ObjectList_right
    (apply #'+ (send-all _ObjectList_right :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _total_vehicles_left
       (sys::poke _total_vehicles_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _total_vehicles_right
       (sys::poke _total_vehicles_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; radar_msgs/MsgObject[] _ObjectList_left
     (write-long (length _ObjectList_left) s)
     (dolist (elem _ObjectList_left)
       (send elem :serialize s)
       )
     ;; radar_msgs/MsgObject[] _ObjectList_right
     (write-long (length _ObjectList_right) s)
     (dolist (elem _ObjectList_right)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _total_vehicles_left
     (setq _total_vehicles_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _total_vehicles_right
     (setq _total_vehicles_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; radar_msgs/MsgObject[] _ObjectList_left
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ObjectList_left (let (r) (dotimes (i n) (push (instance radar_msgs::MsgObject :init) r)) r))
     (dolist (elem- _ObjectList_left)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; radar_msgs/MsgObject[] _ObjectList_right
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ObjectList_right (let (r) (dotimes (i n) (push (instance radar_msgs::MsgObject :init) r)) r))
     (dolist (elem- _ObjectList_right)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get radar_msgs::MsgRadar :md5sum-) "a3c7315f9e8449ffdf3d76f6033062a8")
(setf (get radar_msgs::MsgRadar :datatype-) "radar_msgs/MsgRadar")
(setf (get radar_msgs::MsgRadar :definition-)
      "Header header
float32 total_vehicles_left
float32 total_vehicles_right
MsgObject[] ObjectList_left
MsgObject[] ObjectList_right
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



(provide :radar_msgs/MsgRadar "a3c7315f9e8449ffdf3d76f6033062a8")


