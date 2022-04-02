;; Auto-generated. Do not edit!


(when (boundp 'radar_pa_msgs::radar_msg)
  (if (not (find-package "RADAR_PA_MSGS"))
    (make-package "RADAR_PA_MSGS"))
  (shadow 'radar_msg (find-package "RADAR_PA_MSGS")))
(unless (find-package "RADAR_PA_MSGS::RADAR_MSG")
  (make-package "RADAR_PA_MSGS::RADAR_MSG"))

(in-package "ROS")
;;//! \htmlinclude radar_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass radar_pa_msgs::radar_msg
  :super ros::object
  :slots (_header _data_A _data_B ))

(defmethod radar_pa_msgs::radar_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data_A __data_A) (let (r) (dotimes (i 48) (push (instance radar_pa_msgs::radar_msg_A :init) r)) r))
    ((:data_B __data_B) (let (r) (dotimes (i 48) (push (instance radar_pa_msgs::radar_msg_B :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _data_A __data_A)
   (setq _data_B __data_B)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data_A
   (&rest __data_A)
   (if (keywordp (car __data_A))
       (send* _data_A __data_A)
     (progn
       (if __data_A (setq _data_A (car __data_A)))
       _data_A)))
  (:data_B
   (&rest __data_B)
   (if (keywordp (car __data_B))
       (send* _data_B __data_B)
     (progn
       (if __data_B (setq _data_B (car __data_B)))
       _data_B)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; radar_pa_msgs/radar_msg_A[48] _data_A
    (apply #'+ (send-all _data_A :serialization-length))
    ;; radar_pa_msgs/radar_msg_B[48] _data_B
    (apply #'+ (send-all _data_B :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; radar_pa_msgs/radar_msg_A[48] _data_A
     (dolist (elem _data_A)
       (send elem :serialize s)
       )
     ;; radar_pa_msgs/radar_msg_B[48] _data_B
     (dolist (elem _data_B)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; radar_pa_msgs/radar_msg_A[48] _data_A
   (dotimes (i 48)
     (send (elt _data_A i) :deserialize buf ptr-) (incf ptr- (send (elt _data_A i) :serialization-length))
     )
   ;; radar_pa_msgs/radar_msg_B[48] _data_B
   (dotimes (i 48)
     (send (elt _data_B i) :deserialize buf ptr-) (incf ptr- (send (elt _data_B i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get radar_pa_msgs::radar_msg :md5sum-) "61aec62f180ed30f21938b01f727fc33")
(setf (get radar_pa_msgs::radar_msg :datatype-) "radar_pa_msgs/radar_msg")
(setf (get radar_pa_msgs::radar_msg :definition-)
      "Header header
radar_msg_A[48] data_A
radar_msg_B[48] data_B

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
MSG: radar_pa_msgs/radar_msg_A
uint8   message
uint32  ID
float32 distance
float32 velocity
float32 power
float32 angle
uint8   is_target
uint8   counter

================================================================================
MSG: radar_pa_msgs/radar_msg_B
uint8   message
uint32  ID
float32 distance_deviation
float32 velocity_deviation
float32 angle_deviation
float32 proability_target
uint8   counter

")



(provide :radar_pa_msgs/radar_msg "61aec62f180ed30f21938b01f727fc33")


