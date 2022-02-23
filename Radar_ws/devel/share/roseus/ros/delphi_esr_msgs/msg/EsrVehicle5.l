;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrVehicle5)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrVehicle5 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVEHICLE5")
  (make-package "DELPHI_ESR_MSGS::ESRVEHICLE5"))

(in-package "ROS")
;;//! \htmlinclude EsrVehicle5.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrVehicle5
  :super ros::object
  :slots (_header _oversteer_understeer _yaw_rate_bias_shift _beamwidth_vert _funnel_offset_left _funnel_offset_right _cw_blockage_threshold _distance_rear_axle _wheel_base _steering_gear_ratio ))

(defmethod delphi_esr_msgs::EsrVehicle5
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:oversteer_understeer __oversteer_understeer) 0)
    ((:yaw_rate_bias_shift __yaw_rate_bias_shift) nil)
    ((:beamwidth_vert __beamwidth_vert) 0.0)
    ((:funnel_offset_left __funnel_offset_left) 0.0)
    ((:funnel_offset_right __funnel_offset_right) 0.0)
    ((:cw_blockage_threshold __cw_blockage_threshold) 0.0)
    ((:distance_rear_axle __distance_rear_axle) 0)
    ((:wheel_base __wheel_base) 0)
    ((:steering_gear_ratio __steering_gear_ratio) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _oversteer_understeer (round __oversteer_understeer))
   (setq _yaw_rate_bias_shift __yaw_rate_bias_shift)
   (setq _beamwidth_vert (float __beamwidth_vert))
   (setq _funnel_offset_left (float __funnel_offset_left))
   (setq _funnel_offset_right (float __funnel_offset_right))
   (setq _cw_blockage_threshold (float __cw_blockage_threshold))
   (setq _distance_rear_axle (round __distance_rear_axle))
   (setq _wheel_base (round __wheel_base))
   (setq _steering_gear_ratio (float __steering_gear_ratio))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:oversteer_understeer
   (&optional __oversteer_understeer)
   (if __oversteer_understeer (setq _oversteer_understeer __oversteer_understeer)) _oversteer_understeer)
  (:yaw_rate_bias_shift
   (&optional (__yaw_rate_bias_shift :null))
   (if (not (eq __yaw_rate_bias_shift :null)) (setq _yaw_rate_bias_shift __yaw_rate_bias_shift)) _yaw_rate_bias_shift)
  (:beamwidth_vert
   (&optional __beamwidth_vert)
   (if __beamwidth_vert (setq _beamwidth_vert __beamwidth_vert)) _beamwidth_vert)
  (:funnel_offset_left
   (&optional __funnel_offset_left)
   (if __funnel_offset_left (setq _funnel_offset_left __funnel_offset_left)) _funnel_offset_left)
  (:funnel_offset_right
   (&optional __funnel_offset_right)
   (if __funnel_offset_right (setq _funnel_offset_right __funnel_offset_right)) _funnel_offset_right)
  (:cw_blockage_threshold
   (&optional __cw_blockage_threshold)
   (if __cw_blockage_threshold (setq _cw_blockage_threshold __cw_blockage_threshold)) _cw_blockage_threshold)
  (:distance_rear_axle
   (&optional __distance_rear_axle)
   (if __distance_rear_axle (setq _distance_rear_axle __distance_rear_axle)) _distance_rear_axle)
  (:wheel_base
   (&optional __wheel_base)
   (if __wheel_base (setq _wheel_base __wheel_base)) _wheel_base)
  (:steering_gear_ratio
   (&optional __steering_gear_ratio)
   (if __steering_gear_ratio (setq _steering_gear_ratio __steering_gear_ratio)) _steering_gear_ratio)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _oversteer_understeer
    1
    ;; bool _yaw_rate_bias_shift
    1
    ;; float32 _beamwidth_vert
    4
    ;; float32 _funnel_offset_left
    4
    ;; float32 _funnel_offset_right
    4
    ;; float32 _cw_blockage_threshold
    4
    ;; uint16 _distance_rear_axle
    2
    ;; uint16 _wheel_base
    2
    ;; float32 _steering_gear_ratio
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _oversteer_understeer
       (write-byte _oversteer_understeer s)
     ;; bool _yaw_rate_bias_shift
       (if _yaw_rate_bias_shift (write-byte -1 s) (write-byte 0 s))
     ;; float32 _beamwidth_vert
       (sys::poke _beamwidth_vert (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _funnel_offset_left
       (sys::poke _funnel_offset_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _funnel_offset_right
       (sys::poke _funnel_offset_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cw_blockage_threshold
       (sys::poke _cw_blockage_threshold (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint16 _distance_rear_axle
       (write-word _distance_rear_axle s)
     ;; uint16 _wheel_base
       (write-word _wheel_base s)
     ;; float32 _steering_gear_ratio
       (sys::poke _steering_gear_ratio (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _oversteer_understeer
     (setq _oversteer_understeer (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _oversteer_understeer 127) (setq _oversteer_understeer (- _oversteer_understeer 256)))
   ;; bool _yaw_rate_bias_shift
     (setq _yaw_rate_bias_shift (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _beamwidth_vert
     (setq _beamwidth_vert (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _funnel_offset_left
     (setq _funnel_offset_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _funnel_offset_right
     (setq _funnel_offset_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cw_blockage_threshold
     (setq _cw_blockage_threshold (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint16 _distance_rear_axle
     (setq _distance_rear_axle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _wheel_base
     (setq _wheel_base (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _steering_gear_ratio
     (setq _steering_gear_ratio (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrVehicle5 :md5sum-) "e4135fc6914a28e2c947a8270cd84b22")
(setf (get delphi_esr_msgs::EsrVehicle5 :datatype-) "delphi_esr_msgs/EsrVehicle5")
(setf (get delphi_esr_msgs::EsrVehicle5 :definition-)
      "Header header

# ESR vehicle5
int8        oversteer_understeer
bool        yaw_rate_bias_shift
float32     beamwidth_vert
float32     funnel_offset_left
float32     funnel_offset_right
float32     cw_blockage_threshold
uint16      distance_rear_axle
uint16      wheel_base
float32     steering_gear_ratio       

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



(provide :delphi_esr_msgs/EsrVehicle5 "e4135fc6914a28e2c947a8270cd84b22")


