;; Auto-generated. Do not edit!


(when (boundp 'camera_msgs::MsgCamera)
  (if (not (find-package "CAMERA_MSGS"))
    (make-package "CAMERA_MSGS"))
  (shadow 'MsgCamera (find-package "CAMERA_MSGS")))
(unless (find-package "CAMERA_MSGS::MSGCAMERA")
  (make-package "CAMERA_MSGS::MSGCAMERA"))

(in-package "ROS")
;;//! \htmlinclude MsgCamera.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass camera_msgs::MsgCamera
  :super ros::object
  :slots (_header _camera11 _camera12 _camera13 _camera14 _camera41 _camera42 _camera43 _camera44 ))

(defmethod camera_msgs::MsgCamera
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:camera11 __camera11) ())
    ((:camera12 __camera12) ())
    ((:camera13 __camera13) ())
    ((:camera14 __camera14) ())
    ((:camera41 __camera41) ())
    ((:camera42 __camera42) ())
    ((:camera43 __camera43) ())
    ((:camera44 __camera44) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _camera11 __camera11)
   (setq _camera12 __camera12)
   (setq _camera13 __camera13)
   (setq _camera14 __camera14)
   (setq _camera41 __camera41)
   (setq _camera42 __camera42)
   (setq _camera43 __camera43)
   (setq _camera44 __camera44)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:camera11
   (&rest __camera11)
   (if (keywordp (car __camera11))
       (send* _camera11 __camera11)
     (progn
       (if __camera11 (setq _camera11 (car __camera11)))
       _camera11)))
  (:camera12
   (&rest __camera12)
   (if (keywordp (car __camera12))
       (send* _camera12 __camera12)
     (progn
       (if __camera12 (setq _camera12 (car __camera12)))
       _camera12)))
  (:camera13
   (&rest __camera13)
   (if (keywordp (car __camera13))
       (send* _camera13 __camera13)
     (progn
       (if __camera13 (setq _camera13 (car __camera13)))
       _camera13)))
  (:camera14
   (&rest __camera14)
   (if (keywordp (car __camera14))
       (send* _camera14 __camera14)
     (progn
       (if __camera14 (setq _camera14 (car __camera14)))
       _camera14)))
  (:camera41
   (&rest __camera41)
   (if (keywordp (car __camera41))
       (send* _camera41 __camera41)
     (progn
       (if __camera41 (setq _camera41 (car __camera41)))
       _camera41)))
  (:camera42
   (&rest __camera42)
   (if (keywordp (car __camera42))
       (send* _camera42 __camera42)
     (progn
       (if __camera42 (setq _camera42 (car __camera42)))
       _camera42)))
  (:camera43
   (&rest __camera43)
   (if (keywordp (car __camera43))
       (send* _camera43 __camera43)
     (progn
       (if __camera43 (setq _camera43 (car __camera43)))
       _camera43)))
  (:camera44
   (&rest __camera44)
   (if (keywordp (car __camera44))
       (send* _camera44 __camera44)
     (progn
       (if __camera44 (setq _camera44 (car __camera44)))
       _camera44)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; camera_msgs/MsgObject[] _camera11
    (apply #'+ (send-all _camera11 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera12
    (apply #'+ (send-all _camera12 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera13
    (apply #'+ (send-all _camera13 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera14
    (apply #'+ (send-all _camera14 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera41
    (apply #'+ (send-all _camera41 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera42
    (apply #'+ (send-all _camera42 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera43
    (apply #'+ (send-all _camera43 :serialization-length)) 4
    ;; camera_msgs/MsgObject[] _camera44
    (apply #'+ (send-all _camera44 :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; camera_msgs/MsgObject[] _camera11
     (write-long (length _camera11) s)
     (dolist (elem _camera11)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera12
     (write-long (length _camera12) s)
     (dolist (elem _camera12)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera13
     (write-long (length _camera13) s)
     (dolist (elem _camera13)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera14
     (write-long (length _camera14) s)
     (dolist (elem _camera14)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera41
     (write-long (length _camera41) s)
     (dolist (elem _camera41)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera42
     (write-long (length _camera42) s)
     (dolist (elem _camera42)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera43
     (write-long (length _camera43) s)
     (dolist (elem _camera43)
       (send elem :serialize s)
       )
     ;; camera_msgs/MsgObject[] _camera44
     (write-long (length _camera44) s)
     (dolist (elem _camera44)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; camera_msgs/MsgObject[] _camera11
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera11 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera11)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera12
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera12 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera12)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera13
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera13 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera13)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera14
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera14 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera14)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera41
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera41 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera41)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera42
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera42 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera42)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera43
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera43 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera43)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; camera_msgs/MsgObject[] _camera44
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _camera44 (let (r) (dotimes (i n) (push (instance camera_msgs::MsgObject :init) r)) r))
     (dolist (elem- _camera44)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get camera_msgs::MsgCamera :md5sum-) "88f6649107b59053b7d1e61aca764255")
(setf (get camera_msgs::MsgCamera :datatype-) "camera_msgs/MsgCamera")
(setf (get camera_msgs::MsgCamera :definition-)
      "Header header
MsgObject[] camera11
MsgObject[] camera12
MsgObject[] camera13
MsgObject[] camera14
MsgObject[] camera41
MsgObject[] camera42
MsgObject[] camera43
MsgObject[] camera44

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

================================================================================
MSG: camera_msgs/MsgObject
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)
")



(provide :camera_msgs/MsgCamera "88f6649107b59053b7d1e61aca764255")


