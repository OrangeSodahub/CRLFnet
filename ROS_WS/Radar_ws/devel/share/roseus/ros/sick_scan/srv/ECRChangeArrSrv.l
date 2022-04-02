;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::ECRChangeArrSrv)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'ECRChangeArrSrv (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::ECRCHANGEARRSRV")
  (make-package "SICK_SCAN::ECRCHANGEARRSRV"))
(unless (find-package "SICK_SCAN::ECRCHANGEARRSRVREQUEST")
  (make-package "SICK_SCAN::ECRCHANGEARRSRVREQUEST"))
(unless (find-package "SICK_SCAN::ECRCHANGEARRSRVRESPONSE")
  (make-package "SICK_SCAN::ECRCHANGEARRSRVRESPONSE"))

(in-package "ROS")





(defclass sick_scan::ECRChangeArrSrvRequest
  :super ros::object
  :slots (_active ))

(defmethod sick_scan::ECRChangeArrSrvRequest
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

(defclass sick_scan::ECRChangeArrSrvResponse
  :super ros::object
  :slots (_success ))

(defmethod sick_scan::ECRChangeArrSrvResponse
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

(defclass sick_scan::ECRChangeArrSrv
  :super ros::object
  :slots ())

(setf (get sick_scan::ECRChangeArrSrv :md5sum-) "83465e5956f4615e09223f5d055d1f12")
(setf (get sick_scan::ECRChangeArrSrv :datatype-) "sick_scan/ECRChangeArrSrv")
(setf (get sick_scan::ECRChangeArrSrv :request) sick_scan::ECRChangeArrSrvRequest)
(setf (get sick_scan::ECRChangeArrSrv :response) sick_scan::ECRChangeArrSrvResponse)

(defmethod sick_scan::ECRChangeArrSrvRequest
  (:response () (instance sick_scan::ECRChangeArrSrvResponse :init)))

(setf (get sick_scan::ECRChangeArrSrvRequest :md5sum-) "83465e5956f4615e09223f5d055d1f12")
(setf (get sick_scan::ECRChangeArrSrvRequest :datatype-) "sick_scan/ECRChangeArrSrvRequest")
(setf (get sick_scan::ECRChangeArrSrvRequest :definition-)
      "# Definition of ROS service ECRChangeArr for sick_scan
# Request status change of monitoring fields on event
# Example call (ROS1):
# rosservice call /sick_tim_7xx/ECRChangeArr \"{active: 1}\"
# 

# 
# Request (input)
# 

bool active # start/stop monitoring for status change events

---

# 
# Response (output)
# 

bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)

")

(setf (get sick_scan::ECRChangeArrSrvResponse :md5sum-) "83465e5956f4615e09223f5d055d1f12")
(setf (get sick_scan::ECRChangeArrSrvResponse :datatype-) "sick_scan/ECRChangeArrSrvResponse")
(setf (get sick_scan::ECRChangeArrSrvResponse :definition-)
      "# Definition of ROS service ECRChangeArr for sick_scan
# Request status change of monitoring fields on event
# Example call (ROS1):
# rosservice call /sick_tim_7xx/ECRChangeArr \"{active: 1}\"
# 

# 
# Request (input)
# 

bool active # start/stop monitoring for status change events

---

# 
# Response (output)
# 

bool success # true: success response received from lidar, false: service failed (timeout or error status from controller)

")



(provide :sick_scan/ECRChangeArrSrv "83465e5956f4615e09223f5d055d1f12")


