;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::RadarPreHeaderDeviceBlock)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'RadarPreHeaderDeviceBlock (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::RADARPREHEADERDEVICEBLOCK")
  (make-package "SICK_SCAN::RADARPREHEADERDEVICEBLOCK"))

(in-package "ROS")
;;//! \htmlinclude RadarPreHeaderDeviceBlock.msg.html


(defclass sick_scan::RadarPreHeaderDeviceBlock
  :super ros::object
  :slots (_uiIdent _udiSerialNo _bDeviceError _bContaminationWarning _bContaminationError ))

(defmethod sick_scan::RadarPreHeaderDeviceBlock
  (:init
   (&key
    ((:uiIdent __uiIdent) 0)
    ((:udiSerialNo __udiSerialNo) 0)
    ((:bDeviceError __bDeviceError) nil)
    ((:bContaminationWarning __bContaminationWarning) nil)
    ((:bContaminationError __bContaminationError) nil)
    )
   (send-super :init)
   (setq _uiIdent (round __uiIdent))
   (setq _udiSerialNo (round __udiSerialNo))
   (setq _bDeviceError __bDeviceError)
   (setq _bContaminationWarning __bContaminationWarning)
   (setq _bContaminationError __bContaminationError)
   self)
  (:uiIdent
   (&optional __uiIdent)
   (if __uiIdent (setq _uiIdent __uiIdent)) _uiIdent)
  (:udiSerialNo
   (&optional __udiSerialNo)
   (if __udiSerialNo (setq _udiSerialNo __udiSerialNo)) _udiSerialNo)
  (:bDeviceError
   (&optional (__bDeviceError :null))
   (if (not (eq __bDeviceError :null)) (setq _bDeviceError __bDeviceError)) _bDeviceError)
  (:bContaminationWarning
   (&optional (__bContaminationWarning :null))
   (if (not (eq __bContaminationWarning :null)) (setq _bContaminationWarning __bContaminationWarning)) _bContaminationWarning)
  (:bContaminationError
   (&optional (__bContaminationError :null))
   (if (not (eq __bContaminationError :null)) (setq _bContaminationError __bContaminationError)) _bContaminationError)
  (:serialization-length
   ()
   (+
    ;; uint32 _uiIdent
    4
    ;; uint32 _udiSerialNo
    4
    ;; bool _bDeviceError
    1
    ;; bool _bContaminationWarning
    1
    ;; bool _bContaminationError
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _uiIdent
       (write-long _uiIdent s)
     ;; uint32 _udiSerialNo
       (write-long _udiSerialNo s)
     ;; bool _bDeviceError
       (if _bDeviceError (write-byte -1 s) (write-byte 0 s))
     ;; bool _bContaminationWarning
       (if _bContaminationWarning (write-byte -1 s) (write-byte 0 s))
     ;; bool _bContaminationError
       (if _bContaminationError (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _uiIdent
     (setq _uiIdent (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _udiSerialNo
     (setq _udiSerialNo (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _bDeviceError
     (setq _bDeviceError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _bContaminationWarning
     (setq _bContaminationWarning (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _bContaminationError
     (setq _bContaminationError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sick_scan::RadarPreHeaderDeviceBlock :md5sum-) "8c1dc3fa07dfb079c66dfaa39765f5a0")
(setf (get sick_scan::RadarPreHeaderDeviceBlock :datatype-) "sick_scan/RadarPreHeaderDeviceBlock")
(setf (get sick_scan::RadarPreHeaderDeviceBlock :definition-)
      "#
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
")



(provide :sick_scan/RadarPreHeaderDeviceBlock "8c1dc3fa07dfb079c66dfaa39765f5a0")


