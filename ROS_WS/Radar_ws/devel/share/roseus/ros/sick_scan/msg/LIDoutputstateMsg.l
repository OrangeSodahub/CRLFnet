;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::LIDoutputstateMsg)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'LIDoutputstateMsg (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::LIDOUTPUTSTATEMSG")
  (make-package "SICK_SCAN::LIDOUTPUTSTATEMSG"))

(in-package "ROS")
;;//! \htmlinclude LIDoutputstateMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sick_scan::LIDoutputstateMsg
  :super ros::object
  :slots (_header _version_number _system_counter _output_state _output_count _time_state _year _month _day _hour _minute _second _microsecond ))

(defmethod sick_scan::LIDoutputstateMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:version_number __version_number) 0)
    ((:system_counter __system_counter) 0)
    ((:output_state __output_state) (make-array 0 :initial-element 0 :element-type :char))
    ((:output_count __output_count) (make-array 0 :initial-element 0 :element-type :integer))
    ((:time_state __time_state) 0)
    ((:year __year) 0)
    ((:month __month) 0)
    ((:day __day) 0)
    ((:hour __hour) 0)
    ((:minute __minute) 0)
    ((:second __second) 0)
    ((:microsecond __microsecond) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _version_number (round __version_number))
   (setq _system_counter (round __system_counter))
   (setq _output_state __output_state)
   (setq _output_count __output_count)
   (setq _time_state (round __time_state))
   (setq _year (round __year))
   (setq _month (round __month))
   (setq _day (round __day))
   (setq _hour (round __hour))
   (setq _minute (round __minute))
   (setq _second (round __second))
   (setq _microsecond (round __microsecond))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:version_number
   (&optional __version_number)
   (if __version_number (setq _version_number __version_number)) _version_number)
  (:system_counter
   (&optional __system_counter)
   (if __system_counter (setq _system_counter __system_counter)) _system_counter)
  (:output_state
   (&optional __output_state)
   (if __output_state (setq _output_state __output_state)) _output_state)
  (:output_count
   (&optional __output_count)
   (if __output_count (setq _output_count __output_count)) _output_count)
  (:time_state
   (&optional __time_state)
   (if __time_state (setq _time_state __time_state)) _time_state)
  (:year
   (&optional __year)
   (if __year (setq _year __year)) _year)
  (:month
   (&optional __month)
   (if __month (setq _month __month)) _month)
  (:day
   (&optional __day)
   (if __day (setq _day __day)) _day)
  (:hour
   (&optional __hour)
   (if __hour (setq _hour __hour)) _hour)
  (:minute
   (&optional __minute)
   (if __minute (setq _minute __minute)) _minute)
  (:second
   (&optional __second)
   (if __second (setq _second __second)) _second)
  (:microsecond
   (&optional __microsecond)
   (if __microsecond (setq _microsecond __microsecond)) _microsecond)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _version_number
    2
    ;; uint32 _system_counter
    4
    ;; uint8[] _output_state
    (* 1    (length _output_state)) 4
    ;; uint32[] _output_count
    (* 4    (length _output_count)) 4
    ;; uint16 _time_state
    2
    ;; uint16 _year
    2
    ;; uint8 _month
    1
    ;; uint8 _day
    1
    ;; uint8 _hour
    1
    ;; uint8 _minute
    1
    ;; uint8 _second
    1
    ;; uint32 _microsecond
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _version_number
       (write-word _version_number s)
     ;; uint32 _system_counter
       (write-long _system_counter s)
     ;; uint8[] _output_state
     (write-long (length _output_state) s)
     (princ _output_state s)
     ;; uint32[] _output_count
     (write-long (length _output_count) s)
     (dotimes (i (length _output_count))
       (write-long (elt _output_count i) s)
       )
     ;; uint16 _time_state
       (write-word _time_state s)
     ;; uint16 _year
       (write-word _year s)
     ;; uint8 _month
       (write-byte _month s)
     ;; uint8 _day
       (write-byte _day s)
     ;; uint8 _hour
       (write-byte _hour s)
     ;; uint8 _minute
       (write-byte _minute s)
     ;; uint8 _second
       (write-byte _second s)
     ;; uint32 _microsecond
       (write-long _microsecond s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _version_number
     (setq _version_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _system_counter
     (setq _system_counter (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _output_state
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _output_state (make-array n :element-type :char))
     (replace _output_state buf :start2 ptr-) (incf ptr- n))
   ;; uint32[] _output_count
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _output_count (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _output_count i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint16 _time_state
     (setq _time_state (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _year
     (setq _year (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _month
     (setq _month (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _day
     (setq _day (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hour
     (setq _hour (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _minute
     (setq _minute (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _second
     (setq _second (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _microsecond
     (setq _microsecond (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sick_scan::LIDoutputstateMsg :md5sum-) "e31d4eb61fa1d840e24cb97a0ef71ace")
(setf (get sick_scan::LIDoutputstateMsg :datatype-) "sick_scan/LIDoutputstateMsg")
(setf (get sick_scan::LIDoutputstateMsg :definition-)
      "# This message contains the \"sSN LIDoutputstate\" message of a Sick laser scanner as an ros message.
#

Header header

# Status code
uint16 version_number # Status code version number
uint32 system_counter # Status code system counter (time in microsec since power up, max. 71 min then starting from 0 again)

# Array of output states (state and count)
uint8[] output_state  # output states, each state with value 0 (not active), 1 (active) or 2 (not used)
uint32[] output_count # output counter

# Time block (sensortime from the last change of min. one of the outputs)
uint16 time_state   # No time data: 0, Time data: 1
uint16 year        # f.e. 2021
uint8 month        # 1 ... 12
uint8 day          # 1 ... 31
uint8 hour         # 0 ... 23
uint8 minute       # 0 ... 59
uint8 second       # 0 ... 59
uint32 microsecond # 0 ... 999999

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



(provide :sick_scan/LIDoutputstateMsg "e31d4eb61fa1d840e24cb97a0ef71ace")


