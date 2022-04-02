;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus7)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus7 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS7")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS7"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus7.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus7
  :super ros::object
  :slots (_header _canmsg _activeFault0 _activeFault1 _activeFault2 _activeFault3 _activeFault4 _activeFault5 _activeFault6 _activeFault7 ))

(defmethod delphi_esr_msgs::EsrStatus7
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:activeFault0 __activeFault0) 0)
    ((:activeFault1 __activeFault1) 0)
    ((:activeFault2 __activeFault2) 0)
    ((:activeFault3 __activeFault3) 0)
    ((:activeFault4 __activeFault4) 0)
    ((:activeFault5 __activeFault5) 0)
    ((:activeFault6 __activeFault6) 0)
    ((:activeFault7 __activeFault7) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _activeFault0 (round __activeFault0))
   (setq _activeFault1 (round __activeFault1))
   (setq _activeFault2 (round __activeFault2))
   (setq _activeFault3 (round __activeFault3))
   (setq _activeFault4 (round __activeFault4))
   (setq _activeFault5 (round __activeFault5))
   (setq _activeFault6 (round __activeFault6))
   (setq _activeFault7 (round __activeFault7))
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
  (:activeFault0
   (&optional __activeFault0)
   (if __activeFault0 (setq _activeFault0 __activeFault0)) _activeFault0)
  (:activeFault1
   (&optional __activeFault1)
   (if __activeFault1 (setq _activeFault1 __activeFault1)) _activeFault1)
  (:activeFault2
   (&optional __activeFault2)
   (if __activeFault2 (setq _activeFault2 __activeFault2)) _activeFault2)
  (:activeFault3
   (&optional __activeFault3)
   (if __activeFault3 (setq _activeFault3 __activeFault3)) _activeFault3)
  (:activeFault4
   (&optional __activeFault4)
   (if __activeFault4 (setq _activeFault4 __activeFault4)) _activeFault4)
  (:activeFault5
   (&optional __activeFault5)
   (if __activeFault5 (setq _activeFault5 __activeFault5)) _activeFault5)
  (:activeFault6
   (&optional __activeFault6)
   (if __activeFault6 (setq _activeFault6 __activeFault6)) _activeFault6)
  (:activeFault7
   (&optional __activeFault7)
   (if __activeFault7 (setq _activeFault7 __activeFault7)) _activeFault7)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _activeFault0
    1
    ;; uint8 _activeFault1
    1
    ;; uint8 _activeFault2
    1
    ;; uint8 _activeFault3
    1
    ;; uint8 _activeFault4
    1
    ;; uint8 _activeFault5
    1
    ;; uint8 _activeFault6
    1
    ;; uint8 _activeFault7
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
     ;; uint8 _activeFault0
       (write-byte _activeFault0 s)
     ;; uint8 _activeFault1
       (write-byte _activeFault1 s)
     ;; uint8 _activeFault2
       (write-byte _activeFault2 s)
     ;; uint8 _activeFault3
       (write-byte _activeFault3 s)
     ;; uint8 _activeFault4
       (write-byte _activeFault4 s)
     ;; uint8 _activeFault5
       (write-byte _activeFault5 s)
     ;; uint8 _activeFault6
       (write-byte _activeFault6 s)
     ;; uint8 _activeFault7
       (write-byte _activeFault7 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _activeFault0
     (setq _activeFault0 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault1
     (setq _activeFault1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault2
     (setq _activeFault2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault3
     (setq _activeFault3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault4
     (setq _activeFault4 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault5
     (setq _activeFault5 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault6
     (setq _activeFault6 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _activeFault7
     (setq _activeFault7 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus7 :md5sum-) "b04af575c0721e778fa727e03d332233")
(setf (get delphi_esr_msgs::EsrStatus7 :datatype-) "delphi_esr_msgs/EsrStatus7")
(setf (get delphi_esr_msgs::EsrStatus7 :definition-)
      "Header header

# ESR status7
string      canmsg
uint8       activeFault0
uint8       activeFault1
uint8       activeFault2
uint8       activeFault3
uint8       activeFault4
uint8       activeFault5
uint8       activeFault6
uint8       activeFault7



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



(provide :delphi_esr_msgs/EsrStatus7 "b04af575c0721e778fa727e03d332233")


