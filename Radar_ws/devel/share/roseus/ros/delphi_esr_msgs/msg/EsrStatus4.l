;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::EsrStatus4)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'EsrStatus4 (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::ESRSTATUS4")
  (make-package "DELPHI_ESR_MSGS::ESRSTATUS4"))

(in-package "ROS")
;;//! \htmlinclude EsrStatus4.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass delphi_esr_msgs::EsrStatus4
  :super ros::object
  :slots (_header _canmsg _rollingCount3 _mrlrMode _patialBlockage _sideLobeBlockage _lrOnlyGratingLobeDet _truckTargetDet _pathIdAcc _pathIdCmmbMove _pathIdCmmbStat _pathIdFcwMove _pathIdFcwStat _pathIdAccStat _autoAlginAngle ))

(defmethod delphi_esr_msgs::EsrStatus4
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:canmsg __canmsg) "")
    ((:rollingCount3 __rollingCount3) 0)
    ((:mrlrMode __mrlrMode) 0)
    ((:patialBlockage __patialBlockage) nil)
    ((:sideLobeBlockage __sideLobeBlockage) nil)
    ((:lrOnlyGratingLobeDet __lrOnlyGratingLobeDet) nil)
    ((:truckTargetDet __truckTargetDet) nil)
    ((:pathIdAcc __pathIdAcc) 0)
    ((:pathIdCmmbMove __pathIdCmmbMove) 0)
    ((:pathIdCmmbStat __pathIdCmmbStat) 0)
    ((:pathIdFcwMove __pathIdFcwMove) 0)
    ((:pathIdFcwStat __pathIdFcwStat) 0)
    ((:pathIdAccStat __pathIdAccStat) 0)
    ((:autoAlginAngle __autoAlginAngle) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _canmsg (string __canmsg))
   (setq _rollingCount3 (round __rollingCount3))
   (setq _mrlrMode (round __mrlrMode))
   (setq _patialBlockage __patialBlockage)
   (setq _sideLobeBlockage __sideLobeBlockage)
   (setq _lrOnlyGratingLobeDet __lrOnlyGratingLobeDet)
   (setq _truckTargetDet __truckTargetDet)
   (setq _pathIdAcc (round __pathIdAcc))
   (setq _pathIdCmmbMove (round __pathIdCmmbMove))
   (setq _pathIdCmmbStat (round __pathIdCmmbStat))
   (setq _pathIdFcwMove (round __pathIdFcwMove))
   (setq _pathIdFcwStat (round __pathIdFcwStat))
   (setq _pathIdAccStat (round __pathIdAccStat))
   (setq _autoAlginAngle (float __autoAlginAngle))
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
  (:rollingCount3
   (&optional __rollingCount3)
   (if __rollingCount3 (setq _rollingCount3 __rollingCount3)) _rollingCount3)
  (:mrlrMode
   (&optional __mrlrMode)
   (if __mrlrMode (setq _mrlrMode __mrlrMode)) _mrlrMode)
  (:patialBlockage
   (&optional (__patialBlockage :null))
   (if (not (eq __patialBlockage :null)) (setq _patialBlockage __patialBlockage)) _patialBlockage)
  (:sideLobeBlockage
   (&optional (__sideLobeBlockage :null))
   (if (not (eq __sideLobeBlockage :null)) (setq _sideLobeBlockage __sideLobeBlockage)) _sideLobeBlockage)
  (:lrOnlyGratingLobeDet
   (&optional (__lrOnlyGratingLobeDet :null))
   (if (not (eq __lrOnlyGratingLobeDet :null)) (setq _lrOnlyGratingLobeDet __lrOnlyGratingLobeDet)) _lrOnlyGratingLobeDet)
  (:truckTargetDet
   (&optional (__truckTargetDet :null))
   (if (not (eq __truckTargetDet :null)) (setq _truckTargetDet __truckTargetDet)) _truckTargetDet)
  (:pathIdAcc
   (&optional __pathIdAcc)
   (if __pathIdAcc (setq _pathIdAcc __pathIdAcc)) _pathIdAcc)
  (:pathIdCmmbMove
   (&optional __pathIdCmmbMove)
   (if __pathIdCmmbMove (setq _pathIdCmmbMove __pathIdCmmbMove)) _pathIdCmmbMove)
  (:pathIdCmmbStat
   (&optional __pathIdCmmbStat)
   (if __pathIdCmmbStat (setq _pathIdCmmbStat __pathIdCmmbStat)) _pathIdCmmbStat)
  (:pathIdFcwMove
   (&optional __pathIdFcwMove)
   (if __pathIdFcwMove (setq _pathIdFcwMove __pathIdFcwMove)) _pathIdFcwMove)
  (:pathIdFcwStat
   (&optional __pathIdFcwStat)
   (if __pathIdFcwStat (setq _pathIdFcwStat __pathIdFcwStat)) _pathIdFcwStat)
  (:pathIdAccStat
   (&optional __pathIdAccStat)
   (if __pathIdAccStat (setq _pathIdAccStat __pathIdAccStat)) _pathIdAccStat)
  (:autoAlginAngle
   (&optional __autoAlginAngle)
   (if __autoAlginAngle (setq _autoAlginAngle __autoAlginAngle)) _autoAlginAngle)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _canmsg
    4 (length _canmsg)
    ;; uint8 _rollingCount3
    1
    ;; uint8 _mrlrMode
    1
    ;; bool _patialBlockage
    1
    ;; bool _sideLobeBlockage
    1
    ;; bool _lrOnlyGratingLobeDet
    1
    ;; bool _truckTargetDet
    1
    ;; uint8 _pathIdAcc
    1
    ;; uint8 _pathIdCmmbMove
    1
    ;; uint8 _pathIdCmmbStat
    1
    ;; uint8 _pathIdFcwMove
    1
    ;; uint8 _pathIdFcwStat
    1
    ;; uint8 _pathIdAccStat
    1
    ;; float32 _autoAlginAngle
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
     ;; uint8 _rollingCount3
       (write-byte _rollingCount3 s)
     ;; uint8 _mrlrMode
       (write-byte _mrlrMode s)
     ;; bool _patialBlockage
       (if _patialBlockage (write-byte -1 s) (write-byte 0 s))
     ;; bool _sideLobeBlockage
       (if _sideLobeBlockage (write-byte -1 s) (write-byte 0 s))
     ;; bool _lrOnlyGratingLobeDet
       (if _lrOnlyGratingLobeDet (write-byte -1 s) (write-byte 0 s))
     ;; bool _truckTargetDet
       (if _truckTargetDet (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _pathIdAcc
       (write-byte _pathIdAcc s)
     ;; uint8 _pathIdCmmbMove
       (write-byte _pathIdCmmbMove s)
     ;; uint8 _pathIdCmmbStat
       (write-byte _pathIdCmmbStat s)
     ;; uint8 _pathIdFcwMove
       (write-byte _pathIdFcwMove s)
     ;; uint8 _pathIdFcwStat
       (write-byte _pathIdFcwStat s)
     ;; uint8 _pathIdAccStat
       (write-byte _pathIdAccStat s)
     ;; float32 _autoAlginAngle
       (sys::poke _autoAlginAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _canmsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _canmsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _rollingCount3
     (setq _rollingCount3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mrlrMode
     (setq _mrlrMode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _patialBlockage
     (setq _patialBlockage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sideLobeBlockage
     (setq _sideLobeBlockage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _lrOnlyGratingLobeDet
     (setq _lrOnlyGratingLobeDet (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _truckTargetDet
     (setq _truckTargetDet (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _pathIdAcc
     (setq _pathIdAcc (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pathIdCmmbMove
     (setq _pathIdCmmbMove (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pathIdCmmbStat
     (setq _pathIdCmmbStat (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pathIdFcwMove
     (setq _pathIdFcwMove (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pathIdFcwStat
     (setq _pathIdFcwStat (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pathIdAccStat
     (setq _pathIdAccStat (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _autoAlginAngle
     (setq _autoAlginAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get delphi_esr_msgs::EsrStatus4 :md5sum-) "abec2ac03bbfc0ae47f593463cff96cc")
(setf (get delphi_esr_msgs::EsrStatus4 :datatype-) "delphi_esr_msgs/EsrStatus4")
(setf (get delphi_esr_msgs::EsrStatus4 :definition-)
      "Header header

# ESR status4
string      canmsg
uint8       rollingCount3
uint8       mrlrMode
bool        patialBlockage
bool        sideLobeBlockage
bool        lrOnlyGratingLobeDet
bool        truckTargetDet
uint8       pathIdAcc
uint8       pathIdCmmbMove
uint8       pathIdCmmbStat
uint8       pathIdFcwMove
uint8       pathIdFcwStat
uint8       pathIdAccStat
float32     autoAlginAngle



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



(provide :delphi_esr_msgs/EsrStatus4 "abec2ac03bbfc0ae47f593463cff96cc")


