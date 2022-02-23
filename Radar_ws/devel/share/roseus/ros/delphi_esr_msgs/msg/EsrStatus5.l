;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus5)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus5 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS5")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS5"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus5.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus5
  :super ros::object
  :slots (_header _canmsg _swbattA2D _ignpA2D _temp1A2D _temp2A2D _supply5VA _supply5VDX _supply53P3V _supply10V ))

(defmethod delphi_esr_msgs::EsrStatus5
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:swbattA2D __swbattA2D) 0)
    ((:ignpA2D __ignpA2D) 0)
    ((:temp1A2D __temp1A2D) 0)
    ((:temp2A2D __temp2A2D) 0)
    ((:supply5VA __supply5VA) 0)
    ((:supply5VDX __supply5VDX) 0)
    ((:supply53P3V __supply53P3V) 0)
    ((:supply10V __supply10V) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _swbattA2D (round __swbattA2D))
   (setq _ignpA2D (round __ignpA2D))
   (setq _temp1A2D (round __temp1A2D))
   (setq _temp2A2D (round __temp2A2D))
   (setq _supply5VA (round __supply5VA))
   (setq _supply5VDX (round __supply5VDX))
   (setq _supply53P3V (round __supply53P3V))
   (setq _supply10V (round __supply10V))
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
  (:swbattA2D
   (&optional __swbattA2D)
   (if __swbattA2D (setq _swbattA2D __swbattA2D)) _swbattA2D)
  (:ignpA2D
   (&optional __ignpA2D)
   (if __ignpA2D (setq _ignpA2D __ignpA2D)) _ignpA2D)
  (:temp1A2D
   (&optional __temp1A2D)
   (if __temp1A2D (setq _temp1A2D __temp1A2D)) _temp1A2D)
  (:temp2A2D
   (&optional __temp2A2D)
   (if __temp2A2D (setq _temp2A2D __temp2A2D)) _temp2A2D)
  (:supply5VA
   (&optional __supply5VA)
   (if __supply5VA (setq _supply5VA __supply5VA)) _supply5VA)
  (:supply5VDX
   (&optional __supply5VDX)
   (if __supply5VDX (setq _supply5VDX __supply5VDX)) _supply5VDX)
  (:supply53P3V
   (&optional __supply53P3V)
   (if __supply53P3V (setq _supply53P3V __supply53P3V)) _supply53P3V)
  (:supply10V
   (&optional __supply10V)
   (if __supply10V (setq _supply10V __supply10V)) _supply10V)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _swbattA2D
    1
    ;; uint8 _ignpA2D
    1
    ;; uint8 _temp1A2D
    1
    ;; uint8 _temp2A2D
    1
    ;; uint8 _supply5VA
    1
    ;; uint8 _supply5VDX
    1
    ;; uint8 _supply53P3V
    1
    ;; uint8 _supply10V
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
     ;; uint8 _swbattA2D
       (write-byte _swbattA2D s)
     ;; uint8 _ignpA2D
       (write-byte _ignpA2D s)
     ;; uint8 _temp1A2D
       (write-byte _temp1A2D s)
     ;; uint8 _temp2A2D
       (write-byte _temp2A2D s)
     ;; uint8 _supply5VA
       (write-byte _supply5VA s)
     ;; uint8 _supply5VDX
       (write-byte _supply5VDX s)
     ;; uint8 _supply53P3V
       (write-byte _supply53P3V s)
     ;; uint8 _supply10V
       (write-byte _supply10V s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _swbattA2D
     (setq _swbattA2D (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ignpA2D
     (setq _ignpA2D (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _temp1A2D
     (setq _temp1A2D (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _temp2A2D
     (setq _temp2A2D (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _supply5VA
     (setq _supply5VA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _supply5VDX
     (setq _supply5VDX (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _supply53P3V
     (setq _supply53P3V (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _supply10V
     (setq _supply10V (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus5 :md5sum-) "aae12ba774492012b782362919f8cb63")
(setf (get delphi_esr_msgs::EsrStatus5 :datatype-) "delphi_esr_msgs/EsrStatus5")
(setf (get delphi_esr_msgs::EsrStatus5 :definition-)
      "Header header

# ESR status5
string      canmsg
uint8       swbattA2D
uint8       ignpA2D
uint8       temp1A2D
uint8       temp2A2D
uint8       supply5VA
uint8       supply5VDX
uint8       supply53P3V
uint8       supply10V



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



(provide :delphi_esr_msgs/EsrStatus5 "aae12ba774492012b782362919f8cb63")


