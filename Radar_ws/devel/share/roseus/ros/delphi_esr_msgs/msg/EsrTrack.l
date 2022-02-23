;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrTrack)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrTrack (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRTRACK")
  (make-package "DELPHI_ESR_MSGS::ESRTRACK"))

(in-package "ROS")
;;//! \htmlinclude EsrTrack.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrTrack
  :super ros::object
  :slots (_header _canmsg _track_ID _track_lat_rate _track_group_changed _track_status _track_angle _track_range _track_bridge_object _track_rolling_count _track_width _track_range_accel _track_med_range_mode _track_range_rate ))

(defmethod delphi_esr_msgs::EsrTrack
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:track_ID __track_ID) 0)
    ((:track_lat_rate __track_lat_rate) 0.0)
    ((:track_group_changed __track_group_changed) nil)
    ((:track_status __track_status) 0)
    ((:track_angle __track_angle) 0.0)
    ((:track_range __track_range) 0.0)
    ((:track_bridge_object __track_bridge_object) nil)
    ((:track_rolling_count __track_rolling_count) nil)
    ((:track_width __track_width) 0.0)
    ((:track_range_accel __track_range_accel) 0.0)
    ((:track_med_range_mode __track_med_range_mode) 0)
    ((:track_range_rate __track_range_rate) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _track_ID (round __track_ID))
   (setq _track_lat_rate (float __track_lat_rate))
   (setq _track_group_changed __track_group_changed)
   (setq _track_status (round __track_status))
   (setq _track_angle (float __track_angle))
   (setq _track_range (float __track_range))
   (setq _track_bridge_object __track_bridge_object)
   (setq _track_rolling_count __track_rolling_count)
   (setq _track_width (float __track_width))
   (setq _track_range_accel (float __track_range_accel))
   (setq _track_med_range_mode (round __track_med_range_mode))
   (setq _track_range_rate (float __track_range_rate))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:canmsg
   (&optional __canmsg)
   (if __canmsg (setq _canmsg __canmsg)) _canmsg)
  (:track_ID
   (&optional __track_ID)
   (if __track_ID (setq _track_ID __track_ID)) _track_ID)
  (:track_lat_rate
   (&optional __track_lat_rate)
   (if __track_lat_rate (setq _track_lat_rate __track_lat_rate)) _track_lat_rate)
  (:track_group_changed
   (&optional (__track_group_changed :null))
   (if (not (eq __track_group_changed :null)) (setq _track_group_changed __track_group_changed)) _track_group_changed)
  (:track_status
   (&optional __track_status)
   (if __track_status (setq _track_status __track_status)) _track_status)
  (:track_angle
   (&optional __track_angle)
   (if __track_angle (setq _track_angle __track_angle)) _track_angle)
  (:track_range
   (&optional __track_range)
   (if __track_range (setq _track_range __track_range)) _track_range)
  (:track_bridge_object
   (&optional (__track_bridge_object :null))
   (if (not (eq __track_bridge_object :null)) (setq _track_bridge_object __track_bridge_object)) _track_bridge_object)
  (:track_rolling_count
   (&optional (__track_rolling_count :null))
   (if (not (eq __track_rolling_count :null)) (setq _track_rolling_count __track_rolling_count)) _track_rolling_count)
  (:track_width
   (&optional __track_width)
   (if __track_width (setq _track_width __track_width)) _track_width)
  (:track_range_accel
   (&optional __track_range_accel)
   (if __track_range_accel (setq _track_range_accel __track_range_accel)) _track_range_accel)
  (:track_med_range_mode
   (&optional __track_med_range_mode)
   (if __track_med_range_mode (setq _track_med_range_mode __track_med_range_mode)) _track_med_range_mode)
  (:track_range_rate
   (&optional __track_range_rate)
   (if __track_range_rate (setq _track_range_rate __track_range_rate)) _track_range_rate)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _track_ID
    1
    ;; float32 _track_lat_rate
    4
    ;; bool _track_group_changed
    1
    ;; uint8 _track_status
    1
    ;; float32 _track_angle
    4
    ;; float32 _track_range
    4
    ;; bool _track_bridge_object
    1
    ;; bool _track_rolling_count
    1
    ;; float32 _track_width
    4
    ;; float32 _track_range_accel
    4
    ;; uint8 _track_med_range_mode
    1
    ;; float32 _track_range_rate
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _canmsg
       (write-long (length _canmsg) s) (princ _canmsg s)
     ;; uint8 _track_ID
       (write-byte _track_ID s)
     ;; float32 _track_lat_rate
       (sys::poke _track_lat_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _track_group_changed
       (if _track_group_changed (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _track_status
       (write-byte _track_status s)
     ;; float32 _track_angle
       (sys::poke _track_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _track_range
       (sys::poke _track_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _track_bridge_object
       (if _track_bridge_object (write-byte -1 s) (write-byte 0 s))
     ;; bool _track_rolling_count
       (if _track_rolling_count (write-byte -1 s) (write-byte 0 s))
     ;; float32 _track_width
       (sys::poke _track_width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _track_range_accel
       (sys::poke _track_range_accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _track_med_range_mode
       (write-byte _track_med_range_mode s)
     ;; float32 _track_range_rate
       (sys::poke _track_range_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _track_ID
     (setq _track_ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _track_lat_rate
     (setq _track_lat_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _track_group_changed
     (setq _track_group_changed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _track_status
     (setq _track_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _track_angle
     (setq _track_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _track_range
     (setq _track_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _track_bridge_object
     (setq _track_bridge_object (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _track_rolling_count
     (setq _track_rolling_count (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _track_width
     (setq _track_width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _track_range_accel
     (setq _track_range_accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _track_med_range_mode
     (setq _track_med_range_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _track_range_rate
     (setq _track_range_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrTrack :md5sum-) "0a9beb5caea714982a56115450f110c7")
(setf (get delphi_esr_msgs::EsrTrack :datatype-) "delphi_esr_msgs/EsrTrack")
(setf (get delphi_esr_msgs::EsrTrack :definition-)
      "Header header

# ESR Track Msg
string        canmsg
uint8         track_ID
float32       track_lat_rate
bool          track_group_changed
uint8         track_status
float32       track_angle
float32       track_range
bool          track_bridge_object
bool          track_rolling_count
float32       track_width
float32       track_range_accel
uint8         track_med_range_mode
float32       track_range_rate


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



(provide :delphi_esr_msgs/EsrTrack "0a9beb5caea714982a56115450f110c7")


