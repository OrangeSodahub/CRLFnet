;; Auto-generated. Do not edit!


(when (boundp 'msgs::MsgLidCam)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'MsgLidCam (find-package "MSGS")))
(unless (find-package "MSGS::MSGLIDCAM")
  (make-package "MSGS::MSGLIDCAM"))

(in-package "ROS")
;;//! \htmlinclude MsgLidCam.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass msgs::MsgLidCam
  :super ros::object
  :slots (_header _num_circle _num_intersection _objects_circle _objects_intersection ))

(defmethod msgs::MsgLidCam
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_circle __num_circle) 0)
    ((:num_intersection __num_intersection) 0)
    ((:objects_circle __objects_circle) ())
    ((:objects_intersection __objects_intersection) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_circle (round __num_circle))
   (setq _num_intersection (round __num_intersection))
   (setq _objects_circle __objects_circle)
   (setq _objects_intersection __objects_intersection)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:num_circle
   (&optional __num_circle)
   (if __num_circle (setq _num_circle __num_circle)) _num_circle)
  (:num_intersection
   (&optional __num_intersection)
   (if __num_intersection (setq _num_intersection __num_intersection)) _num_intersection)
  (:objects_circle
   (&rest __objects_circle)
   (if (keywordp (car __objects_circle))
       (send* _objects_circle __objects_circle)
     (progn
       (if __objects_circle (setq _objects_circle (car __objects_circle)))
       _objects_circle)))
  (:objects_intersection
   (&rest __objects_intersection)
   (if (keywordp (car __objects_intersection))
       (send* _objects_intersection __objects_intersection)
     (progn
       (if __objects_intersection (setq _objects_intersection (car __objects_intersection)))
       _objects_intersection)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _num_circle
    1
    ;; uint8 _num_intersection
    1
    ;; msgs/MsgLidCamObject[] _objects_circle
    (apply #'+ (send-all _objects_circle :serialization-length)) 4
    ;; msgs/MsgLidCamObject[] _objects_intersection
    (apply #'+ (send-all _objects_intersection :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _num_circle
       (write-byte _num_circle s)
     ;; uint8 _num_intersection
       (write-byte _num_intersection s)
     ;; msgs/MsgLidCamObject[] _objects_circle
     (write-long (length _objects_circle) s)
     (dolist (elem _objects_circle)
       (send elem :serialize s)
       )
     ;; msgs/MsgLidCamObject[] _objects_intersection
     (write-long (length _objects_intersection) s)
     (dolist (elem _objects_intersection)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _num_circle
     (setq _num_circle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _num_intersection
     (setq _num_intersection (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; msgs/MsgLidCamObject[] _objects_circle
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects_circle (let (r) (dotimes (i n) (push (instance msgs::MsgLidCamObject :init) r)) r))
     (dolist (elem- _objects_circle)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; msgs/MsgLidCamObject[] _objects_intersection
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects_intersection (let (r) (dotimes (i n) (push (instance msgs::MsgLidCamObject :init) r)) r))
     (dolist (elem- _objects_intersection)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get msgs::MsgLidCam :md5sum-) "92aac1a08f2584ca8ae9e3d8d796fb74")
(setf (get msgs::MsgLidCam :datatype-) "msgs/MsgLidCam")
(setf (get msgs::MsgLidCam :definition-)
      "Header header
uint8 num_circle
uint8 num_intersection
MsgLidCamObject[] objects_circle
MsgLidCamObject[] objects_intersection
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
MSG: msgs/MsgLidCamObject
Header header
float32 alpha
float32 pos_x           # obj_vcs_posx
float32 pos_y           # obj_vcs_posy
uint8 track_id
")



(provide :msgs/MsgLidCam "92aac1a08f2584ca8ae9e3d8d796fb74")


