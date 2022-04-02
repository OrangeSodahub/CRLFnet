;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrEthTx)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrEthTx (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRETHTX")
  (make-package "DELPHI_ESR_MSGS::ESRETHTX"))

(in-package "ROS")
;;//! \htmlinclude EsrEthTx.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrEthTx
  :super ros::object
  :slots (_header _xcp_format_version _scan_index _tcp_size _xcp_scan_type _look_index _mmr_scan_index _target_report_host_speed _target_report_host_yaw_rate _xcp_timestamp _release_revision _promote_revision _field_revision _target_report_count _target_report_range _target_report_range_rate _target_report_theta _target_report_amplitude ))

(defmethod delphi_esr_msgs::EsrEthTx
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:xcp_format_version __xcp_format_version) 0)
    ((:scan_index __scan_index) 0)
    ((:tcp_size __tcp_size) 0)
    ((:xcp_scan_type __xcp_scan_type) 0)
    ((:look_index __look_index) 0)
    ((:mmr_scan_index __mmr_scan_index) 0)
    ((:target_report_host_speed __target_report_host_speed) 0.0)
    ((:target_report_host_yaw_rate __target_report_host_yaw_rate) 0.0)
    ((:xcp_timestamp __xcp_timestamp) 0)
    ((:release_revision __release_revision) 0)
    ((:promote_revision __promote_revision) 0)
    ((:field_revision __field_revision) 0)
    ((:target_report_count __target_report_count) 0)
    ((:target_report_range __target_report_range) (make-array 64 :initial-element 0.0 :element-type :float))
    ((:target_report_range_rate __target_report_range_rate) (make-array 64 :initial-element 0.0 :element-type :float))
    ((:target_report_theta __target_report_theta) (make-array 64 :initial-element 0.0 :element-type :float))
    ((:target_report_amplitude __target_report_amplitude) (make-array 64 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _xcp_format_version (round __xcp_format_version))
   (setq _scan_index (round __scan_index))
   (setq _tcp_size (round __tcp_size))
   (setq _xcp_scan_type (round __xcp_scan_type))
   (setq _look_index (round __look_index))
   (setq _mmr_scan_index (round __mmr_scan_index))
   (setq _target_report_host_speed (float __target_report_host_speed))
   (setq _target_report_host_yaw_rate (float __target_report_host_yaw_rate))
   (setq _xcp_timestamp (round __xcp_timestamp))
   (setq _release_revision (round __release_revision))
   (setq _promote_revision (round __promote_revision))
   (setq _field_revision (round __field_revision))
   (setq _target_report_count (round __target_report_count))
   (setq _target_report_range __target_report_range)
   (setq _target_report_range_rate __target_report_range_rate)
   (setq _target_report_theta __target_report_theta)
   (setq _target_report_amplitude __target_report_amplitude)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:xcp_format_version
   (&optional __xcp_format_version)
   (if __xcp_format_version (setq _xcp_format_version __xcp_format_version)) _xcp_format_version)
  (:scan_index
   (&optional __scan_index)
   (if __scan_index (setq _scan_index __scan_index)) _scan_index)
  (:tcp_size
   (&optional __tcp_size)
   (if __tcp_size (setq _tcp_size __tcp_size)) _tcp_size)
  (:xcp_scan_type
   (&optional __xcp_scan_type)
   (if __xcp_scan_type (setq _xcp_scan_type __xcp_scan_type)) _xcp_scan_type)
  (:look_index
   (&optional __look_index)
   (if __look_index (setq _look_index __look_index)) _look_index)
  (:mmr_scan_index
   (&optional __mmr_scan_index)
   (if __mmr_scan_index (setq _mmr_scan_index __mmr_scan_index)) _mmr_scan_index)
  (:target_report_host_speed
   (&optional __target_report_host_speed)
   (if __target_report_host_speed (setq _target_report_host_speed __target_report_host_speed)) _target_report_host_speed)
  (:target_report_host_yaw_rate
   (&optional __target_report_host_yaw_rate)
   (if __target_report_host_yaw_rate (setq _target_report_host_yaw_rate __target_report_host_yaw_rate)) _target_report_host_yaw_rate)
  (:xcp_timestamp
   (&optional __xcp_timestamp)
   (if __xcp_timestamp (setq _xcp_timestamp __xcp_timestamp)) _xcp_timestamp)
  (:release_revision
   (&optional __release_revision)
   (if __release_revision (setq _release_revision __release_revision)) _release_revision)
  (:promote_revision
   (&optional __promote_revision)
   (if __promote_revision (setq _promote_revision __promote_revision)) _promote_revision)
  (:field_revision
   (&optional __field_revision)
   (if __field_revision (setq _field_revision __field_revision)) _field_revision)
  (:target_report_count
   (&optional __target_report_count)
   (if __target_report_count (setq _target_report_count __target_report_count)) _target_report_count)
  (:target_report_range
   (&optional __target_report_range)
   (if __target_report_range (setq _target_report_range __target_report_range)) _target_report_range)
  (:target_report_range_rate
   (&optional __target_report_range_rate)
   (if __target_report_range_rate (setq _target_report_range_rate __target_report_range_rate)) _target_report_range_rate)
  (:target_report_theta
   (&optional __target_report_theta)
   (if __target_report_theta (setq _target_report_theta __target_report_theta)) _target_report_theta)
  (:target_report_amplitude
   (&optional __target_report_amplitude)
   (if __target_report_amplitude (setq _target_report_amplitude __target_report_amplitude)) _target_report_amplitude)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _xcp_format_version
    2
    ;; uint16 _scan_index
    2
    ;; uint16 _tcp_size
    2
    ;; uint8 _xcp_scan_type
    1
    ;; uint16 _look_index
    2
    ;; uint16 _mmr_scan_index
    2
    ;; float32 _target_report_host_speed
    4
    ;; float32 _target_report_host_yaw_rate
    4
    ;; uint32 _xcp_timestamp
    4
    ;; uint8 _release_revision
    1
    ;; uint8 _promote_revision
    1
    ;; uint8 _field_revision
    1
    ;; uint8 _target_report_count
    1
    ;; float32[64] _target_report_range
    (* 4    64)
    ;; float32[64] _target_report_range_rate
    (* 4    64)
    ;; float32[64] _target_report_theta
    (* 4    64)
    ;; float32[64] _target_report_amplitude
    (* 4    64)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _xcp_format_version
       (write-word _xcp_format_version s)
     ;; uint16 _scan_index
       (write-word _scan_index s)
     ;; uint16 _tcp_size
       (write-word _tcp_size s)
     ;; uint8 _xcp_scan_type
       (write-byte _xcp_scan_type s)
     ;; uint16 _look_index
       (write-word _look_index s)
     ;; uint16 _mmr_scan_index
       (write-word _mmr_scan_index s)
     ;; float32 _target_report_host_speed
       (sys::poke _target_report_host_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _target_report_host_yaw_rate
       (sys::poke _target_report_host_yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _xcp_timestamp
       (write-long _xcp_timestamp s)
     ;; uint8 _release_revision
       (write-byte _release_revision s)
     ;; uint8 _promote_revision
       (write-byte _promote_revision s)
     ;; uint8 _field_revision
       (write-byte _field_revision s)
     ;; uint8 _target_report_count
       (write-byte _target_report_count s)
     ;; float32[64] _target_report_range
     (dotimes (i 64)
       (sys::poke (elt _target_report_range i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[64] _target_report_range_rate
     (dotimes (i 64)
       (sys::poke (elt _target_report_range_rate i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[64] _target_report_theta
     (dotimes (i 64)
       (sys::poke (elt _target_report_theta i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[64] _target_report_amplitude
     (dotimes (i 64)
       (sys::poke (elt _target_report_amplitude i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _xcp_format_version
     (setq _xcp_format_version (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _scan_index
     (setq _scan_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _tcp_size
     (setq _tcp_size (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _xcp_scan_type
     (setq _xcp_scan_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _look_index
     (setq _look_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _mmr_scan_index
     (setq _mmr_scan_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _target_report_host_speed
     (setq _target_report_host_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _target_report_host_yaw_rate
     (setq _target_report_host_yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _xcp_timestamp
     (setq _xcp_timestamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _release_revision
     (setq _release_revision (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _promote_revision
     (setq _promote_revision (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _field_revision
     (setq _field_revision (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _target_report_count
     (setq _target_report_count (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[64] _target_report_range
   (dotimes (i (length _target_report_range))
     (setf (elt _target_report_range i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[64] _target_report_range_rate
   (dotimes (i (length _target_report_range_rate))
     (setf (elt _target_report_range_rate i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[64] _target_report_theta
   (dotimes (i (length _target_report_theta))
     (setf (elt _target_report_theta i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[64] _target_report_amplitude
   (dotimes (i (length _target_report_amplitude))
     (setf (elt _target_report_amplitude i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrEthTx :md5sum-) "ea522dc4f556d335d7b446f66f5ac1d2")
(setf (get delphi_esr_msgs::EsrEthTx :datatype-) "delphi_esr_msgs/EsrEthTx")
(setf (get delphi_esr_msgs::EsrEthTx :definition-)
      "Header header

# ESR Track Msg
uint16	      xcp_format_version
uint16        scan_index
uint16        tcp_size
uint8         xcp_scan_type
uint16        look_index
uint16        mmr_scan_index
float32         target_report_host_speed
float32         target_report_host_yaw_rate
uint32        xcp_timestamp
uint8         release_revision
uint8         promote_revision
uint8         field_revision
uint8        target_report_count
float32[64]       target_report_range
float32[64]       target_report_range_rate
float32[64]       target_report_theta
float32[64]       target_report_amplitude

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



(provide :delphi_esr_msgs/EsrEthTx "ea522dc4f556d335d7b446f66f5ac1d2")


