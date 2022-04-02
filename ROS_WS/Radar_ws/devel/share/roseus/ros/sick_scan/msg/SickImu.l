;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::SickImu)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'SickImu (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::SICKIMU")
  (make-package "SICK_SCAN::SICKIMU"))

(in-package "ROS")
;;//! \htmlinclude SickImu.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sick_scan::SickImu
  :super ros::object
  :slots (_header _Imu _ticks _quaternion_accuracy _angular_velocity_reliability _linear_acceleration_reliability ))

(defmethod sick_scan::SickImu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Imu __Imu) (instance sensor_msgs::Imu :init))
    ((:ticks __ticks) 0)
    ((:quaternion_accuracy __quaternion_accuracy) 0.0)
    ((:angular_velocity_reliability __angular_velocity_reliability) 0)
    ((:linear_acceleration_reliability __linear_acceleration_reliability) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Imu __Imu)
   (setq _ticks (round __ticks))
   (setq _quaternion_accuracy (float __quaternion_accuracy))
   (setq _angular_velocity_reliability (round __angular_velocity_reliability))
   (setq _linear_acceleration_reliability (round __linear_acceleration_reliability))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:Imu
   (&rest __Imu)
   (if (keywordp (car __Imu))
       (send* _Imu __Imu)
     (progn
       (if __Imu (setq _Imu (car __Imu)))
       _Imu)))
  (:ticks
   (&optional __ticks)
   (if __ticks (setq _ticks __ticks)) _ticks)
  (:quaternion_accuracy
   (&optional __quaternion_accuracy)
   (if __quaternion_accuracy (setq _quaternion_accuracy __quaternion_accuracy)) _quaternion_accuracy)
  (:angular_velocity_reliability
   (&optional __angular_velocity_reliability)
   (if __angular_velocity_reliability (setq _angular_velocity_reliability __angular_velocity_reliability)) _angular_velocity_reliability)
  (:linear_acceleration_reliability
   (&optional __linear_acceleration_reliability)
   (if __linear_acceleration_reliability (setq _linear_acceleration_reliability __linear_acceleration_reliability)) _linear_acceleration_reliability)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/Imu _Imu
    (send _Imu :serialization-length)
    ;; uint32 _ticks
    4
    ;; float32 _quaternion_accuracy
    4
    ;; uint8 _angular_velocity_reliability
    1
    ;; uint8 _linear_acceleration_reliability
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/Imu _Imu
       (send _Imu :serialize s)
     ;; uint32 _ticks
       (write-long _ticks s)
     ;; float32 _quaternion_accuracy
       (sys::poke _quaternion_accuracy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _angular_velocity_reliability
       (write-byte _angular_velocity_reliability s)
     ;; uint8 _linear_acceleration_reliability
       (write-byte _linear_acceleration_reliability s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/Imu _Imu
     (send _Imu :deserialize buf ptr-) (incf ptr- (send _Imu :serialization-length))
   ;; uint32 _ticks
     (setq _ticks (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _quaternion_accuracy
     (setq _quaternion_accuracy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _angular_velocity_reliability
     (setq _angular_velocity_reliability (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _linear_acceleration_reliability
     (setq _linear_acceleration_reliability (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sick_scan::SickImu :md5sum-) "136303711a1d592affd8713883708711")
(setf (get sick_scan::SickImu :datatype-) "sick_scan/SickImu")
(setf (get sick_scan::SickImu :definition-)
      "# This message contains the IMU data of a Sick laser scanner as an IMU message.
# The ticks correspond to the internal time stamps of the laser scanner and increase linearly with time, the tickcounter overflows.
# The quaternion_accuracy has the unit rad.
# The accuracy measures for Lienar acceleration and angular velocity are abitre values, where higher values are better.
# 
#
Header header

sensor_msgs/Imu Imu
#IMU Message

uint32 ticks
# timestamp Ticks from laser scanner

float32 quaternion_accuracy
#quaternion accuracy in rad

uint8 angular_velocity_reliability
#angular velocity reliability 0 low 255 high, value should be over 3

uint8 linear_acceleration_reliability
#linear acceleration reliability 0 low 255 high, value should be over 3

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
MSG: sensor_msgs/Imu
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

geometry_msgs/Quaternion orientation
float64[9] orientation_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance # Row major x, y z 

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :sick_scan/SickImu "136303711a1d592affd8713883708711")


