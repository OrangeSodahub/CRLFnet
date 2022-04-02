;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus2)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus2 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS2")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS2"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus2
  :super ros::object
  :slots (_header _canmsg _rollingCount2 _maxTrackAck _overheatError _rangePerfError _internalError _xcvrOperational _rawDataMode _steerAngleAck _temperature _spdCompFactor _groupingMode _yawRateBias _swVersionDSP ))

(defmethod delphi_esr_msgs::EsrStatus2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:rollingCount2 __rollingCount2) 0)
    ((:maxTrackAck __maxTrackAck) 0)
    ((:overheatError __overheatError) nil)
    ((:rangePerfError __rangePerfError) nil)
    ((:internalError __internalError) nil)
    ((:xcvrOperational __xcvrOperational) nil)
    ((:rawDataMode __rawDataMode) nil)
    ((:steerAngleAck __steerAngleAck) 0)
    ((:temperature __temperature) 0)
    ((:spdCompFactor __spdCompFactor) 0.0)
    ((:groupingMode __groupingMode) 0)
    ((:yawRateBias __yawRateBias) 0.0)
    ((:swVersionDSP __swVersionDSP) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _rollingCount2 (round __rollingCount2))
   (setq _maxTrackAck (round __maxTrackAck))
   (setq _overheatError __overheatError)
   (setq _rangePerfError __rangePerfError)
   (setq _internalError __internalError)
   (setq _xcvrOperational __xcvrOperational)
   (setq _rawDataMode __rawDataMode)
   (setq _steerAngleAck (round __steerAngleAck))
   (setq _temperature (round __temperature))
   (setq _spdCompFactor (float __spdCompFactor))
   (setq _groupingMode (round __groupingMode))
   (setq _yawRateBias (float __yawRateBias))
   (setq _swVersionDSP (string __swVersionDSP))
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
  (:rollingCount2
   (&optional __rollingCount2)
   (if __rollingCount2 (setq _rollingCount2 __rollingCount2)) _rollingCount2)
  (:maxTrackAck
   (&optional __maxTrackAck)
   (if __maxTrackAck (setq _maxTrackAck __maxTrackAck)) _maxTrackAck)
  (:overheatError
   (&optional (__overheatError :null))
   (if (not (eq __overheatError :null)) (setq _overheatError __overheatError)) _overheatError)
  (:rangePerfError
   (&optional (__rangePerfError :null))
   (if (not (eq __rangePerfError :null)) (setq _rangePerfError __rangePerfError)) _rangePerfError)
  (:internalError
   (&optional (__internalError :null))
   (if (not (eq __internalError :null)) (setq _internalError __internalError)) _internalError)
  (:xcvrOperational
   (&optional (__xcvrOperational :null))
   (if (not (eq __xcvrOperational :null)) (setq _xcvrOperational __xcvrOperational)) _xcvrOperational)
  (:rawDataMode
   (&optional (__rawDataMode :null))
   (if (not (eq __rawDataMode :null)) (setq _rawDataMode __rawDataMode)) _rawDataMode)
  (:steerAngleAck
   (&optional __steerAngleAck)
   (if __steerAngleAck (setq _steerAngleAck __steerAngleAck)) _steerAngleAck)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:spdCompFactor
   (&optional __spdCompFactor)
   (if __spdCompFactor (setq _spdCompFactor __spdCompFactor)) _spdCompFactor)
  (:groupingMode
   (&optional __groupingMode)
   (if __groupingMode (setq _groupingMode __groupingMode)) _groupingMode)
  (:yawRateBias
   (&optional __yawRateBias)
   (if __yawRateBias (setq _yawRateBias __yawRateBias)) _yawRateBias)
  (:swVersionDSP
   (&optional __swVersionDSP)
   (if __swVersionDSP (setq _swVersionDSP __swVersionDSP)) _swVersionDSP)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _rollingCount2
    1
    ;; uint8 _maxTrackAck
    1
    ;; bool _overheatError
    1
    ;; bool _rangePerfError
    1
    ;; bool _internalError
    1
    ;; bool _xcvrOperational
    1
    ;; bool _rawDataMode
    1
    ;; uint16 _steerAngleAck
    2
    ;; int8 _temperature
    1
    ;; float32 _spdCompFactor
    4
    ;; uint8 _groupingMode
    1
    ;; float32 _yawRateBias
    4
    ;; string _swVersionDSP
    4 (length _swVersionDSP)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _canmsg
       (write-long (length _canmsg) s) (princ _canmsg s)
     ;; uint8 _rollingCount2
       (write-byte _rollingCount2 s)
     ;; uint8 _maxTrackAck
       (write-byte _maxTrackAck s)
     ;; bool _overheatError
       (if _overheatError (write-byte -1 s) (write-byte 0 s))
     ;; bool _rangePerfError
       (if _rangePerfError (write-byte -1 s) (write-byte 0 s))
     ;; bool _internalError
       (if _internalError (write-byte -1 s) (write-byte 0 s))
     ;; bool _xcvrOperational
       (if _xcvrOperational (write-byte -1 s) (write-byte 0 s))
     ;; bool _rawDataMode
       (if _rawDataMode (write-byte -1 s) (write-byte 0 s))
     ;; uint16 _steerAngleAck
       (write-word _steerAngleAck s)
     ;; int8 _temperature
       (write-byte _temperature s)
     ;; float32 _spdCompFactor
       (sys::poke _spdCompFactor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _groupingMode
       (write-byte _groupingMode s)
     ;; float32 _yawRateBias
       (sys::poke _yawRateBias (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _swVersionDSP
       (write-long (length _swVersionDSP) s) (princ _swVersionDSP s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _rollingCount2
     (setq _rollingCount2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _maxTrackAck
     (setq _maxTrackAck (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _overheatError
     (setq _overheatError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _rangePerfError
     (setq _rangePerfError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _internalError
     (setq _internalError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _xcvrOperational
     (setq _xcvrOperational (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _rawDataMode
     (setq _rawDataMode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint16 _steerAngleAck
     (setq _steerAngleAck (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int8 _temperature
     (setq _temperature (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _temperature 127) (setq _temperature (- _temperature 256)))
   ;; float32 _spdCompFactor
     (setq _spdCompFactor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _groupingMode
     (setq _groupingMode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _yawRateBias
     (setq _yawRateBias (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _swVersionDSP
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _swVersionDSP (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus2 :md5sum-) "bcf53fd3f623189a15116de844ce9791")
(setf (get delphi_esr_msgs::EsrStatus2 :datatype-) "delphi_esr_msgs/EsrStatus2")
(setf (get delphi_esr_msgs::EsrStatus2 :definition-)
      "Header header

# ESR status2
string      canmsg
uint8       rollingCount2
uint8       maxTrackAck
bool        overheatError
bool        rangePerfError
bool        internalError
bool        xcvrOperational
bool        rawDataMode
uint16      steerAngleAck
int8        temperature
float32     spdCompFactor
uint8       groupingMode
float32     yawRateBias
string      swVersionDSP     


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



(provide :delphi_esr_msgs/EsrStatus2 "bcf53fd3f623189a15116de844ce9791")


