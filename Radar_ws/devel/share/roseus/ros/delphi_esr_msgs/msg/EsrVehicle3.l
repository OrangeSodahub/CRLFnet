;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrVehicle3)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrVehicle3 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVEHICLE3")
  (make-package "DELPHI_ESR_MSGS::ESRVEHICLE3"))

(in-package "ROS")
;;//! \htmlinclude EsrVehicle3.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrVehicle3
  :super ros::object
  :slots (_header _long_accel_valid _lat_accel_valid _lat_accel _long_accel _radar_fov_lr _radar_fov_mr _auto_align_disable _radar_height _serv_align_type _serv_align_enable _align_avg_ctr_total _auto_align_converged _wheel_slip _serv_align_updates_need _angle_mounting_offset ))

(defmethod delphi_esr_msgs::EsrVehicle3
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:long_accel_valid __long_accel_valid) nil)
    ((:lat_accel_valid __lat_accel_valid) nil)
    ((:lat_accel __lat_accel) 0.0)
    ((:long_accel __long_accel) 0.0)
    ((:radar_fov_lr __radar_fov_lr) 0)
    ((:radar_fov_mr __radar_fov_mr) 0)
    ((:auto_align_disable __auto_align_disable) nil)
    ((:radar_height __radar_height) 0)
    ((:serv_align_type __serv_align_type) nil)
    ((:serv_align_enable __serv_align_enable) nil)
    ((:align_avg_ctr_total __align_avg_ctr_total) 0)
    ((:auto_align_converged __auto_align_converged) nil)
    ((:wheel_slip __wheel_slip) 0)
    ((:serv_align_updates_need __serv_align_updates_need) 0)
    ((:angle_mounting_offset __angle_mounting_offset) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _long_accel_valid __long_accel_valid)
   (setq _lat_accel_valid __lat_accel_valid)
   (setq _lat_accel (float __lat_accel))
   (setq _long_accel (float __long_accel))
   (setq _radar_fov_lr (round __radar_fov_lr))
   (setq _radar_fov_mr (round __radar_fov_mr))
   (setq _auto_align_disable __auto_align_disable)
   (setq _radar_height (round __radar_height))
   (setq _serv_align_type __serv_align_type)
   (setq _serv_align_enable __serv_align_enable)
   (setq _align_avg_ctr_total (round __align_avg_ctr_total))
   (setq _auto_align_converged __auto_align_converged)
   (setq _wheel_slip (round __wheel_slip))
   (setq _serv_align_updates_need (round __serv_align_updates_need))
   (setq _angle_mounting_offset (round __angle_mounting_offset))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:long_accel_valid
   (&optional (__long_accel_valid :null))
   (if (not (eq __long_accel_valid :null)) (setq _long_accel_valid __long_accel_valid)) _long_accel_valid)
  (:lat_accel_valid
   (&optional (__lat_accel_valid :null))
   (if (not (eq __lat_accel_valid :null)) (setq _lat_accel_valid __lat_accel_valid)) _lat_accel_valid)
  (:lat_accel
   (&optional __lat_accel)
   (if __lat_accel (setq _lat_accel __lat_accel)) _lat_accel)
  (:long_accel
   (&optional __long_accel)
   (if __long_accel (setq _long_accel __long_accel)) _long_accel)
  (:radar_fov_lr
   (&optional __radar_fov_lr)
   (if __radar_fov_lr (setq _radar_fov_lr __radar_fov_lr)) _radar_fov_lr)
  (:radar_fov_mr
   (&optional __radar_fov_mr)
   (if __radar_fov_mr (setq _radar_fov_mr __radar_fov_mr)) _radar_fov_mr)
  (:auto_align_disable
   (&optional (__auto_align_disable :null))
   (if (not (eq __auto_align_disable :null)) (setq _auto_align_disable __auto_align_disable)) _auto_align_disable)
  (:radar_height
   (&optional __radar_height)
   (if __radar_height (setq _radar_height __radar_height)) _radar_height)
  (:serv_align_type
   (&optional (__serv_align_type :null))
   (if (not (eq __serv_align_type :null)) (setq _serv_align_type __serv_align_type)) _serv_align_type)
  (:serv_align_enable
   (&optional (__serv_align_enable :null))
   (if (not (eq __serv_align_enable :null)) (setq _serv_align_enable __serv_align_enable)) _serv_align_enable)
  (:align_avg_ctr_total
   (&optional __align_avg_ctr_total)
   (if __align_avg_ctr_total (setq _align_avg_ctr_total __align_avg_ctr_total)) _align_avg_ctr_total)
  (:auto_align_converged
   (&optional (__auto_align_converged :null))
   (if (not (eq __auto_align_converged :null)) (setq _auto_align_converged __auto_align_converged)) _auto_align_converged)
  (:wheel_slip
   (&optional __wheel_slip)
   (if __wheel_slip (setq _wheel_slip __wheel_slip)) _wheel_slip)
  (:serv_align_updates_need
   (&optional __serv_align_updates_need)
   (if __serv_align_updates_need (setq _serv_align_updates_need __serv_align_updates_need)) _serv_align_updates_need)
  (:angle_mounting_offset
   (&optional __angle_mounting_offset)
   (if __angle_mounting_offset (setq _angle_mounting_offset __angle_mounting_offset)) _angle_mounting_offset)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _long_accel_valid
    1
    ;; bool _lat_accel_valid
    1
    ;; float32 _lat_accel
    4
    ;; float32 _long_accel
    4
    ;; uint8 _radar_fov_lr
    1
    ;; uint8 _radar_fov_mr
    1
    ;; bool _auto_align_disable
    1
    ;; uint8 _radar_height
    1
    ;; bool _serv_align_type
    1
    ;; bool _serv_align_enable
    1
    ;; uint16 _align_avg_ctr_total
    2
    ;; bool _auto_align_converged
    1
    ;; uint8 _wheel_slip
    1
    ;; uint8 _serv_align_updates_need
    1
    ;; int8 _angle_mounting_offset
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _long_accel_valid
       (if _long_accel_valid (write-byte -1 s) (write-byte 0 s))
     ;; bool _lat_accel_valid
       (if _lat_accel_valid (write-byte -1 s) (write-byte 0 s))
     ;; float32 _lat_accel
       (sys::poke _lat_accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _long_accel
       (sys::poke _long_accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _radar_fov_lr
       (write-byte _radar_fov_lr s)
     ;; uint8 _radar_fov_mr
       (write-byte _radar_fov_mr s)
     ;; bool _auto_align_disable
       (if _auto_align_disable (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _radar_height
       (write-byte _radar_height s)
     ;; bool _serv_align_type
       (if _serv_align_type (write-byte -1 s) (write-byte 0 s))
     ;; bool _serv_align_enable
       (if _serv_align_enable (write-byte -1 s) (write-byte 0 s))
     ;; uint16 _align_avg_ctr_total
       (write-word _align_avg_ctr_total s)
     ;; bool _auto_align_converged
       (if _auto_align_converged (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _wheel_slip
       (write-byte _wheel_slip s)
     ;; uint8 _serv_align_updates_need
       (write-byte _serv_align_updates_need s)
     ;; int8 _angle_mounting_offset
       (write-byte _angle_mounting_offset s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _long_accel_valid
     (setq _long_accel_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _lat_accel_valid
     (setq _lat_accel_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _lat_accel
     (setq _lat_accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _long_accel
     (setq _long_accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _radar_fov_lr
     (setq _radar_fov_lr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radar_fov_mr
     (setq _radar_fov_mr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _auto_align_disable
     (setq _auto_align_disable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _radar_height
     (setq _radar_height (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _serv_align_type
     (setq _serv_align_type (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _serv_align_enable
     (setq _serv_align_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint16 _align_avg_ctr_total
     (setq _align_avg_ctr_total (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _auto_align_converged
     (setq _auto_align_converged (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _wheel_slip
     (setq _wheel_slip (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _serv_align_updates_need
     (setq _serv_align_updates_need (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _angle_mounting_offset
     (setq _angle_mounting_offset (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _angle_mounting_offset 127) (setq _angle_mounting_offset (- _angle_mounting_offset 256)))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrVehicle3 :md5sum-) "0833bf12f4f5dda6a3b6915054c197ac")
(setf (get delphi_esr_msgs::EsrVehicle3 :datatype-) "delphi_esr_msgs/EsrVehicle3")
(setf (get delphi_esr_msgs::EsrVehicle3 :definition-)
      "Header header

# ESR vehicle3
bool        long_accel_valid
bool        lat_accel_valid
float32     lat_accel
float32     long_accel
uint8       radar_fov_lr
uint8       radar_fov_mr
bool        auto_align_disable
uint8       radar_height
bool        serv_align_type
bool        serv_align_enable
uint16      align_avg_ctr_total
bool        auto_align_converged
uint8       wheel_slip
uint8       serv_align_updates_need
int8        angle_mounting_offset


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



(provide :delphi_esr_msgs/EsrVehicle3 "0833bf12f4f5dda6a3b6915054c197ac")


