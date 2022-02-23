;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrTrackMotionPower)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrTrackMotionPower (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRTRACKMOTIONPOWER")
  (make-package "DELPHI_ESR_MSGS::ESRTRACKMOTIONPOWER"))

(in-package "ROS")
;;//! \htmlinclude EsrTrackMotionPower.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrTrackMotionPower
  :super ros::object
  :slots (_header _canmsg _rollingCount _groupId _tracks ))

(defmethod delphi_esr_msgs::EsrTrackMotionPower
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:rollingCount __rollingCount) 0)
    ((:groupId __groupId) 0)
    ((:tracks __tracks) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _rollingCount (round __rollingCount))
   (setq _groupId (round __groupId))
   (setq _tracks __tracks)
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
  (:rollingCount
   (&optional __rollingCount)
   (if __rollingCount (setq _rollingCount __rollingCount)) _rollingCount)
  (:groupId
   (&optional __groupId)
   (if __groupId (setq _groupId __groupId)) _groupId)
  (:tracks
   (&rest __tracks)
   (if (keywordp (car __tracks))
       (send* _tracks __tracks)
     (progn
       (if __tracks (setq _tracks (car __tracks)))
       _tracks)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _rollingCount
    1
    ;; uint8 _groupId
    1
    ;; delphi_esr_msgs/TrackMotionPower[] _tracks
    (apply #'+ (send-all _tracks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _canmsg
       (write-long (length _canmsg) s) (princ _canmsg s)
     ;; uint8 _rollingCount
       (write-byte _rollingCount s)
     ;; uint8 _groupId
       (write-byte _groupId s)
     ;; delphi_esr_msgs/TrackMotionPower[] _tracks
     (write-long (length _tracks) s)
     (dolist (elem _tracks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _rollingCount
     (setq _rollingCount (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _groupId
     (setq _groupId (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; delphi_esr_msgs/TrackMotionPower[] _tracks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tracks (let (r) (dotimes (i n) (push (instance delphi_esr_msgs::TrackMotionPower :init) r)) r))
     (dolist (elem- _tracks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrTrackMotionPower :md5sum-) "0e70b42d5a6083ffa1a12dcd74ab9d45")
(setf (get delphi_esr_msgs::EsrTrackMotionPower :datatype-) "delphi_esr_msgs/EsrTrackMotionPower")
(setf (get delphi_esr_msgs::EsrTrackMotionPower :definition-)
      "Header header

# ESR TrackMotionPower Msg
string                canmsg
uint8                 rollingCount
uint8                 groupId
TrackMotionPower[]  tracks

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

================================================================================
MSG: delphi_esr_msgs/TrackMotionPower
bool  movableFast
bool  movableSlow
bool  moving
int8 power

")



(provide :delphi_esr_msgs/EsrTrackMotionPower "0e70b42d5a6083ffa1a12dcd74ab9d45")


