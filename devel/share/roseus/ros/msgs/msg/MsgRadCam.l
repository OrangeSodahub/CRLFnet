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
  :slots (_header _num_overpass ))

(defmethod msgs::MsgRadCam
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_overpass __num_overpass) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_overpass (round __num_overpass))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:num_overpass
   (&optional __num_overpass)
   (if __num_overpass (setq _num_overpass __num_overpass)) _num_overpass)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _num_overpass
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _num_overpass
       (write-byte _num_overpass s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _num_overpass
     (setq _num_overpass (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get msgs::MsgRadCam :md5sum-) "6c5400334bac6c91e919c72dca73df9e")
(setf (get msgs::MsgRadCam :datatype-) "msgs/MsgRadCam")
(setf (get msgs::MsgRadCam :definition-)
      "Header header
uint8 num_overpass
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



(provide :msgs/MsgRadCam "6c5400334bac6c91e919c72dca73df9e")


