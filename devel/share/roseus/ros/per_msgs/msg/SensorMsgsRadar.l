;; Auto-generated. Do not edit!


(when (boundp 'per_msgs::SensorMsgsRadar)
  (if (not (find-package "PER_MSGS"))
    (make-package "PER_MSGS"))
  (shadow 'SensorMsgsRadar (find-package "PER_MSGS")))
(unless (find-package "PER_MSGS::SENSORMSGSRADAR")
  (make-package "PER_MSGS::SENSORMSGSRADAR"))

(in-package "ROS")
;;//! \htmlinclude SensorMsgsRadar.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass per_msgs::SensorMsgsRadar
  :super ros::object
  :slots (_header _range _total_front_esr_tracks _total_front_right_esr_tracks _total_front_left_esr_tracks _front_esr_tracker_counter _front_left_esr_tracker_counter _front_right_esr_tracker_counter _total_rear_sbmp_tracks _rear_sbmp_tracker_counter _total_fsm4_tracks _fsm4_tracker_counter _fsm4_tracklist _rear_sbmp_tracklist _front_esr_tracklist _front_right_esr_tracklist _front_left_esr_tracklist ))

(defmethod per_msgs::SensorMsgsRadar
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:range __range) 0.0)
    ((:total_front_esr_tracks __total_front_esr_tracks) 0.0)
    ((:total_front_right_esr_tracks __total_front_right_esr_tracks) 0.0)
    ((:total_front_left_esr_tracks __total_front_left_esr_tracks) 0.0)
    ((:front_esr_tracker_counter __front_esr_tracker_counter) 0.0)
    ((:front_left_esr_tracker_counter __front_left_esr_tracker_counter) 0.0)
    ((:front_right_esr_tracker_counter __front_right_esr_tracker_counter) 0.0)
    ((:total_rear_sbmp_tracks __total_rear_sbmp_tracks) 0.0)
    ((:rear_sbmp_tracker_counter __rear_sbmp_tracker_counter) 0.0)
    ((:total_fsm4_tracks __total_fsm4_tracks) 0.0)
    ((:fsm4_tracker_counter __fsm4_tracker_counter) 0.0)
    ((:fsm4_tracklist __fsm4_tracklist) ())
    ((:rear_sbmp_tracklist __rear_sbmp_tracklist) ())
    ((:front_esr_tracklist __front_esr_tracklist) ())
    ((:front_right_esr_tracklist __front_right_esr_tracklist) ())
    ((:front_left_esr_tracklist __front_left_esr_tracklist) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _range (float __range))
   (setq _total_front_esr_tracks (float __total_front_esr_tracks))
   (setq _total_front_right_esr_tracks (float __total_front_right_esr_tracks))
   (setq _total_front_left_esr_tracks (float __total_front_left_esr_tracks))
   (setq _front_esr_tracker_counter (float __front_esr_tracker_counter))
   (setq _front_left_esr_tracker_counter (float __front_left_esr_tracker_counter))
   (setq _front_right_esr_tracker_counter (float __front_right_esr_tracker_counter))
   (setq _total_rear_sbmp_tracks (float __total_rear_sbmp_tracks))
   (setq _rear_sbmp_tracker_counter (float __rear_sbmp_tracker_counter))
   (setq _total_fsm4_tracks (float __total_fsm4_tracks))
   (setq _fsm4_tracker_counter (float __fsm4_tracker_counter))
   (setq _fsm4_tracklist __fsm4_tracklist)
   (setq _rear_sbmp_tracklist __rear_sbmp_tracklist)
   (setq _front_esr_tracklist __front_esr_tracklist)
   (setq _front_right_esr_tracklist __front_right_esr_tracklist)
   (setq _front_left_esr_tracklist __front_left_esr_tracklist)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:total_front_esr_tracks
   (&optional __total_front_esr_tracks)
   (if __total_front_esr_tracks (setq _total_front_esr_tracks __total_front_esr_tracks)) _total_front_esr_tracks)
  (:total_front_right_esr_tracks
   (&optional __total_front_right_esr_tracks)
   (if __total_front_right_esr_tracks (setq _total_front_right_esr_tracks __total_front_right_esr_tracks)) _total_front_right_esr_tracks)
  (:total_front_left_esr_tracks
   (&optional __total_front_left_esr_tracks)
   (if __total_front_left_esr_tracks (setq _total_front_left_esr_tracks __total_front_left_esr_tracks)) _total_front_left_esr_tracks)
  (:front_esr_tracker_counter
   (&optional __front_esr_tracker_counter)
   (if __front_esr_tracker_counter (setq _front_esr_tracker_counter __front_esr_tracker_counter)) _front_esr_tracker_counter)
  (:front_left_esr_tracker_counter
   (&optional __front_left_esr_tracker_counter)
   (if __front_left_esr_tracker_counter (setq _front_left_esr_tracker_counter __front_left_esr_tracker_counter)) _front_left_esr_tracker_counter)
  (:front_right_esr_tracker_counter
   (&optional __front_right_esr_tracker_counter)
   (if __front_right_esr_tracker_counter (setq _front_right_esr_tracker_counter __front_right_esr_tracker_counter)) _front_right_esr_tracker_counter)
  (:total_rear_sbmp_tracks
   (&optional __total_rear_sbmp_tracks)
   (if __total_rear_sbmp_tracks (setq _total_rear_sbmp_tracks __total_rear_sbmp_tracks)) _total_rear_sbmp_tracks)
  (:rear_sbmp_tracker_counter
   (&optional __rear_sbmp_tracker_counter)
   (if __rear_sbmp_tracker_counter (setq _rear_sbmp_tracker_counter __rear_sbmp_tracker_counter)) _rear_sbmp_tracker_counter)
  (:total_fsm4_tracks
   (&optional __total_fsm4_tracks)
   (if __total_fsm4_tracks (setq _total_fsm4_tracks __total_fsm4_tracks)) _total_fsm4_tracks)
  (:fsm4_tracker_counter
   (&optional __fsm4_tracker_counter)
   (if __fsm4_tracker_counter (setq _fsm4_tracker_counter __fsm4_tracker_counter)) _fsm4_tracker_counter)
  (:fsm4_tracklist
   (&rest __fsm4_tracklist)
   (if (keywordp (car __fsm4_tracklist))
       (send* _fsm4_tracklist __fsm4_tracklist)
     (progn
       (if __fsm4_tracklist (setq _fsm4_tracklist (car __fsm4_tracklist)))
       _fsm4_tracklist)))
  (:rear_sbmp_tracklist
   (&rest __rear_sbmp_tracklist)
   (if (keywordp (car __rear_sbmp_tracklist))
       (send* _rear_sbmp_tracklist __rear_sbmp_tracklist)
     (progn
       (if __rear_sbmp_tracklist (setq _rear_sbmp_tracklist (car __rear_sbmp_tracklist)))
       _rear_sbmp_tracklist)))
  (:front_esr_tracklist
   (&rest __front_esr_tracklist)
   (if (keywordp (car __front_esr_tracklist))
       (send* _front_esr_tracklist __front_esr_tracklist)
     (progn
       (if __front_esr_tracklist (setq _front_esr_tracklist (car __front_esr_tracklist)))
       _front_esr_tracklist)))
  (:front_right_esr_tracklist
   (&rest __front_right_esr_tracklist)
   (if (keywordp (car __front_right_esr_tracklist))
       (send* _front_right_esr_tracklist __front_right_esr_tracklist)
     (progn
       (if __front_right_esr_tracklist (setq _front_right_esr_tracklist (car __front_right_esr_tracklist)))
       _front_right_esr_tracklist)))
  (:front_left_esr_tracklist
   (&rest __front_left_esr_tracklist)
   (if (keywordp (car __front_left_esr_tracklist))
       (send* _front_left_esr_tracklist __front_left_esr_tracklist)
     (progn
       (if __front_left_esr_tracklist (setq _front_left_esr_tracklist (car __front_left_esr_tracklist)))
       _front_left_esr_tracklist)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _range
    4
    ;; float32 _total_front_esr_tracks
    4
    ;; float32 _total_front_right_esr_tracks
    4
    ;; float32 _total_front_left_esr_tracks
    4
    ;; float32 _front_esr_tracker_counter
    4
    ;; float32 _front_left_esr_tracker_counter
    4
    ;; float32 _front_right_esr_tracker_counter
    4
    ;; float32 _total_rear_sbmp_tracks
    4
    ;; float32 _rear_sbmp_tracker_counter
    4
    ;; float32 _total_fsm4_tracks
    4
    ;; float32 _fsm4_tracker_counter
    4
    ;; per_msgs/GeometryMsgsRadarObject[] _fsm4_tracklist
    (apply #'+ (send-all _fsm4_tracklist :serialization-length)) 4
    ;; per_msgs/GeometryMsgsRadarObject[] _rear_sbmp_tracklist
    (apply #'+ (send-all _rear_sbmp_tracklist :serialization-length)) 4
    ;; per_msgs/GeometryMsgsRadarObject[] _front_esr_tracklist
    (apply #'+ (send-all _front_esr_tracklist :serialization-length)) 4
    ;; per_msgs/GeometryMsgsRadarObject[] _front_right_esr_tracklist
    (apply #'+ (send-all _front_right_esr_tracklist :serialization-length)) 4
    ;; per_msgs/GeometryMsgsRadarObject[] _front_left_esr_tracklist
    (apply #'+ (send-all _front_left_esr_tracklist :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _range
       (sys::poke _range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _total_front_esr_tracks
       (sys::poke _total_front_esr_tracks (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _total_front_right_esr_tracks
       (sys::poke _total_front_right_esr_tracks (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _total_front_left_esr_tracks
       (sys::poke _total_front_left_esr_tracks (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _front_esr_tracker_counter
       (sys::poke _front_esr_tracker_counter (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _front_left_esr_tracker_counter
       (sys::poke _front_left_esr_tracker_counter (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _front_right_esr_tracker_counter
       (sys::poke _front_right_esr_tracker_counter (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _total_rear_sbmp_tracks
       (sys::poke _total_rear_sbmp_tracks (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rear_sbmp_tracker_counter
       (sys::poke _rear_sbmp_tracker_counter (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _total_fsm4_tracks
       (sys::poke _total_fsm4_tracks (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fsm4_tracker_counter
       (sys::poke _fsm4_tracker_counter (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; per_msgs/GeometryMsgsRadarObject[] _fsm4_tracklist
     (write-long (length _fsm4_tracklist) s)
     (dolist (elem _fsm4_tracklist)
       (send elem :serialize s)
       )
     ;; per_msgs/GeometryMsgsRadarObject[] _rear_sbmp_tracklist
     (write-long (length _rear_sbmp_tracklist) s)
     (dolist (elem _rear_sbmp_tracklist)
       (send elem :serialize s)
       )
     ;; per_msgs/GeometryMsgsRadarObject[] _front_esr_tracklist
     (write-long (length _front_esr_tracklist) s)
     (dolist (elem _front_esr_tracklist)
       (send elem :serialize s)
       )
     ;; per_msgs/GeometryMsgsRadarObject[] _front_right_esr_tracklist
     (write-long (length _front_right_esr_tracklist) s)
     (dolist (elem _front_right_esr_tracklist)
       (send elem :serialize s)
       )
     ;; per_msgs/GeometryMsgsRadarObject[] _front_left_esr_tracklist
     (write-long (length _front_left_esr_tracklist) s)
     (dolist (elem _front_left_esr_tracklist)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _range
     (setq _range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _total_front_esr_tracks
     (setq _total_front_esr_tracks (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _total_front_right_esr_tracks
     (setq _total_front_right_esr_tracks (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _total_front_left_esr_tracks
     (setq _total_front_left_esr_tracks (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _front_esr_tracker_counter
     (setq _front_esr_tracker_counter (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _front_left_esr_tracker_counter
     (setq _front_left_esr_tracker_counter (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _front_right_esr_tracker_counter
     (setq _front_right_esr_tracker_counter (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _total_rear_sbmp_tracks
     (setq _total_rear_sbmp_tracks (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rear_sbmp_tracker_counter
     (setq _rear_sbmp_tracker_counter (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _total_fsm4_tracks
     (setq _total_fsm4_tracks (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fsm4_tracker_counter
     (setq _fsm4_tracker_counter (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; per_msgs/GeometryMsgsRadarObject[] _fsm4_tracklist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fsm4_tracklist (let (r) (dotimes (i n) (push (instance per_msgs::GeometryMsgsRadarObject :init) r)) r))
     (dolist (elem- _fsm4_tracklist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; per_msgs/GeometryMsgsRadarObject[] _rear_sbmp_tracklist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rear_sbmp_tracklist (let (r) (dotimes (i n) (push (instance per_msgs::GeometryMsgsRadarObject :init) r)) r))
     (dolist (elem- _rear_sbmp_tracklist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; per_msgs/GeometryMsgsRadarObject[] _front_esr_tracklist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _front_esr_tracklist (let (r) (dotimes (i n) (push (instance per_msgs::GeometryMsgsRadarObject :init) r)) r))
     (dolist (elem- _front_esr_tracklist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; per_msgs/GeometryMsgsRadarObject[] _front_right_esr_tracklist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _front_right_esr_tracklist (let (r) (dotimes (i n) (push (instance per_msgs::GeometryMsgsRadarObject :init) r)) r))
     (dolist (elem- _front_right_esr_tracklist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; per_msgs/GeometryMsgsRadarObject[] _front_left_esr_tracklist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _front_left_esr_tracklist (let (r) (dotimes (i n) (push (instance per_msgs::GeometryMsgsRadarObject :init) r)) r))
     (dolist (elem- _front_left_esr_tracklist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get per_msgs::SensorMsgsRadar :md5sum-) "204a30d198cfa61f97a58275109baa3e")
(setf (get per_msgs::SensorMsgsRadar :datatype-) "per_msgs/SensorMsgsRadar")
(setf (get per_msgs::SensorMsgsRadar :definition-)
      "Header header
float32 range  # meters
float32 total_front_esr_tracks
float32 total_front_right_esr_tracks
float32 total_front_left_esr_tracks
float32 front_esr_tracker_counter
float32 front_left_esr_tracker_counter
float32 front_right_esr_tracker_counter
float32 total_rear_sbmp_tracks
float32 rear_sbmp_tracker_counter
float32 total_fsm4_tracks
float32 fsm4_tracker_counter
GeometryMsgsRadarObject[] fsm4_tracklist
GeometryMsgsRadarObject[] rear_sbmp_tracklist
GeometryMsgsRadarObject[] front_esr_tracklist
GeometryMsgsRadarObject[] front_right_esr_tracklist
GeometryMsgsRadarObject[] front_left_esr_tracklist
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
MSG: per_msgs/GeometryMsgsRadarObject
Header header
float32 range  # meters
float32 range_rate #velocity
float32 angle_centroid
float32 obj_vcs_posex
float32 obj_vcs_posey
uint8 track_id

")



(provide :per_msgs/SensorMsgsRadar "204a30d198cfa61f97a58275109baa3e")


