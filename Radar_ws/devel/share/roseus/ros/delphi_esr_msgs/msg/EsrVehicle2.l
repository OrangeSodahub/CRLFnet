;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrVehicle2)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrVehicle2 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVEHICLE2")
  (make-package "DELPHI_ESR_MSGS::ESRVEHICLE2"))

(in-package "ROS")
;;//! \htmlinclude EsrVehicle2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrVehicle2
  :super ros::object
  :slots (_header _scan_index_ack _use_angle_misalignment _clear_faults _high_yaw_angle _mr_only_transmit _lr_only_transmit _angle_misalignment _lateral_mounting_offset _radar_cmd_radiate _blockage_disable _maximum_tracks _turn_signal_status _vehicle_speed_valid _mmr_upside_down _grouping_mode _wiper_status _raw_data_enabled ))

(defmethod delphi_esr_msgs::EsrVehicle2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:scan_index_ack __scan_index_ack) 0)
    ((:use_angle_misalignment __use_angle_misalignment) nil)
    ((:clear_faults __clear_faults) nil)
    ((:high_yaw_angle __high_yaw_angle) 0)
    ((:mr_only_transmit __mr_only_transmit) nil)
    ((:lr_only_transmit __lr_only_transmit) nil)
    ((:angle_misalignment __angle_misalignment) 0.0)
    ((:lateral_mounting_offset __lateral_mounting_offset) 0.0)
    ((:radar_cmd_radiate __radar_cmd_radiate) nil)
    ((:blockage_disable __blockage_disable) nil)
    ((:maximum_tracks __maximum_tracks) 0)
    ((:turn_signal_status __turn_signal_status) 0)
    ((:vehicle_speed_valid __vehicle_speed_valid) nil)
    ((:mmr_upside_down __mmr_upside_down) nil)
    ((:grouping_mode __grouping_mode) 0)
    ((:wiper_status __wiper_status) nil)
    ((:raw_data_enabled __raw_data_enabled) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _scan_index_ack (round __scan_index_ack))
   (setq _use_angle_misalignment __use_angle_misalignment)
   (setq _clear_faults __clear_faults)
   (setq _high_yaw_angle (round __high_yaw_angle))
   (setq _mr_only_transmit __mr_only_transmit)
   (setq _lr_only_transmit __lr_only_transmit)
   (setq _angle_misalignment (float __angle_misalignment))
   (setq _lateral_mounting_offset (float __lateral_mounting_offset))
   (setq _radar_cmd_radiate __radar_cmd_radiate)
   (setq _blockage_disable __blockage_disable)
   (setq _maximum_tracks (round __maximum_tracks))
   (setq _turn_signal_status (round __turn_signal_status))
   (setq _vehicle_speed_valid __vehicle_speed_valid)
   (setq _mmr_upside_down __mmr_upside_down)
   (setq _grouping_mode (round __grouping_mode))
   (setq _wiper_status __wiper_status)
   (setq _raw_data_enabled __raw_data_enabled)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:scan_index_ack
   (&optional __scan_index_ack)
   (if __scan_index_ack (setq _scan_index_ack __scan_index_ack)) _scan_index_ack)
  (:use_angle_misalignment
   (&optional (__use_angle_misalignment :null))
   (if (not (eq __use_angle_misalignment :null)) (setq _use_angle_misalignment __use_angle_misalignment)) _use_angle_misalignment)
  (:clear_faults
   (&optional (__clear_faults :null))
   (if (not (eq __clear_faults :null)) (setq _clear_faults __clear_faults)) _clear_faults)
  (:high_yaw_angle
   (&optional __high_yaw_angle)
   (if __high_yaw_angle (setq _high_yaw_angle __high_yaw_angle)) _high_yaw_angle)
  (:mr_only_transmit
   (&optional (__mr_only_transmit :null))
   (if (not (eq __mr_only_transmit :null)) (setq _mr_only_transmit __mr_only_transmit)) _mr_only_transmit)
  (:lr_only_transmit
   (&optional (__lr_only_transmit :null))
   (if (not (eq __lr_only_transmit :null)) (setq _lr_only_transmit __lr_only_transmit)) _lr_only_transmit)
  (:angle_misalignment
   (&optional __angle_misalignment)
   (if __angle_misalignment (setq _angle_misalignment __angle_misalignment)) _angle_misalignment)
  (:lateral_mounting_offset
   (&optional __lateral_mounting_offset)
   (if __lateral_mounting_offset (setq _lateral_mounting_offset __lateral_mounting_offset)) _lateral_mounting_offset)
  (:radar_cmd_radiate
   (&optional (__radar_cmd_radiate :null))
   (if (not (eq __radar_cmd_radiate :null)) (setq _radar_cmd_radiate __radar_cmd_radiate)) _radar_cmd_radiate)
  (:blockage_disable
   (&optional (__blockage_disable :null))
   (if (not (eq __blockage_disable :null)) (setq _blockage_disable __blockage_disable)) _blockage_disable)
  (:maximum_tracks
   (&optional __maximum_tracks)
   (if __maximum_tracks (setq _maximum_tracks __maximum_tracks)) _maximum_tracks)
  (:turn_signal_status
   (&optional __turn_signal_status)
   (if __turn_signal_status (setq _turn_signal_status __turn_signal_status)) _turn_signal_status)
  (:vehicle_speed_valid
   (&optional (__vehicle_speed_valid :null))
   (if (not (eq __vehicle_speed_valid :null)) (setq _vehicle_speed_valid __vehicle_speed_valid)) _vehicle_speed_valid)
  (:mmr_upside_down
   (&optional (__mmr_upside_down :null))
   (if (not (eq __mmr_upside_down :null)) (setq _mmr_upside_down __mmr_upside_down)) _mmr_upside_down)
  (:grouping_mode
   (&optional __grouping_mode)
   (if __grouping_mode (setq _grouping_mode __grouping_mode)) _grouping_mode)
  (:wiper_status
   (&optional (__wiper_status :null))
   (if (not (eq __wiper_status :null)) (setq _wiper_status __wiper_status)) _wiper_status)
  (:raw_data_enabled
   (&optional (__raw_data_enabled :null))
   (if (not (eq __raw_data_enabled :null)) (setq _raw_data_enabled __raw_data_enabled)) _raw_data_enabled)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _scan_index_ack
    2
    ;; bool _use_angle_misalignment
    1
    ;; bool _clear_faults
    1
    ;; int8 _high_yaw_angle
    1
    ;; bool _mr_only_transmit
    1
    ;; bool _lr_only_transmit
    1
    ;; float32 _angle_misalignment
    4
    ;; float32 _lateral_mounting_offset
    4
    ;; bool _radar_cmd_radiate
    1
    ;; bool _blockage_disable
    1
    ;; uint8 _maximum_tracks
    1
    ;; uint8 _turn_signal_status
    1
    ;; bool _vehicle_speed_valid
    1
    ;; bool _mmr_upside_down
    1
    ;; uint8 _grouping_mode
    1
    ;; bool _wiper_status
    1
    ;; bool _raw_data_enabled
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _scan_index_ack
       (write-word _scan_index_ack s)
     ;; bool _use_angle_misalignment
       (if _use_angle_misalignment (write-byte -1 s) (write-byte 0 s))
     ;; bool _clear_faults
       (if _clear_faults (write-byte -1 s) (write-byte 0 s))
     ;; int8 _high_yaw_angle
       (write-byte _high_yaw_angle s)
     ;; bool _mr_only_transmit
       (if _mr_only_transmit (write-byte -1 s) (write-byte 0 s))
     ;; bool _lr_only_transmit
       (if _lr_only_transmit (write-byte -1 s) (write-byte 0 s))
     ;; float32 _angle_misalignment
       (sys::poke _angle_misalignment (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateral_mounting_offset
       (sys::poke _lateral_mounting_offset (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _radar_cmd_radiate
       (if _radar_cmd_radiate (write-byte -1 s) (write-byte 0 s))
     ;; bool _blockage_disable
       (if _blockage_disable (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _maximum_tracks
       (write-byte _maximum_tracks s)
     ;; uint8 _turn_signal_status
       (write-byte _turn_signal_status s)
     ;; bool _vehicle_speed_valid
       (if _vehicle_speed_valid (write-byte -1 s) (write-byte 0 s))
     ;; bool _mmr_upside_down
       (if _mmr_upside_down (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _grouping_mode
       (write-byte _grouping_mode s)
     ;; bool _wiper_status
       (if _wiper_status (write-byte -1 s) (write-byte 0 s))
     ;; bool _raw_data_enabled
       (if _raw_data_enabled (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _scan_index_ack
     (setq _scan_index_ack (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _use_angle_misalignment
     (setq _use_angle_misalignment (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _clear_faults
     (setq _clear_faults (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _high_yaw_angle
     (setq _high_yaw_angle (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _high_yaw_angle 127) (setq _high_yaw_angle (- _high_yaw_angle 256)))
   ;; bool _mr_only_transmit
     (setq _mr_only_transmit (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _lr_only_transmit
     (setq _lr_only_transmit (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _angle_misalignment
     (setq _angle_misalignment (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateral_mounting_offset
     (setq _lateral_mounting_offset (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _radar_cmd_radiate
     (setq _radar_cmd_radiate (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _blockage_disable
     (setq _blockage_disable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _maximum_tracks
     (setq _maximum_tracks (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _turn_signal_status
     (setq _turn_signal_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _vehicle_speed_valid
     (setq _vehicle_speed_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _mmr_upside_down
     (setq _mmr_upside_down (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _grouping_mode
     (setq _grouping_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _wiper_status
     (setq _wiper_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _raw_data_enabled
     (setq _raw_data_enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrVehicle2 :md5sum-) "034f7a7ed6d34122e2b7d043548b7f0d")
(setf (get delphi_esr_msgs::EsrVehicle2 :datatype-) "delphi_esr_msgs/EsrVehicle2")
(setf (get delphi_esr_msgs::EsrVehicle2 :definition-)
      "Header header

# ESR vehicle2
uint16      scan_index_ack
bool        use_angle_misalignment
bool        clear_faults
int8        high_yaw_angle
bool        mr_only_transmit
bool        lr_only_transmit
float32     angle_misalignment
float32     lateral_mounting_offset
bool        radar_cmd_radiate
bool        blockage_disable
uint8       maximum_tracks
uint8       turn_signal_status
bool        vehicle_speed_valid
bool        mmr_upside_down
uint8       grouping_mode
bool        wiper_status
bool        raw_data_enabled

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



(provide :delphi_esr_msgs/EsrVehicle2 "034f7a7ed6d34122e2b7d043548b7f0d")


