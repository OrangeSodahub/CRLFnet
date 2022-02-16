;; Auto-generated. Do not edit!


(when (boundp 'pb_msgs::ClusterRadar)
  (if (not (find-package "PB_MSGS"))
    (make-package "PB_MSGS"))
  (shadow 'ClusterRadar (find-package "PB_MSGS")))
(unless (find-package "PB_MSGS::CLUSTERRADAR")
  (make-package "PB_MSGS::CLUSTERRADAR"))

(in-package "ROS")
;;//! \htmlinclude ClusterRadar.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pb_msgs::ClusterRadar
  :super ros::object
  :slots (_header _target_id _longitude_dist _lateral_dist _longitude_vel _lateral_vel _rcs ))

(defmethod pb_msgs::ClusterRadar
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:target_id __target_id) 0)
    ((:longitude_dist __longitude_dist) 0.0)
    ((:lateral_dist __lateral_dist) 0.0)
    ((:longitude_vel __longitude_vel) 0.0)
    ((:lateral_vel __lateral_vel) 0.0)
    ((:rcs __rcs) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _target_id (round __target_id))
   (setq _longitude_dist (float __longitude_dist))
   (setq _lateral_dist (float __lateral_dist))
   (setq _longitude_vel (float __longitude_vel))
   (setq _lateral_vel (float __lateral_vel))
   (setq _rcs (float __rcs))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:target_id
   (&optional __target_id)
   (if __target_id (setq _target_id __target_id)) _target_id)
  (:longitude_dist
   (&optional __longitude_dist)
   (if __longitude_dist (setq _longitude_dist __longitude_dist)) _longitude_dist)
  (:lateral_dist
   (&optional __lateral_dist)
   (if __lateral_dist (setq _lateral_dist __lateral_dist)) _lateral_dist)
  (:longitude_vel
   (&optional __longitude_vel)
   (if __longitude_vel (setq _longitude_vel __longitude_vel)) _longitude_vel)
  (:lateral_vel
   (&optional __lateral_vel)
   (if __lateral_vel (setq _lateral_vel __lateral_vel)) _lateral_vel)
  (:rcs
   (&optional __rcs)
   (if __rcs (setq _rcs __rcs)) _rcs)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _target_id
    1
    ;; float32 _longitude_dist
    4
    ;; float32 _lateral_dist
    4
    ;; float32 _longitude_vel
    4
    ;; float32 _lateral_vel
    4
    ;; float32 _rcs
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _target_id
       (write-byte _target_id s)
     ;; float32 _longitude_dist
       (sys::poke _longitude_dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateral_dist
       (sys::poke _lateral_dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude_vel
       (sys::poke _longitude_vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateral_vel
       (sys::poke _lateral_vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rcs
       (sys::poke _rcs (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _target_id
     (setq _target_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _longitude_dist
     (setq _longitude_dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateral_dist
     (setq _lateral_dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude_vel
     (setq _longitude_vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateral_vel
     (setq _lateral_vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rcs
     (setq _rcs (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pb_msgs::ClusterRadar :md5sum-) "ccd4422744fe0f3d40c70da9e394ee5d")
(setf (get pb_msgs::ClusterRadar :datatype-) "pb_msgs/ClusterRadar")
(setf (get pb_msgs::ClusterRadar :definition-)
      "Header header
uint8 target_id
float32 longitude_dist
float32 lateral_dist
float32 longitude_vel
float32 lateral_vel
float32 rcs
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



(provide :pb_msgs/ClusterRadar "ccd4422744fe0f3d40c70da9e394ee5d")


