;; Auto-generated. Do not edit!


(when (boundp 'can_msgs::Frame)
  (if (not (find-package "CAN_MSGS"))
    (make-package "CAN_MSGS"))
  (shadow 'Frame (find-package "CAN_MSGS")))
(unless (find-package "CAN_MSGS::FRAME")
  (make-package "CAN_MSGS::FRAME"))

(in-package "ROS")
;;//! \htmlinclude Frame.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass can_msgs::Frame
  :super ros::object
  :slots (_header _id _is_rtr _is_extended _is_error _dlc _data ))

(defmethod can_msgs::Frame
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:is_rtr __is_rtr) nil)
    ((:is_extended __is_extended) nil)
    ((:is_error __is_error) nil)
    ((:dlc __dlc) 0)
    ((:data __data) (make-array 8 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _is_rtr __is_rtr)
   (setq _is_extended __is_extended)
   (setq _is_error __is_error)
   (setq _dlc (round __dlc))
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:is_rtr
   (&optional (__is_rtr :null))
   (if (not (eq __is_rtr :null)) (setq _is_rtr __is_rtr)) _is_rtr)
  (:is_extended
   (&optional (__is_extended :null))
   (if (not (eq __is_extended :null)) (setq _is_extended __is_extended)) _is_extended)
  (:is_error
   (&optional (__is_error :null))
   (if (not (eq __is_error :null)) (setq _is_error __is_error)) _is_error)
  (:dlc
   (&optional __dlc)
   (if __dlc (setq _dlc __dlc)) _dlc)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _id
    4
    ;; bool _is_rtr
    1
    ;; bool _is_extended
    1
    ;; bool _is_error
    1
    ;; uint8 _dlc
    1
    ;; uint8[8] _data
    (* 1    8)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _id
       (write-long _id s)
     ;; bool _is_rtr
       (if _is_rtr (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_extended
       (if _is_extended (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_error
       (if _is_error (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _dlc
       (write-byte _dlc s)
     ;; uint8[8] _data
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _is_rtr
     (setq _is_rtr (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_extended
     (setq _is_extended (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_error
     (setq _is_error (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _dlc
     (setq _dlc (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[8] _data
   (setq _data (make-array 8 :element-type :char))
   (replace _data buf :start2 ptr-) (incf ptr- 8)
   ;;
   self)
  )

(setf (get can_msgs::Frame :md5sum-) "64ae5cebf967dc6aae4e78f5683a5b25")
(setf (get can_msgs::Frame :datatype-) "can_msgs/Frame")
(setf (get can_msgs::Frame :definition-)
      "Header header
uint32 id
bool is_rtr
bool is_extended
bool is_error
uint8 dlc
uint8[8] data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :can_msgs/Frame "64ae5cebf967dc6aae4e78f5683a5b25")


