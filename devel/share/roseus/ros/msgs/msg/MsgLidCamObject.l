;; Auto-generated. Do not edit!


(when (boundp 'msgs::MsgLidCamObject)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'MsgLidCamObject (find-package "MSGS")))
(unless (find-package "MSGS::MSGLIDCAMOBJECT")
  (make-package "MSGS::MSGLIDCAMOBJECT"))

(in-package "ROS")
;;//! \htmlinclude MsgLidCamObject.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass msgs::MsgLidCamObject
  :super ros::object
  :slots (_header _alpha _pos_x _pos_y _track_id ))

(defmethod msgs::MsgLidCamObject
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:alpha __alpha) 0.0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:track_id __track_id) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _alpha (float __alpha))
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
  (:alpha
   (&optional __alpha)
   (if __alpha (setq _alpha __alpha)) _alpha)
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
    ;; float32 _alpha
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
     ;; float32 _alpha
       (sys::poke _alpha (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _alpha
     (setq _alpha (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_x
     (setq _pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_y
     (setq _pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _track_id
     (setq _track_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get msgs::MsgLidCamObject :md5sum-) "7c8b7292cb11f95b4598c6ce61ded5f0")
(setf (get msgs::MsgLidCamObject :datatype-) "msgs/MsgLidCamObject")
(setf (get msgs::MsgLidCamObject :definition-)
      "Header header
float32 alpha
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



(provide :msgs/MsgLidCamObject "7c8b7292cb11f95b4598c6ce61ded5f0")


