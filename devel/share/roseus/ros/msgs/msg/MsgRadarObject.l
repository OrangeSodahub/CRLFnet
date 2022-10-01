;; Auto-generated. Do not edit!


(when (boundp 'msgs::MsgRadarObject)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'MsgRadarObject (find-package "MSGS")))
(unless (find-package "MSGS::MSGRADAROBJECT")
  (make-package "MSGS::MSGRADAROBJECT"))

(in-package "ROS")
;;//! \htmlinclude MsgRadarObject.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass msgs::MsgRadarObject
  :super ros::object
  :slots (_header _distance _velocity _angle_centroid _pos_x _pos_y _track_id ))

(defmethod msgs::MsgRadarObject
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:distance __distance) 0.0)
    ((:velocity __velocity) 0.0)
    ((:angle_centroid __angle_centroid) 0.0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:track_id __track_id) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _distance (float __distance))
   (setq _velocity (float __velocity))
   (setq _angle_centroid (float __angle_centroid))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _track_id (round __track_id))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:angle_centroid
   (&optional __angle_centroid)
   (if __angle_centroid (setq _angle_centroid __angle_centroid)) _angle_centroid)
  (:pos_x
   (&optional __pos_x)
   (if __pos_x (setq _pos_x __pos_x)) _pos_x)
  (:pos_y
   (&optional __pos_y)
   (if __pos_y (setq _pos_y __pos_y)) _pos_y)
  (:track_id
   (&optional __track_id)
   (if __track_id (setq _track_id __track_id)) _track_id)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _distance
    4
    ;; float32 _velocity
    4
    ;; float32 _angle_centroid
    4
    ;; float32 _pos_x
    4
    ;; float32 _pos_y
    4
    ;; uint8 _track_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle_centroid
       (sys::poke _angle_centroid (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_x
       (sys::poke _pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_y
       (sys::poke _pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _track_id
       (write-byte _track_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle_centroid
     (setq _angle_centroid (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_x
     (setq _pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_y
     (setq _pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _track_id
     (setq _track_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get msgs::MsgRadarObject :md5sum-) "5ba57d4272b6f406543ad56644d71151")
(setf (get msgs::MsgRadarObject :datatype-) "msgs/MsgRadarObject")
(setf (get msgs::MsgRadarObject :definition-)
      "Header header
float32 distance        # range
float32 velocity        # range rate
float32 angle_centroid
float32 pos_x           # obj_vcs_posx
float32 pos_y           # obj_vcs_posy
uint8 track_id
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



(provide :msgs/MsgRadarObject "5ba57d4272b6f406543ad56644d71151")


