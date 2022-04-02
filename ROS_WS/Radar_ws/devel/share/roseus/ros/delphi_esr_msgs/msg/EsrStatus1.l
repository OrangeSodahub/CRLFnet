;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus1)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus1 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS1")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS1"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus1.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus1
  :super ros::object
  :slots (_header _canmsg _timeStamp _rollingCount _commError _curvature _scanId _yawRate _vehicleSpeedCalc ))

(defmethod delphi_esr_msgs::EsrStatus1
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:timeStamp __timeStamp) 0)
    ((:rollingCount __rollingCount) 0)
    ((:commError __commError) nil)
    ((:curvature __curvature) 0)
    ((:scanId __scanId) 0)
    ((:yawRate __yawRate) 0.0)
    ((:vehicleSpeedCalc __vehicleSpeedCalc) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _timeStamp (round __timeStamp))
   (setq _rollingCount (round __rollingCount))
   (setq _commError __commError)
   (setq _curvature (round __curvature))
   (setq _scanId (round __scanId))
   (setq _yawRate (float __yawRate))
   (setq _vehicleSpeedCalc (float __vehicleSpeedCalc))
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
  (:timeStamp
   (&optional __timeStamp)
   (if __timeStamp (setq _timeStamp __timeStamp)) _timeStamp)
  (:rollingCount
   (&optional __rollingCount)
   (if __rollingCount (setq _rollingCount __rollingCount)) _rollingCount)
  (:commError
   (&optional (__commError :null))
   (if (not (eq __commError :null)) (setq _commError __commError)) _commError)
  (:curvature
   (&optional __curvature)
   (if __curvature (setq _curvature __curvature)) _curvature)
  (:scanId
   (&optional __scanId)
   (if __scanId (setq _scanId __scanId)) _scanId)
  (:yawRate
   (&optional __yawRate)
   (if __yawRate (setq _yawRate __yawRate)) _yawRate)
  (:vehicleSpeedCalc
   (&optional __vehicleSpeedCalc)
   (if __vehicleSpeedCalc (setq _vehicleSpeedCalc __vehicleSpeedCalc)) _vehicleSpeedCalc)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _timeStamp
    1
    ;; uint8 _rollingCount
    1
    ;; bool _commError
    1
    ;; int16 _curvature
    2
    ;; uint16 _scanId
    2
    ;; float32 _yawRate
    4
    ;; float32 _vehicleSpeedCalc
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
     ;; uint8 _timeStamp
       (write-byte _timeStamp s)
     ;; uint8 _rollingCount
       (write-byte _rollingCount s)
     ;; bool _commError
       (if _commError (write-byte -1 s) (write-byte 0 s))
     ;; int16 _curvature
       (write-word _curvature s)
     ;; uint16 _scanId
       (write-word _scanId s)
     ;; float32 _yawRate
       (sys::poke _yawRate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vehicleSpeedCalc
       (sys::poke _vehicleSpeedCalc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _timeStamp
     (setq _timeStamp (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rollingCount
     (setq _rollingCount (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _commError
     (setq _commError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _curvature
     (setq _curvature (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _scanId
     (setq _scanId (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _yawRate
     (setq _yawRate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vehicleSpeedCalc
     (setq _vehicleSpeedCalc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus1 :md5sum-) "2bab6477be87782f9154c54c75ec5117")
(setf (get delphi_esr_msgs::EsrStatus1 :datatype-) "delphi_esr_msgs/EsrStatus1")
(setf (get delphi_esr_msgs::EsrStatus1 :definition-)
      "Header header

# ESR status1
string      canmsg
uint8       timeStamp
uint8       rollingCount
bool        commError
int16       curvature
uint16      scanId
float32     yawRate
float32     vehicleSpeedCalc


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



(provide :delphi_esr_msgs/EsrStatus1 "2bab6477be87782f9154c54c75ec5117")


