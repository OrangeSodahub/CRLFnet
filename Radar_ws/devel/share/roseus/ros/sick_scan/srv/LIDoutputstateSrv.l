;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::LIDoutputstateSrv)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'LIDoutputstateSrv (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::LIDOUTPUTSTATESRV")
  (make-package "SICK_SCAN::LIDOUTPUTSTATESRV"))
(unless (find-package "SICK_SCAN::LIDOUTPUTSTATESRVREQUEST")
  (make-package "SICK_SCAN::LIDOUTPUTSTATESRVREQUEST"))
(unless (find-package "SICK_SCAN::LIDOUTPUTSTATESRVRESPONSE")
  (make-package "SICK_SCAN::LIDOUTPUTSTATESRVRESPONSE"))

(in-package "ROS")





(defclass sick_scan::LIDoutputstateSrvRequest
  :super ros::object
  :slots (_active ))

(defmethod sick_scan::LIDoutputstateSrvRequest
  (:init
   (&key
    ((:active __active) nil)
    )
   (send-super :init)
   (setq _active __active)
   self)
  (:active
   (&optional (__active :null))
   (if (not (eq __active :null)) (setq _active __active)) _active)
  (:serialization-length
   ()
   (+
    ;; bool _active
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _active
       (if _active (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _active
     (setq _active (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sick_scan::LIDoutputstateSrvResponse
  :super ros::object
  :slots (_success ))

(defmethod sick_scan::LIDoutputstateSrvResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sick_scan::LIDoutputstateSrv
  :super ros::object
  :slots ())

(setf (get sick_scan::LIDoutputstateSrv :md5sum-) "83465e5956f4615e09223f5d055d1f12")
(setf (get sick_scan::LIDoutputstateSrv :datatype-) "sick_scan/LIDoutputstateSrv")
(setf (get sick_scan::LIDoutputstateSrv :request) sick_scan::LIDoutputstateSrvRequest)
(setf (get sick_scan::LIDoutputstateSrv :response) sick_scan::LIDoutputstateSrvResponse)

(defmethod sick_scan::LIDoutputstateSrvRequest
  (:response () (instance sick_scan::LIDoutputstateSrvResponse :init)))

(setf (get sick_scan::LIDoutputstateSrvRequest :md5sum-) "83465e5956f4615e09223f5d055d1f12")
(setf (get sick_scan::LIDoutputstateSrvRequest :datatype-) "sick_scan/LIDoutputstateSrvRequest")
(setf (get sick_scan::LIDoutputstateSrvRequest :definition-)
      "# Definition of ROS service LIDoutputstate for sick_scan
# Start or stop Send outputstate by event
# Example call (ROS1):
# rosservice call /sick_tim_7xx/LIDoutputstate \"{active: 1}\"
# 

# 
# Request (input)
# 

bool active # start/stop send outputstate by event

---

# 
# Response (output)
# 

bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)

")

(setf (get sick_scan::LIDoutputstateSrvResponse :md5sum-) "83465e5956f4615e09223f5d055d1f12")
(setf (get sick_scan::LIDoutputstateSrvResponse :datatype-) "sick_scan/LIDoutputstateSrvResponse")
(setf (get sick_scan::LIDoutputstateSrvResponse :definition-)
      "# Definition of ROS service LIDoutputstate for sick_scan
# Start or stop Send outputstate by event
# Example call (ROS1):
# rosservice call /sick_tim_7xx/LIDoutputstate \"{active: 1}\"
# 

# 
# Request (input)
# 

bool active # start/stop send outputstate by event

---

# 
# Response (output)
# 

bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)

")



(provide :sick_scan/LIDoutputstateSrv "83465e5956f4615e09223f5d055d1f12")


