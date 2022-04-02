;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::RadarObject)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'RadarObject (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::RADAROBJECT")
  (make-package "SICK_SCAN::RADAROBJECT"))

(in-package "ROS")
;;//! \htmlinclude RadarObject.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass sick_scan::RadarObject
  :super ros::object
  :slots (_id _tracking_time _last_seen _velocity _bounding_box_center _bounding_box_size _object_box_center _object_box_size _contour_points ))

(defmethod sick_scan::RadarObject
  (:init
   (&key
    ((:id __id) 0)
    ((:tracking_time __tracking_time) (instance ros::time :init))
    ((:last_seen __last_seen) (instance ros::time :init))
    ((:velocity __velocity) (instance geometry_msgs::TwistWithCovariance :init))
    ((:bounding_box_center __bounding_box_center) (instance geometry_msgs::Pose :init))
    ((:bounding_box_size __bounding_box_size) (instance geometry_msgs::Vector3 :init))
    ((:object_box_center __object_box_center) (instance geometry_msgs::PoseWithCovariance :init))
    ((:object_box_size __object_box_size) (instance geometry_msgs::Vector3 :init))
    ((:contour_points __contour_points) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _tracking_time __tracking_time)
   (setq _last_seen __last_seen)
   (setq _velocity __velocity)
   (setq _bounding_box_center __bounding_box_center)
   (setq _bounding_box_size __bounding_box_size)
   (setq _object_box_center __object_box_center)
   (setq _object_box_size __object_box_size)
   (setq _contour_points __contour_points)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:tracking_time
   (&optional __tracking_time)
   (if __tracking_time (setq _tracking_time __tracking_time)) _tracking_time)
  (:last_seen
   (&optional __last_seen)
   (if __last_seen (setq _last_seen __last_seen)) _last_seen)
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:bounding_box_center
   (&rest __bounding_box_center)
   (if (keywordp (car __bounding_box_center))
       (send* _bounding_box_center __bounding_box_center)
     (progn
       (if __bounding_box_center (setq _bounding_box_center (car __bounding_box_center)))
       _bounding_box_center)))
  (:bounding_box_size
   (&rest __bounding_box_size)
   (if (keywordp (car __bounding_box_size))
       (send* _bounding_box_size __bounding_box_size)
     (progn
       (if __bounding_box_size (setq _bounding_box_size (car __bounding_box_size)))
       _bounding_box_size)))
  (:object_box_center
   (&rest __object_box_center)
   (if (keywordp (car __object_box_center))
       (send* _object_box_center __object_box_center)
     (progn
       (if __object_box_center (setq _object_box_center (car __object_box_center)))
       _object_box_center)))
  (:object_box_size
   (&rest __object_box_size)
   (if (keywordp (car __object_box_size))
       (send* _object_box_size __object_box_size)
     (progn
       (if __object_box_size (setq _object_box_size (car __object_box_size)))
       _object_box_size)))
  (:contour_points
   (&rest __contour_points)
   (if (keywordp (car __contour_points))
       (send* _contour_points __contour_points)
     (progn
       (if __contour_points (setq _contour_points (car __contour_points)))
       _contour_points)))
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; time _tracking_time
    8
    ;; time _last_seen
    8
    ;; geometry_msgs/TwistWithCovariance _velocity
    (send _velocity :serialization-length)
    ;; geometry_msgs/Pose _bounding_box_center
    (send _bounding_box_center :serialization-length)
    ;; geometry_msgs/Vector3 _bounding_box_size
    (send _bounding_box_size :serialization-length)
    ;; geometry_msgs/PoseWithCovariance _object_box_center
    (send _object_box_center :serialization-length)
    ;; geometry_msgs/Vector3 _object_box_size
    (send _object_box_size :serialization-length)
    ;; geometry_msgs/Point[] _contour_points
    (apply #'+ (send-all _contour_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; time _tracking_time
       (write-long (send _tracking_time :sec) s) (write-long (send _tracking_time :nsec) s)
     ;; time _last_seen
       (write-long (send _last_seen :sec) s) (write-long (send _last_seen :nsec) s)
     ;; geometry_msgs/TwistWithCovariance _velocity
       (send _velocity :serialize s)
     ;; geometry_msgs/Pose _bounding_box_center
       (send _bounding_box_center :serialize s)
     ;; geometry_msgs/Vector3 _bounding_box_size
       (send _bounding_box_size :serialize s)
     ;; geometry_msgs/PoseWithCovariance _object_box_center
       (send _object_box_center :serialize s)
     ;; geometry_msgs/Vector3 _object_box_size
       (send _object_box_size :serialize s)
     ;; geometry_msgs/Point[] _contour_points
     (write-long (length _contour_points) s)
     (dolist (elem _contour_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _tracking_time
     (send _tracking_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _tracking_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _last_seen
     (send _last_seen :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_seen :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/TwistWithCovariance _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; geometry_msgs/Pose _bounding_box_center
     (send _bounding_box_center :deserialize buf ptr-) (incf ptr- (send _bounding_box_center :serialization-length))
   ;; geometry_msgs/Vector3 _bounding_box_size
     (send _bounding_box_size :deserialize buf ptr-) (incf ptr- (send _bounding_box_size :serialization-length))
   ;; geometry_msgs/PoseWithCovariance _object_box_center
     (send _object_box_center :deserialize buf ptr-) (incf ptr- (send _object_box_center :serialization-length))
   ;; geometry_msgs/Vector3 _object_box_size
     (send _object_box_size :deserialize buf ptr-) (incf ptr- (send _object_box_size :serialization-length))
   ;; geometry_msgs/Point[] _contour_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _contour_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _contour_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sick_scan::RadarObject :md5sum-) "a5d0f2d250163ffa0098d0fc8218fc4a")
(setf (get sick_scan::RadarObject :datatype-) "sick_scan/RadarObject")
(setf (get sick_scan::RadarObject :definition-)
      "int32 id

time tracking_time                          # since when the object is tracked
time last_seen

geometry_msgs/TwistWithCovariance velocity

geometry_msgs/Pose bounding_box_center
geometry_msgs/Vector3 bounding_box_size

geometry_msgs/PoseWithCovariance object_box_center
geometry_msgs/Vector3 object_box_size

geometry_msgs/Point[] contour_points

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

")



(provide :sick_scan/RadarObject "a5d0f2d250163ffa0098d0fc8218fc4a")


