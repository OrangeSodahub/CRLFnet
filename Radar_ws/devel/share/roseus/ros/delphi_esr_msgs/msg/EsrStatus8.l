;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus8)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus8 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS8")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS8"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus8.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus8
  :super ros::object
  :slots (_header _canmsg _historyFault0 _historyFault1 _historyFault2 _historyFault3 _historyFault4 _historyFault5 _historyFault6 _historyFault7 ))

(defmethod delphi_esr_msgs::EsrStatus8
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:historyFault0 __historyFault0) 0)
    ((:historyFault1 __historyFault1) 0)
    ((:historyFault2 __historyFault2) 0)
    ((:historyFault3 __historyFault3) 0)
    ((:historyFault4 __historyFault4) 0)
    ((:historyFault5 __historyFault5) 0)
    ((:historyFault6 __historyFault6) 0)
    ((:historyFault7 __historyFault7) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _historyFault0 (round __historyFault0))
   (setq _historyFault1 (round __historyFault1))
   (setq _historyFault2 (round __historyFault2))
   (setq _historyFault3 (round __historyFault3))
   (setq _historyFault4 (round __historyFault4))
   (setq _historyFault5 (round __historyFault5))
   (setq _historyFault6 (round __historyFault6))
   (setq _historyFault7 (round __historyFault7))
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
  (:historyFault0
   (&optional __historyFault0)
   (if __historyFault0 (setq _historyFault0 __historyFault0)) _historyFault0)
  (:historyFault1
   (&optional __historyFault1)
   (if __historyFault1 (setq _historyFault1 __historyFault1)) _historyFault1)
  (:historyFault2
   (&optional __historyFault2)
   (if __historyFault2 (setq _historyFault2 __historyFault2)) _historyFault2)
  (:historyFault3
   (&optional __historyFault3)
   (if __historyFault3 (setq _historyFault3 __historyFault3)) _historyFault3)
  (:historyFault4
   (&optional __historyFault4)
   (if __historyFault4 (setq _historyFault4 __historyFault4)) _historyFault4)
  (:historyFault5
   (&optional __historyFault5)
   (if __historyFault5 (setq _historyFault5 __historyFault5)) _historyFault5)
  (:historyFault6
   (&optional __historyFault6)
   (if __historyFault6 (setq _historyFault6 __historyFault6)) _historyFault6)
  (:historyFault7
   (&optional __historyFault7)
   (if __historyFault7 (setq _historyFault7 __historyFault7)) _historyFault7)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _historyFault0
    1
    ;; uint8 _historyFault1
    1
    ;; uint8 _historyFault2
    1
    ;; uint8 _historyFault3
    1
    ;; uint8 _historyFault4
    1
    ;; uint8 _historyFault5
    1
    ;; uint8 _historyFault6
    1
    ;; uint8 _historyFault7
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
     ;; uint8 _historyFault0
       (write-byte _historyFault0 s)
     ;; uint8 _historyFault1
       (write-byte _historyFault1 s)
     ;; uint8 _historyFault2
       (write-byte _historyFault2 s)
     ;; uint8 _historyFault3
       (write-byte _historyFault3 s)
     ;; uint8 _historyFault4
       (write-byte _historyFault4 s)
     ;; uint8 _historyFault5
       (write-byte _historyFault5 s)
     ;; uint8 _historyFault6
       (write-byte _historyFault6 s)
     ;; uint8 _historyFault7
       (write-byte _historyFault7 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _historyFault0
     (setq _historyFault0 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault1
     (setq _historyFault1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault2
     (setq _historyFault2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault3
     (setq _historyFault3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault4
     (setq _historyFault4 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault5
     (setq _historyFault5 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault6
     (setq _historyFault6 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _historyFault7
     (setq _historyFault7 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus8 :md5sum-) "cf0bfab7682c50ee2545f1e97677b621")
(setf (get delphi_esr_msgs::EsrStatus8 :datatype-) "delphi_esr_msgs/EsrStatus8")
(setf (get delphi_esr_msgs::EsrStatus8 :definition-)
      "Header header

# ESR status8
string      canmsg
uint8       historyFault0
uint8       historyFault1
uint8       historyFault2
uint8       historyFault3
uint8       historyFault4
uint8       historyFault5
uint8       historyFault6
uint8       historyFault7



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



(provide :delphi_esr_msgs/EsrStatus8 "cf0bfab7682c50ee2545f1e97677b621")


