;; Auto-generated. Do not edit!


(when (boundp 'radar_pa_msgs::radar_msg_B)
  (if (not (find-package "RADAR_PA_MSGS"))
    (make-package "RADAR_PA_MSGS"))
  (shadow 'radar_msg_B (find-package "RADAR_PA_MSGS")))
(unless (find-package "RADAR_PA_MSGS::RADAR_MSG_B")
  (make-package "RADAR_PA_MSGS::RADAR_MSG_B"))

(in-package "ROS")
;;//! \htmlinclude radar_msg_B.msg.html


(defclass radar_pa_msgs::radar_msg_B
  :super ros::object
  :slots (_message _ID _distance_deviation _velocity_deviation _angle_deviation _proability_target _counter ))

(defmethod radar_pa_msgs::radar_msg_B
  (:init
   (&key
    ((:message __message) 0)
    ((:ID __ID) 0)
    ((:distance_deviation __distance_deviation) 0.0)
    ((:velocity_deviation __velocity_deviation) 0.0)
    ((:angle_deviation __angle_deviation) 0.0)
    ((:proability_target __proability_target) 0.0)
    ((:counter __counter) 0)
    )
   (send-super :init)
   (setq _message (round __message))
   (setq _ID (round __ID))
   (setq _distance_deviation (float __distance_deviation))
   (setq _velocity_deviation (float __velocity_deviation))
   (setq _angle_deviation (float __angle_deviation))
   (setq _proability_target (float __proability_target))
   (setq _counter (round __counter))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:distance_deviation
   (&optional __distance_deviation)
   (if __distance_deviation (setq _distance_deviation __distance_deviation)) _distance_deviation)
  (:velocity_deviation
   (&optional __velocity_deviation)
   (if __velocity_deviation (setq _velocity_deviation __velocity_deviation)) _velocity_deviation)
  (:angle_deviation
   (&optional __angle_deviation)
   (if __angle_deviation (setq _angle_deviation __angle_deviation)) _angle_deviation)
  (:proability_target
   (&optional __proability_target)
   (if __proability_target (setq _proability_target __proability_target)) _proability_target)
  (:counter
   (&optional __counter)
   (if __counter (setq _counter __counter)) _counter)
  (:serialization-length
   ()
   (+
    ;; uint8 _message
    1
    ;; uint32 _ID
    4
    ;; float32 _distance_deviation
    4
    ;; float32 _velocity_deviation
    4
    ;; float32 _angle_deviation
    4
    ;; float32 _proability_target
    4
    ;; uint8 _counter
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _message
       (write-byte _message s)
     ;; uint32 _ID
       (write-long _ID s)
     ;; float32 _distance_deviation
       (sys::poke _distance_deviation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity_deviation
       (sys::poke _velocity_deviation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle_deviation
       (sys::poke _angle_deviation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proability_target
       (sys::poke _proability_target (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _counter
       (write-byte _counter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _message
     (setq _message (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _ID
     (setq _ID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _distance_deviation
     (setq _distance_deviation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity_deviation
     (setq _velocity_deviation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle_deviation
     (setq _angle_deviation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proability_target
     (setq _proability_target (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _counter
     (setq _counter (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get radar_pa_msgs::radar_msg_B :md5sum-) "596d24d33b8a883eb8423004f314ff5f")
(setf (get radar_pa_msgs::radar_msg_B :datatype-) "radar_pa_msgs/radar_msg_B")
(setf (get radar_pa_msgs::radar_msg_B :definition-)
      "uint8   message
uint32  ID
float32 distance_deviation
float32 velocity_deviation
float32 angle_deviation
float32 proability_target
uint8   counter

")



(provide :radar_pa_msgs/radar_msg_B "596d24d33b8a883eb8423004f314ff5f")


