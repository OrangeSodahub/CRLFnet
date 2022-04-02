;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::RadarPreHeaderEncoderBlock)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'RadarPreHeaderEncoderBlock (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::RADARPREHEADERENCODERBLOCK")
  (make-package "SICK_SCAN::RADARPREHEADERENCODERBLOCK"))

(in-package "ROS")
;;//! \htmlinclude RadarPreHeaderEncoderBlock.msg.html


(defclass sick_scan::RadarPreHeaderEncoderBlock
  :super ros::object
  :slots (_udiEncoderPos _iEncoderSpeed ))

(defmethod sick_scan::RadarPreHeaderEncoderBlock
  (:init
   (&key
    ((:udiEncoderPos __udiEncoderPos) 0)
    ((:iEncoderSpeed __iEncoderSpeed) 0)
    )
   (send-super :init)
   (setq _udiEncoderPos (round __udiEncoderPos))
   (setq _iEncoderSpeed (round __iEncoderSpeed))
   self)
  (:udiEncoderPos
   (&optional __udiEncoderPos)
   (if __udiEncoderPos (setq _udiEncoderPos __udiEncoderPos)) _udiEncoderPos)
  (:iEncoderSpeed
   (&optional __iEncoderSpeed)
   (if __iEncoderSpeed (setq _iEncoderSpeed __iEncoderSpeed)) _iEncoderSpeed)
  (:serialization-length
   ()
   (+
    ;; uint32 _udiEncoderPos
    4
    ;; int16 _iEncoderSpeed
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _udiEncoderPos
       (write-long _udiEncoderPos s)
     ;; int16 _iEncoderSpeed
       (write-word _iEncoderSpeed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _udiEncoderPos
     (setq _udiEncoderPos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _iEncoderSpeed
     (setq _iEncoderSpeed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sick_scan::RadarPreHeaderEncoderBlock :md5sum-) "5af720e8adc927dc42f34b3cd0d0e8e9")
(setf (get sick_scan::RadarPreHeaderEncoderBlock :datatype-) "sick_scan/RadarPreHeaderEncoderBlock")
(setf (get sick_scan::RadarPreHeaderEncoderBlock :definition-)
      "# Array with connected encoder sensors
uint32 udiEncoderPos  # encoder position [inc]
int16 iEncoderSpeed   # encoder speed [inc/mm]
")



(provide :sick_scan/RadarPreHeaderEncoderBlock "5af720e8adc927dc42f34b3cd0d0e8e9")


