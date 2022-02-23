;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrVehicle4)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrVehicle4 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVEHICLE4")
  (make-package "DELPHI_ESR_MSGS::ESRVEHICLE4"))

(in-package "ROS")
;;//! \htmlinclude EsrVehicle4.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrVehicle4
  :super ros::object
  :slots (_header _fac_align_cmd_1 _fac_align_cmd_2 _fac_align_max_nt _fac_align_samp_req _fac_tgt_mtg_offset _fac_tgt_mtg_space_hor _fac_tgt_mtg_space_ver _fac_tgt_range_1 _fac_tgt_range_r2m _fac_tgt_range_m2t ))

(defmethod delphi_esr_msgs::EsrVehicle4
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:fac_align_cmd_1 __fac_align_cmd_1) nil)
    ((:fac_align_cmd_2 __fac_align_cmd_2) nil)
    ((:fac_align_max_nt __fac_align_max_nt) 0)
    ((:fac_align_samp_req __fac_align_samp_req) 0)
    ((:fac_tgt_mtg_offset __fac_tgt_mtg_offset) 0)
    ((:fac_tgt_mtg_space_hor __fac_tgt_mtg_space_hor) 0)
    ((:fac_tgt_mtg_space_ver __fac_tgt_mtg_space_ver) 0)
    ((:fac_tgt_range_1 __fac_tgt_range_1) 0.0)
    ((:fac_tgt_range_r2m __fac_tgt_range_r2m) 0.0)
    ((:fac_tgt_range_m2t __fac_tgt_range_m2t) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _fac_align_cmd_1 __fac_align_cmd_1)
   (setq _fac_align_cmd_2 __fac_align_cmd_2)
   (setq _fac_align_max_nt (round __fac_align_max_nt))
   (setq _fac_align_samp_req (round __fac_align_samp_req))
   (setq _fac_tgt_mtg_offset (round __fac_tgt_mtg_offset))
   (setq _fac_tgt_mtg_space_hor (round __fac_tgt_mtg_space_hor))
   (setq _fac_tgt_mtg_space_ver (round __fac_tgt_mtg_space_ver))
   (setq _fac_tgt_range_1 (float __fac_tgt_range_1))
   (setq _fac_tgt_range_r2m (float __fac_tgt_range_r2m))
   (setq _fac_tgt_range_m2t (float __fac_tgt_range_m2t))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:fac_align_cmd_1
   (&optional (__fac_align_cmd_1 :null))
   (if (not (eq __fac_align_cmd_1 :null)) (setq _fac_align_cmd_1 __fac_align_cmd_1)) _fac_align_cmd_1)
  (:fac_align_cmd_2
   (&optional (__fac_align_cmd_2 :null))
   (if (not (eq __fac_align_cmd_2 :null)) (setq _fac_align_cmd_2 __fac_align_cmd_2)) _fac_align_cmd_2)
  (:fac_align_max_nt
   (&optional __fac_align_max_nt)
   (if __fac_align_max_nt (setq _fac_align_max_nt __fac_align_max_nt)) _fac_align_max_nt)
  (:fac_align_samp_req
   (&optional __fac_align_samp_req)
   (if __fac_align_samp_req (setq _fac_align_samp_req __fac_align_samp_req)) _fac_align_samp_req)
  (:fac_tgt_mtg_offset
   (&optional __fac_tgt_mtg_offset)
   (if __fac_tgt_mtg_offset (setq _fac_tgt_mtg_offset __fac_tgt_mtg_offset)) _fac_tgt_mtg_offset)
  (:fac_tgt_mtg_space_hor
   (&optional __fac_tgt_mtg_space_hor)
   (if __fac_tgt_mtg_space_hor (setq _fac_tgt_mtg_space_hor __fac_tgt_mtg_space_hor)) _fac_tgt_mtg_space_hor)
  (:fac_tgt_mtg_space_ver
   (&optional __fac_tgt_mtg_space_ver)
   (if __fac_tgt_mtg_space_ver (setq _fac_tgt_mtg_space_ver __fac_tgt_mtg_space_ver)) _fac_tgt_mtg_space_ver)
  (:fac_tgt_range_1
   (&optional __fac_tgt_range_1)
   (if __fac_tgt_range_1 (setq _fac_tgt_range_1 __fac_tgt_range_1)) _fac_tgt_range_1)
  (:fac_tgt_range_r2m
   (&optional __fac_tgt_range_r2m)
   (if __fac_tgt_range_r2m (setq _fac_tgt_range_r2m __fac_tgt_range_r2m)) _fac_tgt_range_r2m)
  (:fac_tgt_range_m2t
   (&optional __fac_tgt_range_m2t)
   (if __fac_tgt_range_m2t (setq _fac_tgt_range_m2t __fac_tgt_range_m2t)) _fac_tgt_range_m2t)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _fac_align_cmd_1
    1
    ;; bool _fac_align_cmd_2
    1
    ;; uint8 _fac_align_max_nt
    1
    ;; uint8 _fac_align_samp_req
    1
    ;; int8 _fac_tgt_mtg_offset
    1
    ;; int8 _fac_tgt_mtg_space_hor
    1
    ;; int8 _fac_tgt_mtg_space_ver
    1
    ;; float32 _fac_tgt_range_1
    4
    ;; float32 _fac_tgt_range_r2m
    4
    ;; float32 _fac_tgt_range_m2t
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _fac_align_cmd_1
       (if _fac_align_cmd_1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _fac_align_cmd_2
       (if _fac_align_cmd_2 (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _fac_align_max_nt
       (write-byte _fac_align_max_nt s)
     ;; uint8 _fac_align_samp_req
       (write-byte _fac_align_samp_req s)
     ;; int8 _fac_tgt_mtg_offset
       (write-byte _fac_tgt_mtg_offset s)
     ;; int8 _fac_tgt_mtg_space_hor
       (write-byte _fac_tgt_mtg_space_hor s)
     ;; int8 _fac_tgt_mtg_space_ver
       (write-byte _fac_tgt_mtg_space_ver s)
     ;; float32 _fac_tgt_range_1
       (sys::poke _fac_tgt_range_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fac_tgt_range_r2m
       (sys::poke _fac_tgt_range_r2m (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fac_tgt_range_m2t
       (sys::poke _fac_tgt_range_m2t (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _fac_align_cmd_1
     (setq _fac_align_cmd_1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fac_align_cmd_2
     (setq _fac_align_cmd_2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _fac_align_max_nt
     (setq _fac_align_max_nt (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fac_align_samp_req
     (setq _fac_align_samp_req (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _fac_tgt_mtg_offset
     (setq _fac_tgt_mtg_offset (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _fac_tgt_mtg_offset 127) (setq _fac_tgt_mtg_offset (- _fac_tgt_mtg_offset 256)))
   ;; int8 _fac_tgt_mtg_space_hor
     (setq _fac_tgt_mtg_space_hor (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _fac_tgt_mtg_space_hor 127) (setq _fac_tgt_mtg_space_hor (- _fac_tgt_mtg_space_hor 256)))
   ;; int8 _fac_tgt_mtg_space_ver
     (setq _fac_tgt_mtg_space_ver (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _fac_tgt_mtg_space_ver 127) (setq _fac_tgt_mtg_space_ver (- _fac_tgt_mtg_space_ver 256)))
   ;; float32 _fac_tgt_range_1
     (setq _fac_tgt_range_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fac_tgt_range_r2m
     (setq _fac_tgt_range_r2m (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fac_tgt_range_m2t
     (setq _fac_tgt_range_m2t (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrVehicle4 :md5sum-) "0805b9094a6d63c8c5d196257252ccdb")
(setf (get delphi_esr_msgs::EsrVehicle4 :datatype-) "delphi_esr_msgs/EsrVehicle4")
(setf (get delphi_esr_msgs::EsrVehicle4 :definition-)
      "Header header

# ESR vehicle4
bool        fac_align_cmd_1
bool        fac_align_cmd_2
uint8       fac_align_max_nt
uint8       fac_align_samp_req
int8        fac_tgt_mtg_offset
int8        fac_tgt_mtg_space_hor
int8        fac_tgt_mtg_space_ver
float32     fac_tgt_range_1
float32     fac_tgt_range_r2m
float32     fac_tgt_range_m2t

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



(provide :delphi_esr_msgs/EsrVehicle4 "0805b9094a6d63c8c5d196257252ccdb")


