;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus6)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus6 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS6")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS6"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus6.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus6
  :super ros::object
  :slots (_header _canmsg _supply1P8V _supplyN5V _waveDiffA2D _swVersionDSP3rdByte _verticalAlginUpdated _systemPowerMode _foundTarget _recommendUnconverge _factoryAlginStatus1 _factoryAlginStatus2 _factoryMisAlginment _servAlginUpdatesDone _verticalMisAlginment ))

(defmethod delphi_esr_msgs::EsrStatus6
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:supply1P8V __supply1P8V) 0)
    ((:supplyN5V __supplyN5V) 0)
    ((:waveDiffA2D __waveDiffA2D) 0)
    ((:swVersionDSP3rdByte __swVersionDSP3rdByte) 0)
    ((:verticalAlginUpdated __verticalAlginUpdated) nil)
    ((:systemPowerMode __systemPowerMode) 0)
    ((:foundTarget __foundTarget) nil)
    ((:recommendUnconverge __recommendUnconverge) nil)
    ((:factoryAlginStatus1 __factoryAlginStatus1) 0)
    ((:factoryAlginStatus2 __factoryAlginStatus2) 0)
    ((:factoryMisAlginment __factoryMisAlginment) 0.0)
    ((:servAlginUpdatesDone __servAlginUpdatesDone) 0)
    ((:verticalMisAlginment __verticalMisAlginment) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _supply1P8V (round __supply1P8V))
   (setq _supplyN5V (round __supplyN5V))
   (setq _waveDiffA2D (round __waveDiffA2D))
   (setq _swVersionDSP3rdByte (round __swVersionDSP3rdByte))
   (setq _verticalAlginUpdated __verticalAlginUpdated)
   (setq _systemPowerMode (round __systemPowerMode))
   (setq _foundTarget __foundTarget)
   (setq _recommendUnconverge __recommendUnconverge)
   (setq _factoryAlginStatus1 (round __factoryAlginStatus1))
   (setq _factoryAlginStatus2 (round __factoryAlginStatus2))
   (setq _factoryMisAlginment (float __factoryMisAlginment))
   (setq _servAlginUpdatesDone (round __servAlginUpdatesDone))
   (setq _verticalMisAlginment (float __verticalMisAlginment))
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
  (:supply1P8V
   (&optional __supply1P8V)
   (if __supply1P8V (setq _supply1P8V __supply1P8V)) _supply1P8V)
  (:supplyN5V
   (&optional __supplyN5V)
   (if __supplyN5V (setq _supplyN5V __supplyN5V)) _supplyN5V)
  (:waveDiffA2D
   (&optional __waveDiffA2D)
   (if __waveDiffA2D (setq _waveDiffA2D __waveDiffA2D)) _waveDiffA2D)
  (:swVersionDSP3rdByte
   (&optional __swVersionDSP3rdByte)
   (if __swVersionDSP3rdByte (setq _swVersionDSP3rdByte __swVersionDSP3rdByte)) _swVersionDSP3rdByte)
  (:verticalAlginUpdated
   (&optional (__verticalAlginUpdated :null))
   (if (not (eq __verticalAlginUpdated :null)) (setq _verticalAlginUpdated __verticalAlginUpdated)) _verticalAlginUpdated)
  (:systemPowerMode
   (&optional __systemPowerMode)
   (if __systemPowerMode (setq _systemPowerMode __systemPowerMode)) _systemPowerMode)
  (:foundTarget
   (&optional (__foundTarget :null))
   (if (not (eq __foundTarget :null)) (setq _foundTarget __foundTarget)) _foundTarget)
  (:recommendUnconverge
   (&optional (__recommendUnconverge :null))
   (if (not (eq __recommendUnconverge :null)) (setq _recommendUnconverge __recommendUnconverge)) _recommendUnconverge)
  (:factoryAlginStatus1
   (&optional __factoryAlginStatus1)
   (if __factoryAlginStatus1 (setq _factoryAlginStatus1 __factoryAlginStatus1)) _factoryAlginStatus1)
  (:factoryAlginStatus2
   (&optional __factoryAlginStatus2)
   (if __factoryAlginStatus2 (setq _factoryAlginStatus2 __factoryAlginStatus2)) _factoryAlginStatus2)
  (:factoryMisAlginment
   (&optional __factoryMisAlginment)
   (if __factoryMisAlginment (setq _factoryMisAlginment __factoryMisAlginment)) _factoryMisAlginment)
  (:servAlginUpdatesDone
   (&optional __servAlginUpdatesDone)
   (if __servAlginUpdatesDone (setq _servAlginUpdatesDone __servAlginUpdatesDone)) _servAlginUpdatesDone)
  (:verticalMisAlginment
   (&optional __verticalMisAlginment)
   (if __verticalMisAlginment (setq _verticalMisAlginment __verticalMisAlginment)) _verticalMisAlginment)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _supply1P8V
    1
    ;; uint8 _supplyN5V
    1
    ;; uint8 _waveDiffA2D
    1
    ;; uint8 _swVersionDSP3rdByte
    1
    ;; bool _verticalAlginUpdated
    1
    ;; uint8 _systemPowerMode
    1
    ;; bool _foundTarget
    1
    ;; bool _recommendUnconverge
    1
    ;; uint8 _factoryAlginStatus1
    1
    ;; uint8 _factoryAlginStatus2
    1
    ;; float32 _factoryMisAlginment
    4
    ;; uint8 _servAlginUpdatesDone
    1
    ;; float32 _verticalMisAlginment
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _canmsg
       (write-long (length _canmsg) s) (princ _canmsg s)
     ;; uint8 _supply1P8V
       (write-byte _supply1P8V s)
     ;; uint8 _supplyN5V
       (write-byte _supplyN5V s)
     ;; uint8 _waveDiffA2D
       (write-byte _waveDiffA2D s)
     ;; uint8 _swVersionDSP3rdByte
       (write-byte _swVersionDSP3rdByte s)
     ;; bool _verticalAlginUpdated
       (if _verticalAlginUpdated (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _systemPowerMode
       (write-byte _systemPowerMode s)
     ;; bool _foundTarget
       (if _foundTarget (write-byte -1 s) (write-byte 0 s))
     ;; bool _recommendUnconverge
       (if _recommendUnconverge (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _factoryAlginStatus1
       (write-byte _factoryAlginStatus1 s)
     ;; uint8 _factoryAlginStatus2
       (write-byte _factoryAlginStatus2 s)
     ;; float32 _factoryMisAlginment
       (sys::poke _factoryMisAlginment (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _servAlginUpdatesDone
       (write-byte _servAlginUpdatesDone s)
     ;; float32 _verticalMisAlginment
       (sys::poke _verticalMisAlginment (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _supply1P8V
     (setq _supply1P8V (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _supplyN5V
     (setq _supplyN5V (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _waveDiffA2D
     (setq _waveDiffA2D (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _swVersionDSP3rdByte
     (setq _swVersionDSP3rdByte (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _verticalAlginUpdated
     (setq _verticalAlginUpdated (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _systemPowerMode
     (setq _systemPowerMode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _foundTarget
     (setq _foundTarget (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _recommendUnconverge
     (setq _recommendUnconverge (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _factoryAlginStatus1
     (setq _factoryAlginStatus1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _factoryAlginStatus2
     (setq _factoryAlginStatus2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _factoryMisAlginment
     (setq _factoryMisAlginment (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _servAlginUpdatesDone
     (setq _servAlginUpdatesDone (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _verticalMisAlginment
     (setq _verticalMisAlginment (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus6 :md5sum-) "fab6045bfaa2bc768f235e17159502ea")
(setf (get delphi_esr_msgs::EsrStatus6 :datatype-) "delphi_esr_msgs/EsrStatus6")
(setf (get delphi_esr_msgs::EsrStatus6 :definition-)
      "Header header

# ESR status6
string      canmsg
uint8       supply1P8V
uint8       supplyN5V
uint8       waveDiffA2D
uint8       swVersionDSP3rdByte
bool        verticalAlginUpdated
uint8       systemPowerMode
bool        foundTarget
bool        recommendUnconverge
uint8       factoryAlginStatus1
uint8       factoryAlginStatus2
float32     factoryMisAlginment
uint8       servAlginUpdatesDone
float32     verticalMisAlginment


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



(provide :delphi_esr_msgs/EsrStatus6 "fab6045bfaa2bc768f235e17159502ea")


