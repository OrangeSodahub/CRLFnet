;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus3)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus3 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS3")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS3"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus3.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus3
  :super ros::object
  :slots (_header _canmsg _hwVersion _interfaceVersion _swVersionPld _swVersionHost _serialNum ))

(defmethod delphi_esr_msgs::EsrStatus3
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:hwVersion __hwVersion) 0)
    ((:interfaceVersion __interfaceVersion) 0)
    ((:swVersionPld __swVersionPld) 0)
    ((:swVersionHost __swVersionHost) "")
    ((:serialNum __serialNum) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _hwVersion (round __hwVersion))
   (setq _interfaceVersion (round __interfaceVersion))
   (setq _swVersionPld (round __swVersionPld))
   (setq _swVersionHost (string __swVersionHost))
   (setq _serialNum (string __serialNum))
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
  (:hwVersion
   (&optional __hwVersion)
   (if __hwVersion (setq _hwVersion __hwVersion)) _hwVersion)
  (:interfaceVersion
   (&optional __interfaceVersion)
   (if __interfaceVersion (setq _interfaceVersion __interfaceVersion)) _interfaceVersion)
  (:swVersionPld
   (&optional __swVersionPld)
   (if __swVersionPld (setq _swVersionPld __swVersionPld)) _swVersionPld)
  (:swVersionHost
   (&optional __swVersionHost)
   (if __swVersionHost (setq _swVersionHost __swVersionHost)) _swVersionHost)
  (:serialNum
   (&optional __serialNum)
   (if __serialNum (setq _serialNum __serialNum)) _serialNum)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _hwVersion
    1
    ;; uint8 _interfaceVersion
    1
    ;; uint8 _swVersionPld
    1
    ;; string _swVersionHost
    4 (length _swVersionHost)
    ;; string _serialNum
    4 (length _serialNum)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _canmsg
       (write-long (length _canmsg) s) (princ _canmsg s)
     ;; uint8 _hwVersion
       (write-byte _hwVersion s)
     ;; uint8 _interfaceVersion
       (write-byte _interfaceVersion s)
     ;; uint8 _swVersionPld
       (write-byte _swVersionPld s)
     ;; string _swVersionHost
       (write-long (length _swVersionHost) s) (princ _swVersionHost s)
     ;; string _serialNum
       (write-long (length _serialNum) s) (princ _serialNum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _hwVersion
     (setq _hwVersion (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _interfaceVersion
     (setq _interfaceVersion (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _swVersionPld
     (setq _swVersionPld (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _swVersionHost
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _swVersionHost (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _serialNum
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _serialNum (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus3 :md5sum-) "d267bafb7654adc3b6ab9a341e242e48")
(setf (get delphi_esr_msgs::EsrStatus3 :datatype-) "delphi_esr_msgs/EsrStatus3")
(setf (get delphi_esr_msgs::EsrStatus3 :definition-)
      "Header header

# ESR status3
string      canmsg
uint8      hwVersion
uint8      interfaceVersion
uint8      swVersionPld
string      swVersionHost
string      serialNum



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



(provide :delphi_esr_msgs/EsrStatus3 "d267bafb7654adc3b6ab9a341e242e48")


