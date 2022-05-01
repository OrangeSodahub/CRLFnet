;; Auto-generated. Do not edit!


(when (boundp 'msgs::MsgRadCam)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'MsgRadCam (find-package "MSGS")))
(unless (find-package "MSGS::MSGRADCAM")
  (make-package "MSGS::MSGRADCAM"))

(in-package "ROS")
;;//! \htmlinclude MsgRadCam.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass msgs::MsgRadCam
  :super ros::object
  :slots (_Header _match_left _radar_left _camera_left _match_right _radar_right _camera_right ))

(defmethod msgs::MsgRadCam
  (:init
   (&key
    ((:Header __Header) (instance std_msgs::Header :init))
    ((:match_left __match_left) 0.0)
    ((:radar_left __radar_left) 0.0)
    ((:camera_left __camera_left) 0.0)
    ((:match_right __match_right) 0.0)
    ((:radar_right __radar_right) 0.0)
    ((:camera_right __camera_right) 0.0)
    )
   (send-super :init)
   (setq _Header __Header)
   (setq _match_left (float __match_left))
   (setq _radar_left (float __radar_left))
   (setq _camera_left (float __camera_left))
   (setq _match_right (float __match_right))
   (setq _radar_right (float __radar_right))
   (setq _camera_right (float __camera_right))
   self)
  (:Header
   (&rest __Header)
   (if (keywordp (car __Header))
       (send* _Header __Header)
     (progn
       (if __Header (setq _Header (car __Header)))
       _Header)))
  (:match_left
   (&optional __match_left)
   (if __match_left (setq _match_left __match_left)) _match_left)
  (:radar_left
   (&optional __radar_left)
   (if __radar_left (setq _radar_left __radar_left)) _radar_left)
  (:camera_left
   (&optional __camera_left)
   (if __camera_left (setq _camera_left __camera_left)) _camera_left)
  (:match_right
   (&optional __match_right)
   (if __match_right (setq _match_right __match_right)) _match_right)
  (:radar_right
   (&optional __radar_right)
   (if __radar_right (setq _radar_right __radar_right)) _radar_right)
  (:camera_right
   (&optional __camera_right)
   (if __camera_right (setq _camera_right __camera_right)) _camera_right)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _Header
    (send _Header :serialization-length)
    ;; float32 _match_left
    4
    ;; float32 _radar_left
    4
    ;; float32 _camera_left
    4
    ;; float32 _match_right
    4
    ;; float32 _radar_right
    4
    ;; float32 _camera_right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _Header
       (send _Header :serialize s)
     ;; float32 _match_left
       (sys::poke _match_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radar_left
       (sys::poke _radar_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _camera_left
       (sys::poke _camera_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _match_right
       (sys::poke _match_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radar_right
       (sys::poke _radar_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _camera_right
       (sys::poke _camera_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _Header
     (send _Header :deserialize buf ptr-) (incf ptr- (send _Header :serialization-length))
   ;; float32 _match_left
     (setq _match_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radar_left
     (setq _radar_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _camera_left
     (setq _camera_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _match_right
     (setq _match_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radar_right
     (setq _radar_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _camera_right
     (setq _camera_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs::MsgRadCam :md5sum-) "77843f8cca22df506f0bd8510a04bfe1")
(setf (get msgs::MsgRadCam :datatype-) "msgs/MsgRadCam")
(setf (get msgs::MsgRadCam :definition-)
      "Header Header
float32 match_left
float32 radar_left
float32 camera_left
float32 match_right
float32 radar_right
float32 camera_right
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



(provide :msgs/MsgRadCam "77843f8cca22df506f0bd8510a04bfe1")


