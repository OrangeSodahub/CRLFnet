;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::RadarPreHeaderStatusBlock)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'RadarPreHeaderStatusBlock (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::RADARPREHEADERSTATUSBLOCK")
  (make-package "SICK_SCAN::RADARPREHEADERSTATUSBLOCK"))

(in-package "ROS")
;;//! \htmlinclude RadarPreHeaderStatusBlock.msg.html


(defclass sick_scan::RadarPreHeaderStatusBlock
  :super ros::object
  :slots (_uiTelegramCount _uiCycleCount _udiSystemCountScan _udiSystemCountTransmit _uiInputs _uiOutputs ))

(defmethod sick_scan::RadarPreHeaderStatusBlock
  (:init
   (&key
    ((:uiTelegramCount __uiTelegramCount) 0)
    ((:uiCycleCount __uiCycleCount) 0)
    ((:udiSystemCountScan __udiSystemCountScan) 0)
    ((:udiSystemCountTransmit __udiSystemCountTransmit) 0)
    ((:uiInputs __uiInputs) 0)
    ((:uiOutputs __uiOutputs) 0)
    )
   (send-super :init)
   (setq _uiTelegramCount (round __uiTelegramCount))
   (setq _uiCycleCount (round __uiCycleCount))
   (setq _udiSystemCountScan (round __udiSystemCountScan))
   (setq _udiSystemCountTransmit (round __udiSystemCountTransmit))
   (setq _uiInputs (round __uiInputs))
   (setq _uiOutputs (round __uiOutputs))
   self)
  (:uiTelegramCount
   (&optional __uiTelegramCount)
   (if __uiTelegramCount (setq _uiTelegramCount __uiTelegramCount)) _uiTelegramCount)
  (:uiCycleCount
   (&optional __uiCycleCount)
   (if __uiCycleCount (setq _uiCycleCount __uiCycleCount)) _uiCycleCount)
  (:udiSystemCountScan
   (&optional __udiSystemCountScan)
   (if __udiSystemCountScan (setq _udiSystemCountScan __udiSystemCountScan)) _udiSystemCountScan)
  (:udiSystemCountTransmit
   (&optional __udiSystemCountTransmit)
   (if __udiSystemCountTransmit (setq _udiSystemCountTransmit __udiSystemCountTransmit)) _udiSystemCountTransmit)
  (:uiInputs
   (&optional __uiInputs)
   (if __uiInputs (setq _uiInputs __uiInputs)) _uiInputs)
  (:uiOutputs
   (&optional __uiOutputs)
   (if __uiOutputs (setq _uiOutputs __uiOutputs)) _uiOutputs)
  (:serialization-length
   ()
   (+
    ;; uint32 _uiTelegramCount
    4
    ;; uint32 _uiCycleCount
    4
    ;; uint32 _udiSystemCountScan
    4
    ;; uint32 _udiSystemCountTransmit
    4
    ;; uint16 _uiInputs
    2
    ;; uint16 _uiOutputs
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _uiTelegramCount
       (write-long _uiTelegramCount s)
     ;; uint32 _uiCycleCount
       (write-long _uiCycleCount s)
     ;; uint32 _udiSystemCountScan
       (write-long _udiSystemCountScan s)
     ;; uint32 _udiSystemCountTransmit
       (write-long _udiSystemCountTransmit s)
     ;; uint16 _uiInputs
       (write-word _uiInputs s)
     ;; uint16 _uiOutputs
       (write-word _uiOutputs s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _uiTelegramCount
     (setq _uiTelegramCount (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _uiCycleCount
     (setq _uiCycleCount (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _udiSystemCountScan
     (setq _udiSystemCountScan (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _udiSystemCountTransmit
     (setq _udiSystemCountTransmit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _uiInputs
     (setq _uiInputs (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _uiOutputs
     (setq _uiOutputs (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sick_scan::RadarPreHeaderStatusBlock :md5sum-) "fa00447ba5857e64792524ca30b37274")
(setf (get sick_scan::RadarPreHeaderStatusBlock :datatype-) "sick_scan/RadarPreHeaderStatusBlock")
(setf (get sick_scan::RadarPreHeaderStatusBlock :definition-)
      "#
#
#
uint32 uiTelegramCount # telegram number
uint32 uiCycleCount # \"scan number\"
uint32 udiSystemCountScan # system time since power on of scan gen. [us]
uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]
uint16 uiInputs # state of digital inputs
uint16 uiOutputs # state of digital outputs

")



(provide :sick_scan/RadarPreHeaderStatusBlock "fa00447ba5857e64792524ca30b37274")


