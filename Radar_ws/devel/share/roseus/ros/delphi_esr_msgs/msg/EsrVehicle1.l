;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrVehicle1)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrVehicle1 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVEHICLE1")
  (make-package "DELPHI_ESR_MSGS::ESRVEHICLE1"))

(in-package "ROS")
;;//! \htmlinclude EsrVehicle1.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrVehicle1
  :super ros::object
  :slots (_header _vehicle_speed _speed_direction _yaw_rate _yaw_rate_valid _radius_curvature _steering_angle_valid _steering_angle_sign _steering_angle _steering_angle_rate _steering_angle_rate_sign ))

(defmethod delphi_esr_msgs::EsrVehicle1
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vehicle_speed __vehicle_speed) 0.0)
    ((:speed_direction __speed_direction) nil)
    ((:yaw_rate __yaw_rate) 0.0)
    ((:yaw_rate_valid __yaw_rate_valid) nil)
    ((:radius_curvature __radius_curvature) 0)
    ((:steering_angle_valid __steering_angle_valid) nil)
    ((:steering_angle_sign __steering_angle_sign) nil)
    ((:steering_angle __steering_angle) 0)
    ((:steering_angle_rate __steering_angle_rate) 0)
    ((:steering_angle_rate_sign __steering_angle_rate_sign) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _vehicle_speed (float __vehicle_speed))
   (setq _speed_direction __speed_direction)
   (setq _yaw_rate (float __yaw_rate))
   (setq _yaw_rate_valid __yaw_rate_valid)
   (setq _radius_curvature (round __radius_curvature))
   (setq _steering_angle_valid __steering_angle_valid)
   (setq _steering_angle_sign __steering_angle_sign)
   (setq _steering_angle (round __steering_angle))
   (setq _steering_angle_rate (round __steering_angle_rate))
   (setq _steering_angle_rate_sign __steering_angle_rate_sign)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vehicle_speed
   (&optional __vehicle_speed)
   (if __vehicle_speed (setq _vehicle_speed __vehicle_speed)) _vehicle_speed)
  (:speed_direction
   (&optional (__speed_direction :null))
   (if (not (eq __speed_direction :null)) (setq _speed_direction __speed_direction)) _speed_direction)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:yaw_rate_valid
   (&optional (__yaw_rate_valid :null))
   (if (not (eq __yaw_rate_valid :null)) (setq _yaw_rate_valid __yaw_rate_valid)) _yaw_rate_valid)
  (:radius_curvature
   (&optional __radius_curvature)
   (if __radius_curvature (setq _radius_curvature __radius_curvature)) _radius_curvature)
  (:steering_angle_valid
   (&optional (__steering_angle_valid :null))
   (if (not (eq __steering_angle_valid :null)) (setq _steering_angle_valid __steering_angle_valid)) _steering_angle_valid)
  (:steering_angle_sign
   (&optional (__steering_angle_sign :null))
   (if (not (eq __steering_angle_sign :null)) (setq _steering_angle_sign __steering_angle_sign)) _steering_angle_sign)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:steering_angle_rate
   (&optional __steering_angle_rate)
   (if __steering_angle_rate (setq _steering_angle_rate __steering_angle_rate)) _steering_angle_rate)
  (:steering_angle_rate_sign
   (&optional (__steering_angle_rate_sign :null))
   (if (not (eq __steering_angle_rate_sign :null)) (setq _steering_angle_rate_sign __steering_angle_rate_sign)) _steering_angle_rate_sign)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _vehicle_speed
    4
    ;; bool _speed_direction
    1
    ;; float32 _yaw_rate
    4
    ;; bool _yaw_rate_valid
    1
    ;; int16 _radius_curvature
    2
    ;; bool _steering_angle_valid
    1
    ;; bool _steering_angle_sign
    1
    ;; uint16 _steering_angle
    2
    ;; uint16 _steering_angle_rate
    2
    ;; bool _steering_angle_rate_sign
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _vehicle_speed
       (sys::poke _vehicle_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _speed_direction
       (if _speed_direction (write-byte -1 s) (write-byte 0 s))
     ;; float32 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _yaw_rate_valid
       (if _yaw_rate_valid (write-byte -1 s) (write-byte 0 s))
     ;; int16 _radius_curvature
       (write-word _radius_curvature s)
     ;; bool _steering_angle_valid
       (if _steering_angle_valid (write-byte -1 s) (write-byte 0 s))
     ;; bool _steering_angle_sign
       (if _steering_angle_sign (write-byte -1 s) (write-byte 0 s))
     ;; uint16 _steering_angle
       (write-word _steering_angle s)
     ;; uint16 _steering_angle_rate
       (write-word _steering_angle_rate s)
     ;; bool _steering_angle_rate_sign
       (if _steering_angle_rate_sign (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _vehicle_speed
     (setq _vehicle_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _speed_direction
     (setq _speed_direction (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _yaw_rate_valid
     (setq _yaw_rate_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _radius_curvature
     (setq _radius_curvature (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _steering_angle_valid
     (setq _steering_angle_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _steering_angle_sign
     (setq _steering_angle_sign (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint16 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _steering_angle_rate
     (setq _steering_angle_rate (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _steering_angle_rate_sign
     (setq _steering_angle_rate_sign (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrVehicle1 :md5sum-) "ccab5c3c9c182cced0afa3db1f83373f")
(setf (get delphi_esr_msgs::EsrVehicle1 :datatype-) "delphi_esr_msgs/EsrVehicle1")
(setf (get delphi_esr_msgs::EsrVehicle1 :definition-)
      "Header header

# ESR vehicle1
float32     vehicle_speed
bool        speed_direction
float32     yaw_rate
bool        yaw_rate_valid
int16       radius_curvature
bool        steering_angle_valid
bool        steering_angle_sign
uint16      steering_angle
uint16      steering_angle_rate
bool        steering_angle_rate_sign

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



(provide :delphi_esr_msgs/EsrVehicle1 "ccab5c3c9c182cced0afa3db1f83373f")


