;; Auto-generated. Do not edit!


(when (boundp 'radar_pa_msgs::radar_msg_A)
  (if (not (find-package "RADAR_PA_MSGS"))
    (make-package "RADAR_PA_MSGS"))
  (shadow 'radar_msg_A (find-package "RADAR_PA_MSGS")))
(unless (find-package "RADAR_PA_MSGS::RADAR_MSG_A")
  (make-package "RADAR_PA_MSGS::RADAR_MSG_A"))

(in-package "ROS")
;;//! \htmlinclude radar_msg_A.msg.html


(defclass radar_pa_msgs::radar_msg_A
  :super ros::object
  :slots (_message _ID _distance _velocity _power _angle _is_target _counter ))

(defmethod radar_pa_msgs::radar_msg_A
  (:init
   (&key
    ((:message __message) 0)
    ((:ID __ID) 0)
    ((:distance __distance) 0.0)
    ((:velocity __velocity) 0.0)
    ((:power __power) 0.0)
    ((:angle __angle) 0.0)
    ((:is_target __is_target) 0)
    ((:counter __counter) 0)
    )
   (send-super :init)
   (setq _message (round __message))
   (setq _ID (round __ID))
   (setq _distance (float __distance))
   (setq _velocity (float __velocity))
   (setq _power (float __power))
   (setq _angle (float __angle))
   (setq _is_target (round __is_target))
   (setq _counter (round __counter))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:power
   (&optional __power)
   (if __power (setq _power __power)) _power)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:is_target
   (&optional __is_target)
   (if __is_target (setq _is_target __is_target)) _is_target)
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
    ;; float32 _distance
    4
    ;; float32 _velocity
    4
    ;; float32 _power
    4
    ;; float32 _angle
    4
    ;; uint8 _is_target
    1
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
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _power
       (sys::poke _power (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _is_target
       (write-byte _is_target s)
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
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _power
     (setq _power (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _is_target
     (setq _is_target (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _counter
     (setq _counter (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get radar_pa_msgs::radar_msg_A :md5sum-) "6263190fa969f78dbbac8590a9a4d965")
(setf (get radar_pa_msgs::radar_msg_A :datatype-) "radar_pa_msgs/radar_msg_A")
(setf (get radar_pa_msgs::radar_msg_A :definition-)
      "uint8   message
uint32  ID
float32 distance
float32 velocity
float32 power
float32 angle
uint8   is_target
uint8   counter

")



(provide :radar_pa_msgs/radar_msg_A "6263190fa969f78dbbac8590a9a4d965")


