;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus9)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus9 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS9")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS9"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus9.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus9
  :super ros::object
  :slots (_header _canmsg _avgPwrCwblkg _sideSlipAngle _serialNum3rdByte _waterSprayTargetID _filteredXohpAccCIPV _pathIDACC2 _pathIDACC3 ))

(defmethod delphi_esr_msgs::EsrStatus9
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:avgPwrCwblkg __avgPwrCwblkg) 0)
    ((:sideSlipAngle __sideSlipAngle) 0.0)
    ((:serialNum3rdByte __serialNum3rdByte) 0)
    ((:waterSprayTargetID __waterSprayTargetID) 0)
    ((:filteredXohpAccCIPV __filteredXohpAccCIPV) 0.0)
    ((:pathIDACC2 __pathIDACC2) 0)
    ((:pathIDACC3 __pathIDACC3) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _avgPwrCwblkg (round __avgPwrCwblkg))
   (setq _sideSlipAngle (float __sideSlipAngle))
   (setq _serialNum3rdByte (round __serialNum3rdByte))
   (setq _waterSprayTargetID (round __waterSprayTargetID))
   (setq _filteredXohpAccCIPV (float __filteredXohpAccCIPV))
   (setq _pathIDACC2 (round __pathIDACC2))
   (setq _pathIDACC3 (round __pathIDACC3))
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
  (:avgPwrCwblkg
   (&optional __avgPwrCwblkg)
   (if __avgPwrCwblkg (setq _avgPwrCwblkg __avgPwrCwblkg)) _avgPwrCwblkg)
  (:sideSlipAngle
   (&optional __sideSlipAngle)
   (if __sideSlipAngle (setq _sideSlipAngle __sideSlipAngle)) _sideSlipAngle)
  (:serialNum3rdByte
   (&optional __serialNum3rdByte)
   (if __serialNum3rdByte (setq _serialNum3rdByte __serialNum3rdByte)) _serialNum3rdByte)
  (:waterSprayTargetID
   (&optional __waterSprayTargetID)
   (if __waterSprayTargetID (setq _waterSprayTargetID __waterSprayTargetID)) _waterSprayTargetID)
  (:filteredXohpAccCIPV
   (&optional __filteredXohpAccCIPV)
   (if __filteredXohpAccCIPV (setq _filteredXohpAccCIPV __filteredXohpAccCIPV)) _filteredXohpAccCIPV)
  (:pathIDACC2
   (&optional __pathIDACC2)
   (if __pathIDACC2 (setq _pathIDACC2 __pathIDACC2)) _pathIDACC2)
  (:pathIDACC3
   (&optional __pathIDACC3)
   (if __pathIDACC3 (setq _pathIDACC3 __pathIDACC3)) _pathIDACC3)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint16 _avgPwrCwblkg
    2
    ;; float32 _sideSlipAngle
    4
    ;; uint8 _serialNum3rdByte
    1
    ;; uint8 _waterSprayTargetID
    1
    ;; float32 _filteredXohpAccCIPV
    4
    ;; uint8 _pathIDACC2
    1
    ;; uint8 _pathIDACC3
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
     ;; uint16 _avgPwrCwblkg
       (write-word _avgPwrCwblkg s)
     ;; float32 _sideSlipAngle
       (sys::poke _sideSlipAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _serialNum3rdByte
       (write-byte _serialNum3rdByte s)
     ;; uint8 _waterSprayTargetID
       (write-byte _waterSprayTargetID s)
     ;; float32 _filteredXohpAccCIPV
       (sys::poke _filteredXohpAccCIPV (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _pathIDACC2
       (write-byte _pathIDACC2 s)
     ;; uint8 _pathIDACC3
       (write-byte _pathIDACC3 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _avgPwrCwblkg
     (setq _avgPwrCwblkg (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _sideSlipAngle
     (setq _sideSlipAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _serialNum3rdByte
     (setq _serialNum3rdByte (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _waterSprayTargetID
     (setq _waterSprayTargetID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _filteredXohpAccCIPV
     (setq _filteredXohpAccCIPV (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _pathIDACC2
     (setq _pathIDACC2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pathIDACC3
     (setq _pathIDACC3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus9 :md5sum-) "fc4ded94c686bdf234c4ceb10632e67c")
(setf (get delphi_esr_msgs::EsrStatus9 :datatype-) "delphi_esr_msgs/EsrStatus9")
(setf (get delphi_esr_msgs::EsrStatus9 :definition-)
      "Header header

# ESR status9
string      canmsg
uint16      avgPwrCwblkg
float32     sideSlipAngle
uint8       serialNum3rdByte
uint8       waterSprayTargetID
float32     filteredXohpAccCIPV
uint8       pathIDACC2
uint8       pathIDACC3



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



(provide :delphi_esr_msgs/EsrStatus9 "fc4ded94c686bdf234c4ceb10632e67c")


