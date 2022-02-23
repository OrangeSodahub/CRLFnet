;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrValid1)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrValid1 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRVALID1")
  (make-package "DELPHI_ESR_MSGS::ESRVALID1"))

(in-package "ROS")
;;//! \htmlinclude EsrValid1.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrValid1
  :super ros::object
  :slots (_header _canmsg _lrSN _lrRange _lrRangeRate _lrAngle _lrPower ))

(defmethod delphi_esr_msgs::EsrValid1
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:lrSN __lrSN) 0)
    ((:lrRange __lrRange) 0.0)
    ((:lrRangeRate __lrRangeRate) 0.0)
    ((:lrAngle __lrAngle) 0.0)
    ((:lrPower __lrPower) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _lrSN (round __lrSN))
   (setq _lrRange (float __lrRange))
   (setq _lrRangeRate (float __lrRangeRate))
   (setq _lrAngle (float __lrAngle))
   (setq _lrPower (round __lrPower))
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
  (:lrSN
   (&optional __lrSN)
   (if __lrSN (setq _lrSN __lrSN)) _lrSN)
  (:lrRange
   (&optional __lrRange)
   (if __lrRange (setq _lrRange __lrRange)) _lrRange)
  (:lrRangeRate
   (&optional __lrRangeRate)
   (if __lrRangeRate (setq _lrRangeRate __lrRangeRate)) _lrRangeRate)
  (:lrAngle
   (&optional __lrAngle)
   (if __lrAngle (setq _lrAngle __lrAngle)) _lrAngle)
  (:lrPower
   (&optional __lrPower)
   (if __lrPower (setq _lrPower __lrPower)) _lrPower)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _lrSN
    1
    ;; float32 _lrRange
    4
    ;; float32 _lrRangeRate
    4
    ;; float32 _lrAngle
    4
    ;; int8 _lrPower
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
     ;; uint8 _lrSN
       (write-byte _lrSN s)
     ;; float32 _lrRange
       (sys::poke _lrRange (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lrRangeRate
       (sys::poke _lrRangeRate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lrAngle
       (sys::poke _lrAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _lrPower
       (write-byte _lrPower s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _lrSN
     (setq _lrSN (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _lrRange
     (setq _lrRange (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lrRangeRate
     (setq _lrRangeRate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lrAngle
     (setq _lrAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _lrPower
     (setq _lrPower (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _lrPower 127) (setq _lrPower (- _lrPower 256)))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrValid1 :md5sum-) "c4abfbd505e6dac4796d76d198d45785")
(setf (get delphi_esr_msgs::EsrValid1 :datatype-) "delphi_esr_msgs/EsrValid1")
(setf (get delphi_esr_msgs::EsrValid1 :definition-)
      "Header header

# ESR valid1
string      canmsg
uint8       lrSN
float32     lrRange
float32     lrRangeRate
float32     lrAngle
int8        lrPower


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



(provide :delphi_esr_msgs/EsrValid1 "c4abfbd505e6dac4796d76d198d45785")


