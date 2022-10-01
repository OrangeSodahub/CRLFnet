;; Auto-generated. Do not edit!


(when (boundp 'msgs::MsgRadar)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'MsgRadar (find-package "MSGS")))
(unless (find-package "MSGS::MSGRADAR")
  (make-package "MSGS::MSGRADAR"))

(in-package "ROS")
;;//! \htmlinclude MsgRadar.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass msgs::MsgRadar
  :super ros::object
  :slots (_header _num_left _num_right _objects_left _objects_right ))

(defmethod msgs::MsgRadar
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_left __num_left) 0)
    ((:num_right __num_right) 0)
    ((:objects_left __objects_left) ())
    ((:objects_right __objects_right) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_left (round __num_left))
   (setq _num_right (round __num_right))
   (setq _objects_left __objects_left)
   (setq _objects_right __objects_right)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:num_left
   (&optional __num_left)
   (if __num_left (setq _num_left __num_left)) _num_left)
  (:num_right
   (&optional __num_right)
   (if __num_right (setq _num_right __num_right)) _num_right)
  (:objects_left
   (&rest __objects_left)
   (if (keywordp (car __objects_left))
       (send* _objects_left __objects_left)
     (progn
       (if __objects_left (setq _objects_left (car __objects_left)))
       _objects_left)))
  (:objects_right
   (&rest __objects_right)
   (if (keywordp (car __objects_right))
       (send* _objects_right __objects_right)
     (progn
       (if __objects_right (setq _objects_right (car __objects_right)))
       _objects_right)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _num_left
    1
    ;; uint8 _num_right
    1
    ;; msgs/MsgRadarObject[] _objects_left
    (apply #'+ (send-all _objects_left :serialization-length)) 4
    ;; msgs/MsgRadarObject[] _objects_right
    (apply #'+ (send-all _objects_right :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _num_left
       (write-byte _num_left s)
     ;; uint8 _num_right
       (write-byte _num_right s)
     ;; msgs/MsgRadarObject[] _objects_left
     (write-long (length _objects_left) s)
     (dolist (elem _objects_left)
       (send elem :serialize s)
       )
     ;; msgs/MsgRadarObject[] _objects_right
     (write-long (length _objects_right) s)
     (dolist (elem _objects_right)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _num_left
     (setq _num_left (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _num_right
     (setq _num_right (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; msgs/MsgRadarObject[] _objects_left
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects_left (let (r) (dotimes (i n) (push (instance msgs::MsgRadarObject :init) r)) r))
     (dolist (elem- _objects_left)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; msgs/MsgRadarObject[] _objects_right
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects_right (let (r) (dotimes (i n) (push (instance msgs::MsgRadarObject :init) r)) r))
     (dolist (elem- _objects_right)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get msgs::MsgRadar :md5sum-) "b60bab8d6e3388b4d94d6bd0bfb100f8")
(setf (get msgs::MsgRadar :datatype-) "msgs/MsgRadar")
(setf (get msgs::MsgRadar :definition-)
      "Header header
uint8 num_left
uint8 num_right
MsgRadarObject[] objects_left
MsgRadarObject[] objects_right
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
MSG: msgs/MsgRadarObject
Header header
float32 distance        # range
float32 velocity        # range rate
float32 angle_centroid
float32 pos_x           # obj_vcs_posx
float32 pos_y           # obj_vcs_posy
uint8 track_id
")



(provide :msgs/MsgRadar "b60bab8d6e3388b4d94d6bd0bfb100f8")


