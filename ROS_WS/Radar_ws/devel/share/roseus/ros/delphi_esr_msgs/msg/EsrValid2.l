;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrValid2)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrValid2 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVALID2")
  (make-package "DELPHI_ESR_MSGS::ESRVALID2"))

(in-package "ROS")
;;//! \htmlinclude EsrValid2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrValid2
  :super ros::object
  :slots (_header _canmsg _mrSN _mrRange _mrRangeRate _mrAngle _mrPower ))

(defmethod delphi_esr_msgs::EsrValid2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:mrSN __mrSN) 0)
    ((:mrRange __mrRange) 0.0)
    ((:mrRangeRate __mrRangeRate) 0.0)
    ((:mrAngle __mrAngle) 0.0)
    ((:mrPower __mrPower) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _mrSN (round __mrSN))
   (setq _mrRange (float __mrRange))
   (setq _mrRangeRate (float __mrRangeRate))
   (setq _mrAngle (float __mrAngle))
   (setq _mrPower (round __mrPower))
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
  (:mrSN
   (&optional __mrSN)
   (if __mrSN (setq _mrSN __mrSN)) _mrSN)
  (:mrRange
   (&optional __mrRange)
   (if __mrRange (setq _mrRange __mrRange)) _mrRange)
  (:mrRangeRate
   (&optional __mrRangeRate)
   (if __mrRangeRate (setq _mrRangeRate __mrRangeRate)) _mrRangeRate)
  (:mrAngle
   (&optional __mrAngle)
   (if __mrAngle (setq _mrAngle __mrAngle)) _mrAngle)
  (:mrPower
   (&optional __mrPower)
   (if __mrPower (setq _mrPower __mrPower)) _mrPower)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _mrSN
    1
    ;; float32 _mrRange
    4
    ;; float32 _mrRangeRate
    4
    ;; float32 _mrAngle
    4
    ;; int8 _mrPower
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _canmsg
       (write-long (length _canmsg) s) (princ _canmsg s)
     ;; uint8 _mrSN
       (write-byte _mrSN s)
     ;; float32 _mrRange
       (sys::poke _mrRange (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mrRangeRate
       (sys::poke _mrRangeRate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mrAngle
       (sys::poke _mrAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _mrPower
       (write-byte _mrPower s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _mrSN
     (setq _mrSN (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _mrRange
     (setq _mrRange (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mrRangeRate
     (setq _mrRangeRate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mrAngle
     (setq _mrAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _mrPower
     (setq _mrPower (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mrPower 127) (setq _mrPower (- _mrPower 256)))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrValid2 :md5sum-) "9358feca721eb3835f63862d71ddc71c")
(setf (get delphi_esr_msgs::EsrValid2 :datatype-) "delphi_esr_msgs/EsrValid2")
(setf (get delphi_esr_msgs::EsrValid2 :definition-)
      "Header header

# ESR valid2
string      canmsg
uint8       mrSN
float32     mrRange
float32     mrRangeRate
float32     mrAngle
int8        mrPower



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



(provide :delphi_esr_msgs/EsrValid2 "9358feca721eb3835f63862d71ddc71c")


