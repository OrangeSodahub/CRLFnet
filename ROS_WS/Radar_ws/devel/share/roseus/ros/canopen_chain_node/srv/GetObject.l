;; Auto-generated. Do not edit!


(when (boundp 'canopen_chain_node::GetObject)
  (if (not (find-package "CANOPEN_CHAIN_NODE"))
    (make-package "CANOPEN_CHAIN_NODE"))
  (shadow 'GetObject (find-package "CANOPEN_CHAIN_NODE")))
(unless (find-package "CANOPEN_CHAIN_NODE::GETOBJECT")
  (make-package "CANOPEN_CHAIN_NODE::GETOBJECT"))
(unless (find-package "CANOPEN_CHAIN_NODE::GETOBJECTREQUEST")
  (make-package "CANOPEN_CHAIN_NODE::GETOBJECTREQUEST"))
(unless (find-package "CANOPEN_CHAIN_NODE::GETOBJECTRESPONSE")
  (make-package "CANOPEN_CHAIN_NODE::GETOBJECTRESPONSE"))

(in-package "ROS")





(defclass canopen_chain_node::GetObjectRequest
  :super ros::object
  :slots (_node _object _cached ))

(defmethod canopen_chain_node::GetObjectRequest
  (:init
   (&key
    ((:node __node) "")
    ((:object __object) "")
    ((:cached __cached) nil)
    )
   (send-super :init)
   (setq _node (string __node))
   (setq _object (string __object))
   (setq _cached __cached)
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:object
   (&optional __object)
   (if __object (setq _object __object)) _object)
  (:cached
   (&optional (__cached :null))
   (if (not (eq __cached :null)) (setq _cached __cached)) _cached)
  (:serialization-length
   ()
   (+
    ;; string _node
    4 (length _node)
    ;; string _object
    4 (length _object)
    ;; bool _cached
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;; string _object
       (write-long (length _object) s) (princ _object s)
     ;; bool _cached
       (if _cached (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _object
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _cached
     (setq _cached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass canopen_chain_node::GetObjectResponse
  :super ros::object
  :slots (_success _message _value ))

(defmethod canopen_chain_node::GetObjectResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    ((:value __value) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   (setq _value (string __value))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ;; string _value
    4 (length _value)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; string _value
       (write-long (length _value) s) (princ _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass canopen_chain_node::GetObject
  :super ros::object
  :slots ())

(setf (get canopen_chain_node::GetObject :md5sum-) "acdd041126bee1cd6a04a75c17856af5")
(setf (get canopen_chain_node::GetObject :datatype-) "canopen_chain_node/GetObject")
(setf (get canopen_chain_node::GetObject :request) canopen_chain_node::GetObjectRequest)
(setf (get canopen_chain_node::GetObject :response) canopen_chain_node::GetObjectResponse)

(defmethod canopen_chain_node::GetObjectRequest
  (:response () (instance canopen_chain_node::GetObjectResponse :init)))

(setf (get canopen_chain_node::GetObjectRequest :md5sum-) "acdd041126bee1cd6a04a75c17856af5")
(setf (get canopen_chain_node::GetObjectRequest :datatype-) "canopen_chain_node/GetObjectRequest")
(setf (get canopen_chain_node::GetObjectRequest :definition-)
      "string node
string object
bool cached
---
bool success
string message
string value


")

(setf (get canopen_chain_node::GetObjectResponse :md5sum-) "acdd041126bee1cd6a04a75c17856af5")
(setf (get canopen_chain_node::GetObjectResponse :datatype-) "canopen_chain_node/GetObjectResponse")
(setf (get canopen_chain_node::GetObjectResponse :definition-)
      "string node
string object
bool cached
---
bool success
string message
string value


")



(provide :canopen_chain_node/GetObject "acdd041126bee1cd6a04a75c17856af5")


