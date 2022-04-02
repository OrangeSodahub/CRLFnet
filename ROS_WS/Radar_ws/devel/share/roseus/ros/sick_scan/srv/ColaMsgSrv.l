;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::ColaMsgSrv)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'ColaMsgSrv (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::COLAMSGSRV")
  (make-package "SICK_SCAN::COLAMSGSRV"))
(unless (find-package "SICK_SCAN::COLAMSGSRVREQUEST")
  (make-package "SICK_SCAN::COLAMSGSRVREQUEST"))
(unless (find-package "SICK_SCAN::COLAMSGSRVRESPONSE")
  (make-package "SICK_SCAN::COLAMSGSRVRESPONSE"))

(in-package "ROS")





(defclass sick_scan::ColaMsgSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod sick_scan::ColaMsgSrvRequest
  (:init
   (&key
    ((:request __request) "")
    )
   (send-super :init)
   (setq _request (string __request))
   self)
  (:request
   (&optional __request)
   (if __request (setq _request __request)) _request)
  (:serialization-length
   ()
   (+
    ;; string _request
    4 (length _request)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _request
       (write-long (length _request) s) (princ _request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _request
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _request (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sick_scan::ColaMsgSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod sick_scan::ColaMsgSrvResponse
  (:init
   (&key
    ((:response __response) "")
    )
   (send-super :init)
   (setq _response (string __response))
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; string _response
    4 (length _response)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _response
       (write-long (length _response) s) (princ _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _response
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _response (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sick_scan::ColaMsgSrv
  :super ros::object
  :slots ())

(setf (get sick_scan::ColaMsgSrv :md5sum-) "33ea4e5aeb30f5913da681ca459d55f3")
(setf (get sick_scan::ColaMsgSrv :datatype-) "sick_scan/ColaMsgSrv")
(setf (get sick_scan::ColaMsgSrv :request) sick_scan::ColaMsgSrvRequest)
(setf (get sick_scan::ColaMsgSrv :response) sick_scan::ColaMsgSrvResponse)

(defmethod sick_scan::ColaMsgSrvRequest
  (:response () (instance sick_scan::ColaMsgSrvResponse :init)))

(setf (get sick_scan::ColaMsgSrvRequest :md5sum-) "33ea4e5aeb30f5913da681ca459d55f3")
(setf (get sick_scan::ColaMsgSrvRequest :datatype-) "sick_scan/ColaMsgSrvRequest")
(setf (get sick_scan::ColaMsgSrvRequest :definition-)
      "# Definition of ROS service ColaMsg for sick_scan
# Send a cola message to the Lidar
# Example call (ROS1):
# rosservice call /sick_tim_7xx/ColaMsg \"{request: 'sEN LIDoutputstate 1'}\"
# 

# 
# Request (input)
# 

string request

---

# 
# Response (output)
# 

string response

")

(setf (get sick_scan::ColaMsgSrvResponse :md5sum-) "33ea4e5aeb30f5913da681ca459d55f3")
(setf (get sick_scan::ColaMsgSrvResponse :datatype-) "sick_scan/ColaMsgSrvResponse")
(setf (get sick_scan::ColaMsgSrvResponse :definition-)
      "# Definition of ROS service ColaMsg for sick_scan
# Send a cola message to the Lidar
# Example call (ROS1):
# rosservice call /sick_tim_7xx/ColaMsg \"{request: 'sEN LIDoutputstate 1'}\"
# 

# 
# Request (input)
# 

string request

---

# 
# Response (output)
# 

string response

")



(provide :sick_scan/ColaMsgSrv "33ea4e5aeb30f5913da681ca459d55f3")


