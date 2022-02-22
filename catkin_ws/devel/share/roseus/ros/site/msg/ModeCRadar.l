;; Auto-generated. Do not edit!


(when (boundp 'site::ModeCRadar)
  (if (not (find-package "SITE"))
    (make-package "SITE"))
  (shadow 'ModeCRadar (find-package "SITE")))
(unless (find-package "SITE::MODECRADAR")
  (make-package "SITE::MODECRADAR"))

(in-package "ROS")
;;//! \htmlinclude ModeCRadar.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass site::ModeCRadar
  :super ros::object
  :slots (_header _range _bearing _altitude _code _ident ))

(defmethod site::ModeCRadar
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:range __range) 0.0)
    ((:bearing __bearing) 0.0)
    ((:altitude __altitude) 0.0)
    ((:code __code) 0)
    ((:ident __ident) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _range (float __range))
   (setq _bearing (float __bearing))
   (setq _altitude (float __altitude))
   (setq _code (round __code))
   (setq _ident __ident)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:bearing
   (&optional __bearing)
   (if __bearing (setq _bearing __bearing)) _bearing)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:code
   (&optional __code)
   (if __code (setq _code __code)) _code)
  (:ident
   (&optional (__ident :null))
   (if (not (eq __ident :null)) (setq _ident __ident)) _ident)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _range
    4
    ;; float32 _bearing
    4
    ;; float32 _altitude
    4
    ;; uint16 _code
    2
    ;; bool _ident
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _range
       (sys::poke _range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bearing
       (sys::poke _bearing (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint16 _code
       (write-word _code s)
     ;; bool _ident
       (if _ident (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _range
     (setq _range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bearing
     (setq _bearing (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint16 _code
     (setq _code (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _ident
     (setq _ident (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get site::ModeCRadar :md5sum-) "19c4f5ea27d7018d84f81236837f5bfe")
(setf (get site::ModeCRadar :datatype-) "site/ModeCRadar")
(setf (get site::ModeCRadar :definition-)
      "Header header
float32 range  # meters
float32 bearing  # radians clockwise about Z axis of header frame
float32 altitude  # Pressure altitude (m)
uint16 code # Transponder code
bool ident  # If ident button was pressed

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



(provide :site/ModeCRadar "19c4f5ea27d7018d84f81236837f5bfe")


