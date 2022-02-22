;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::RadarPreHeaderMeasurementParam1Block)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'RadarPreHeaderMeasurementParam1Block (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::RADARPREHEADERMEASUREMENTPARAM1BLOCK")
  (make-package "SICK_SCAN::RADARPREHEADERMEASUREMENTPARAM1BLOCK"))

(in-package "ROS")
;;//! \htmlinclude RadarPreHeaderMeasurementParam1Block.msg.html


(defclass sick_scan::RadarPreHeaderMeasurementParam1Block
  :super ros::object
  :slots (_uiCycleDuration _uiNoiseLevel ))

(defmethod sick_scan::RadarPreHeaderMeasurementParam1Block
  (:init
   (&key
    ((:uiCycleDuration __uiCycleDuration) 0)
    ((:uiNoiseLevel __uiNoiseLevel) 0)
    )
   (send-super :init)
   (setq _uiCycleDuration (round __uiCycleDuration))
   (setq _uiNoiseLevel (round __uiNoiseLevel))
   self)
  (:uiCycleDuration
   (&optional __uiCycleDuration)
   (if __uiCycleDuration (setq _uiCycleDuration __uiCycleDuration)) _uiCycleDuration)
  (:uiNoiseLevel
   (&optional __uiNoiseLevel)
   (if __uiNoiseLevel (setq _uiNoiseLevel __uiNoiseLevel)) _uiNoiseLevel)
  (:serialization-length
   ()
   (+
    ;; uint32 _uiCycleDuration
    4
    ;; uint32 _uiNoiseLevel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _uiCycleDuration
       (write-long _uiCycleDuration s)
     ;; uint32 _uiNoiseLevel
       (write-long _uiNoiseLevel s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _uiCycleDuration
     (setq _uiCycleDuration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _uiNoiseLevel
     (setq _uiNoiseLevel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sick_scan::RadarPreHeaderMeasurementParam1Block :md5sum-) "34fa13bb693fa69fead0a46da987eb62")
(setf (get sick_scan::RadarPreHeaderMeasurementParam1Block :datatype-) "sick_scan/RadarPreHeaderMeasurementParam1Block")
(setf (get sick_scan::RadarPreHeaderMeasurementParam1Block :definition-)
      "uint32 uiCycleDuration # Time in microseconds to detect this items
uint32 uiNoiseLevel # [1/100dB]

")



(provide :sick_scan/RadarPreHeaderMeasurementParam1Block "34fa13bb693fa69fead0a46da987eb62")


