;; Auto-generated. Do not edit!


(when (boundp 'delphi_esr_msgs::TrackMotionPower)
  (if (not (find-package "DELPHI_ESR_MSGS"))
    (make-package "DELPHI_ESR_MSGS"))
  (shadow 'TrackMotionPower (find-package "DELPHI_ESR_MSGS")))
(unless (find-package "DELPHI_ESR_MSGS::TRACKMOTIONPOWER")
  (make-package "DELPHI_ESR_MSGS::TRACKMOTIONPOWER"))

(in-package "ROS")
;;//! \htmlinclude TrackMotionPower.msg.html


(defclass delphi_esr_msgs::TrackMotionPower
  :super ros::object
  :slots (_movableFast _movableSlow _moving _power ))

(defmethod delphi_esr_msgs::TrackMotionPower
  (:init
   (&key
    ((:movableFast __movableFast) nil)
    ((:movableSlow __movableSlow) nil)
    ((:moving __moving) nil)
    ((:power __power) 0)
    )
   (send-super :init)
   (setq _movableFast __movableFast)
   (setq _movableSlow __movableSlow)
   (setq _moving __moving)
   (setq _power (round __power))
   self)
  (:movableFast
   (&optional (__movableFast :null))
   (if (not (eq __movableFast :null)) (setq _movableFast __movableFast)) _movableFast)
  (:movableSlow
   (&optional (__movableSlow :null))
   (if (not (eq __movableSlow :null)) (setq _movableSlow __movableSlow)) _movableSlow)
  (:moving
   (&optional (__moving :null))
   (if (not (eq __moving :null)) (setq _moving __moving)) _moving)
  (:power
   (&optional __power)
   (if __power (setq _power __power)) _power)
  (:serialization-length
   ()
   (+
    ;; bool _movableFast
    1
    ;; bool _movableSlow
    1
    ;; bool _moving
    1
    ;; int8 _power
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _movableFast
       (if _movableFast (write-byte -1 s) (write-byte 0 s))
     ;; bool _movableSlow
       (if _movableSlow (write-byte -1 s) (write-byte 0 s))
     ;; bool _moving
       (if _moving (write-byte -1 s) (write-byte 0 s))
     ;; int8 _power
       (write-byte _power s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _movableFast
     (setq _movableFast (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _movableSlow
     (setq _movableSlow (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _moving
     (setq _moving (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _power
     (setq _power (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _power 127) (setq _power (- _power 256)))
   ;;
   self)
  )

(setf (get delphi_esr_msgs::TrackMotionPower :md5sum-) "bc0039fe6b619538bc897d0433ea31a8")
(setf (get delphi_esr_msgs::TrackMotionPower :datatype-) "delphi_esr_msgs/TrackMotionPower")
(setf (get delphi_esr_msgs::TrackMotionPower :definition-)
      "bool  movableFast
bool  movableSlow
bool  moving
int8 power

")



(provide :delphi_esr_msgs/TrackMotionPower "bc0039fe6b619538bc897d0433ea31a8")


