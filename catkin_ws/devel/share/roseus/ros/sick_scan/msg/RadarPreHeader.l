;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::RadarPreHeader)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'RadarPreHeader (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::RADARPREHEADER")
  (make-package "SICK_SCAN::RADARPREHEADER"))

(in-package "ROS")
;;//! \htmlinclude RadarPreHeader.msg.html


(defclass sick_scan::RadarPreHeader
  :super ros::object
  :slots (_uiVersionNo _radarPreHeaderDeviceBlock _radarPreHeaderStatusBlock _radarPreHeaderMeasurementParam1Block _radarPreHeaderArrayEncoderBlock ))

(defmethod sick_scan::RadarPreHeader
  (:init
   (&key
    ((:uiVersionNo __uiVersionNo) 0)
    ((:radarPreHeaderDeviceBlock __radarPreHeaderDeviceBlock) (instance sick_scan::RadarPreHeaderDeviceBlock :init))
    ((:radarPreHeaderStatusBlock __radarPreHeaderStatusBlock) (instance sick_scan::RadarPreHeaderStatusBlock :init))
    ((:radarPreHeaderMeasurementParam1Block __radarPreHeaderMeasurementParam1Block) (instance sick_scan::RadarPreHeaderMeasurementParam1Block :init))
    ((:radarPreHeaderArrayEncoderBlock __radarPreHeaderArrayEncoderBlock) ())
    )
   (send-super :init)
   (setq _uiVersionNo (round __uiVersionNo))
   (setq _radarPreHeaderDeviceBlock __radarPreHeaderDeviceBlock)
   (setq _radarPreHeaderStatusBlock __radarPreHeaderStatusBlock)
   (setq _radarPreHeaderMeasurementParam1Block __radarPreHeaderMeasurementParam1Block)
   (setq _radarPreHeaderArrayEncoderBlock __radarPreHeaderArrayEncoderBlock)
   self)
  (:uiVersionNo
   (&optional __uiVersionNo)
   (if __uiVersionNo (setq _uiVersionNo __uiVersionNo)) _uiVersionNo)
  (:radarPreHeaderDeviceBlock
   (&rest __radarPreHeaderDeviceBlock)
   (if (keywordp (car __radarPreHeaderDeviceBlock))
       (send* _radarPreHeaderDeviceBlock __radarPreHeaderDeviceBlock)
     (progn
       (if __radarPreHeaderDeviceBlock (setq _radarPreHeaderDeviceBlock (car __radarPreHeaderDeviceBlock)))
       _radarPreHeaderDeviceBlock)))
  (:radarPreHeaderStatusBlock
   (&rest __radarPreHeaderStatusBlock)
   (if (keywordp (car __radarPreHeaderStatusBlock))
       (send* _radarPreHeaderStatusBlock __radarPreHeaderStatusBlock)
     (progn
       (if __radarPreHeaderStatusBlock (setq _radarPreHeaderStatusBlock (car __radarPreHeaderStatusBlock)))
       _radarPreHeaderStatusBlock)))
  (:radarPreHeaderMeasurementParam1Block
   (&rest __radarPreHeaderMeasurementParam1Block)
   (if (keywordp (car __radarPreHeaderMeasurementParam1Block))
       (send* _radarPreHeaderMeasurementParam1Block __radarPreHeaderMeasurementParam1Block)
     (progn
       (if __radarPreHeaderMeasurementParam1Block (setq _radarPreHeaderMeasurementParam1Block (car __radarPreHeaderMeasurementParam1Block)))
       _radarPreHeaderMeasurementParam1Block)))
  (:radarPreHeaderArrayEncoderBlock
   (&rest __radarPreHeaderArrayEncoderBlock)
   (if (keywordp (car __radarPreHeaderArrayEncoderBlock))
       (send* _radarPreHeaderArrayEncoderBlock __radarPreHeaderArrayEncoderBlock)
     (progn
       (if __radarPreHeaderArrayEncoderBlock (setq _radarPreHeaderArrayEncoderBlock (car __radarPreHeaderArrayEncoderBlock)))
       _radarPreHeaderArrayEncoderBlock)))
  (:serialization-length
   ()
   (+
    ;; uint16 _uiVersionNo
    2
    ;; sick_scan/RadarPreHeaderDeviceBlock _radarPreHeaderDeviceBlock
    (send _radarPreHeaderDeviceBlock :serialization-length)
    ;; sick_scan/RadarPreHeaderStatusBlock _radarPreHeaderStatusBlock
    (send _radarPreHeaderStatusBlock :serialization-length)
    ;; sick_scan/RadarPreHeaderMeasurementParam1Block _radarPreHeaderMeasurementParam1Block
    (send _radarPreHeaderMeasurementParam1Block :serialization-length)
    ;; sick_scan/RadarPreHeaderEncoderBlock[] _radarPreHeaderArrayEncoderBlock
    (apply #'+ (send-all _radarPreHeaderArrayEncoderBlock :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _uiVersionNo
       (write-word _uiVersionNo s)
     ;; sick_scan/RadarPreHeaderDeviceBlock _radarPreHeaderDeviceBlock
       (send _radarPreHeaderDeviceBlock :serialize s)
     ;; sick_scan/RadarPreHeaderStatusBlock _radarPreHeaderStatusBlock
       (send _radarPreHeaderStatusBlock :serialize s)
     ;; sick_scan/RadarPreHeaderMeasurementParam1Block _radarPreHeaderMeasurementParam1Block
       (send _radarPreHeaderMeasurementParam1Block :serialize s)
     ;; sick_scan/RadarPreHeaderEncoderBlock[] _radarPreHeaderArrayEncoderBlock
     (write-long (length _radarPreHeaderArrayEncoderBlock) s)
     (dolist (elem _radarPreHeaderArrayEncoderBlock)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _uiVersionNo
     (setq _uiVersionNo (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; sick_scan/RadarPreHeaderDeviceBlock _radarPreHeaderDeviceBlock
     (send _radarPreHeaderDeviceBlock :deserialize buf ptr-) (incf ptr- (send _radarPreHeaderDeviceBlock :serialization-length))
   ;; sick_scan/RadarPreHeaderStatusBlock _radarPreHeaderStatusBlock
     (send _radarPreHeaderStatusBlock :deserialize buf ptr-) (incf ptr- (send _radarPreHeaderStatusBlock :serialization-length))
   ;; sick_scan/RadarPreHeaderMeasurementParam1Block _radarPreHeaderMeasurementParam1Block
     (send _radarPreHeaderMeasurementParam1Block :deserialize buf ptr-) (incf ptr- (send _radarPreHeaderMeasurementParam1Block :serialization-length))
   ;; sick_scan/RadarPreHeaderEncoderBlock[] _radarPreHeaderArrayEncoderBlock
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _radarPreHeaderArrayEncoderBlock (let (r) (dotimes (i n) (push (instance sick_scan::RadarPreHeaderEncoderBlock :init) r)) r))
     (dolist (elem- _radarPreHeaderArrayEncoderBlock)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sick_scan::RadarPreHeader :md5sum-) "2b96d942f26bd5b00da7e631bf199685")
(setf (get sick_scan::RadarPreHeader :datatype-) "sick_scan/RadarPreHeader")
(setf (get sick_scan::RadarPreHeader :definition-)
      "# Version information for this whole structure (MeasurementData)
uint16 uiVersionNo
sick_scan/RadarPreHeaderDeviceBlock radarPreHeaderDeviceBlock
sick_scan/RadarPreHeaderStatusBlock radarPreHeaderStatusBlock
sick_scan/RadarPreHeaderMeasurementParam1Block radarPreHeaderMeasurementParam1Block
sick_scan/RadarPreHeaderEncoderBlock[] radarPreHeaderArrayEncoderBlock


================================================================================
MSG: sick_scan/RadarPreHeaderDeviceBlock
#
#
#
#

# Logical number of the device\"
uint32 uiIdent
# Serial number of the device
uint32 udiSerialNo
# State of the device
bool bDeviceError
# Contamination Warning
bool bContaminationWarning
# Contamination Error
bool bContaminationError
================================================================================
MSG: sick_scan/RadarPreHeaderStatusBlock
#
#
#
uint32 uiTelegramCount # telegram number
uint32 uiCycleCount # \"scan number\"
uint32 udiSystemCountScan # system time since power on of scan gen. [us]
uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]
uint16 uiInputs # state of digital inputs
uint16 uiOutputs # state of digital outputs

================================================================================
MSG: sick_scan/RadarPreHeaderMeasurementParam1Block
uint32 uiCycleDuration # Time in microseconds to detect this items
uint32 uiNoiseLevel # [1/100dB]

================================================================================
MSG: sick_scan/RadarPreHeaderEncoderBlock
# Array with connected encoder sensors
uint32 udiEncoderPos  # encoder position [inc]
int16 iEncoderSpeed   # encoder speed [inc/mm]
")



(provide :sick_scan/RadarPreHeader "2b96d942f26bd5b00da7e631bf199685")


