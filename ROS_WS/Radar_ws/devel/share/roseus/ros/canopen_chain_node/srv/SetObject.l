;; Auto-generated. Do not edit!


(when (boundp 'canopen_chain_node::SetObject)
  (if (not (find-package "CANOPEN_CHAIN_NODE"))
    (make-package "CANOPEN_CHAIN_NODE"))
  (shadow 'SetObject (find-package "CANOPEN_CHAIN_NODE")))
(unless (find-package "CANOPEN_CHAIN_NODE::SETOBJECT")
  (make-package "CANOPEN_CHAIN_NODE::SETOBJECT"))
(unless (find-package "CANOPEN_CHAIN_NODE::SETOBJECTREQUEST")
  (make-package "CANOPEN_CHAIN_NODE::SETOBJECTREQUEST"))
(unless (find-package "CANOPEN_CHAIN_NODE::SETOBJECTRESPONSE")
  (make-package "CANOPEN_CHAIN_NODE::SETOBJECTRESPONSE"))

(in-package "ROS")





(defclass canopen_chain_node::SetObjectRequest
  :super ros::object
  :slots (_node _object _value _cached ))

(defmethod canopen_chain_node::SetObjectRequest
  (:init
   (&key
    ((:node __node) "")
    ((:object __object) "")
    ((:value __value) "")
    ((:cached __cached) nil)
    )
   (send-super :init)
   (setq _node (string __node))
   (setq _object (string __object))
   (setq _value (string __value))
   (setq _cached __cached)
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:object
   (&optional __object)
   (if __object (setq _object __object)) _object)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
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
    ;; string _value
    4 (length _value)
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
     ;; string _value
       (write-long (length _value) s) (princ _value s)
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
   ;; string _value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _cached
     (setq _cached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass canopen_chain_node::SetObjectResponse
  :super ros::object
  :slots (_success _message ))

(defmethod canopen_chain_node::SetObjectResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass canopen_chain_node::SetObject
  :super ros::object
  :slots ())

(setf (get canopen_chain_node::SetObject :md5sum-) "274034f4defad2415049232c96e24954")
(setf (get canopen_chain_node::SetObject :datatype-) "canopen_chain_node/SetObject")
(setf (get canopen_chain_node::SetObject :request) canopen_chain_node::SetObjectRequest)
(setf (get canopen_chain_node::SetObject :response) canopen_chain_node::SetObjectResponse)

(defmethod canopen_chain_node::SetObjectRequest
  (:response () (instance canopen_chain_node::SetObjectResponse :init)))

(setf (get canopen_chain_node::SetObjectRequest :md5sum-) "274034f4defad2415049232c96e24954")
(setf (get canopen_chain_node::SetObjectRequest :datatype-) "canopen_chain_node/SetObjectRequest")
(setf (get canopen_chain_node::SetObjectRequest :definition-)
      "string node
string object
string value
bool cached
---
bool success
string message


")

(setf (get canopen_chain_node::SetObjectResponse :md5sum-) "274034f4defad2415049232c96e24954")
(setf (get canopen_chain_node::SetObjectResponse :datatype-) "canopen_chain_node/SetObjectResponse")
(setf (get canopen_chain_node::SetObjectResponse :definition-)
      "string node
string object
string value
bool cached
---
bool success
string message


")



(provide :canopen_chain_node/SetObject "274034f4defad2415049232c96e24954")


