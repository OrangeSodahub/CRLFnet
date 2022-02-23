;; Auto-generated. Do not edit!


(when (boundp 'per_msgs::GeometryMsgsRadarObject)
  (if (not (find-package "PER_MSGS"))
    (make-package "PER_MSGS"))
  (shadow 'GeometryMsgsRadarObject (find-package "PER_MSGS")))
(unless (find-package "PER_MSGS::GEOMETRYMSGSRADAROBJECT")
  (make-package "PER_MSGS::GEOMETRYMSGSRADAROBJECT"))

(in-package "ROS")
;;//! \htmlinclude GeometryMsgsRadarObject.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass per_msgs::GeometryMsgsRadarObject
  :super ros::object
  :slots (_header _range _range_rate _angle_centroid _obj_vcs_posex _obj_vcs_posey _track_id ))

(defmethod per_msgs::GeometryMsgsRadarObject
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:range __range) 0.0)
    ((:range_rate __range_rate) 0.0)
    ((:angle_centroid __angle_centroid) 0.0)
    ((:obj_vcs_posex __obj_vcs_posex) 0.0)
    ((:obj_vcs_posey __obj_vcs_posey) 0.0)
    ((:track_id __track_id) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _range (float __range))
   (setq _range_rate (float __range_rate))
   (setq _angle_centroid (float __angle_centroid))
   (setq _obj_vcs_posex (float __obj_vcs_posex))
   (setq _obj_vcs_posey (float __obj_vcs_posey))
   (setq _track_id (round __track_id))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:range_rate
   (&optional __range_rate)
   (if __range_rate (setq _range_rate __range_rate)) _range_rate)
  (:angle_centroid
   (&optional __angle_centroid)
   (if __angle_centroid (setq _angle_centroid __angle_centroid)) _angle_centroid)
  (:obj_vcs_posex
   (&optional __obj_vcs_posex)
   (if __obj_vcs_posex (setq _obj_vcs_posex __obj_vcs_posex)) _obj_vcs_posex)
  (:obj_vcs_posey
   (&optional __obj_vcs_posey)
   (if __obj_vcs_posey (setq _obj_vcs_posey __obj_vcs_posey)) _obj_vcs_posey)
  (:track_id
   (&optional __track_id)
   (if __track_id (setq _track_id __track_id)) _track_id)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _range
    4
    ;; float32 _range_rate
    4
    ;; float32 _angle_centroid
    4
    ;; float32 _obj_vcs_posex
    4
    ;; float32 _obj_vcs_posey
    4
    ;; uint32 _track_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _range
       (sys::poke _range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _range_rate
       (sys::poke _range_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle_centroid
       (sys::poke _angle_centroid (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _obj_vcs_posex
       (sys::poke _obj_vcs_posex (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _obj_vcs_posey
       (sys::poke _obj_vcs_posey (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _track_id
       (write-long _track_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _range
     (setq _range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _range_rate
     (setq _range_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle_centroid
     (setq _angle_centroid (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _obj_vcs_posex
     (setq _obj_vcs_posex (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _obj_vcs_posey
     (setq _obj_vcs_posey (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _track_id
     (setq _track_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get per_msgs::GeometryMsgsRadarObject :md5sum-) "f6e9b9d77e2c774b5c49c0eee3fe3bd2")
(setf (get per_msgs::GeometryMsgsRadarObject :datatype-) "per_msgs/GeometryMsgsRadarObject")
(setf (get per_msgs::GeometryMsgsRadarObject :definition-)
      "Header header
float32 range  # meters
float32 range_rate #velocity
float32 angle_centroid
float32 obj_vcs_posex
float32 obj_vcs_posey
uint32 track_id

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



(provide :per_msgs/GeometryMsgsRadarObject "f6e9b9d77e2c774b5c49c0eee3fe3bd2")


