; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarObject.msg.html

(cl:defclass <RadarObject> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (tracking_time
    :reader tracking_time
    :initarg :tracking_time
    :type cl:real
    :initform 0)
   (last_seen
    :reader last_seen
    :initarg :last_seen
    :type cl:real
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:TwistWithCovariance
    :initform (cl:make-instance 'geometry_msgs-msg:TwistWithCovariance))
   (bounding_box_center
    :reader bounding_box_center
    :initarg :bounding_box_center
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (bounding_box_size
    :reader bounding_box_size
    :initarg :bounding_box_size
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (object_box_center
    :reader object_box_center
    :initarg :object_box_center
    :type geometry_msgs-msg:PoseWithCovariance
    :initform (cl:make-instance 'geometry_msgs-msg:PoseWithCovariance))
   (object_box_size
    :reader object_box_size
    :initarg :object_box_size
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (contour_points
    :reader contour_points
    :initarg :contour_points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass RadarObject (<RadarObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarObject> is deprecated: use sick_scan-msg:RadarObject instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:id-val is deprecated.  Use sick_scan-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'tracking_time-val :lambda-list '(m))
(cl:defmethod tracking_time-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:tracking_time-val is deprecated.  Use sick_scan-msg:tracking_time instead.")
  (tracking_time m))

(cl:ensure-generic-function 'last_seen-val :lambda-list '(m))
(cl:defmethod last_seen-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:last_seen-val is deprecated.  Use sick_scan-msg:last_seen instead.")
  (last_seen m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:velocity-val is deprecated.  Use sick_scan-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'bounding_box_center-val :lambda-list '(m))
(cl:defmethod bounding_box_center-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:bounding_box_center-val is deprecated.  Use sick_scan-msg:bounding_box_center instead.")
  (bounding_box_center m))

(cl:ensure-generic-function 'bounding_box_size-val :lambda-list '(m))
(cl:defmethod bounding_box_size-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:bounding_box_size-val is deprecated.  Use sick_scan-msg:bounding_box_size instead.")
  (bounding_box_size m))

(cl:ensure-generic-function 'object_box_center-val :lambda-list '(m))
(cl:defmethod object_box_center-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:object_box_center-val is deprecated.  Use sick_scan-msg:object_box_center instead.")
  (object_box_center m))

(cl:ensure-generic-function 'object_box_size-val :lambda-list '(m))
(cl:defmethod object_box_size-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:object_box_size-val is deprecated.  Use sick_scan-msg:object_box_size instead.")
  (object_box_size m))

(cl:ensure-generic-function 'contour_points-val :lambda-list '(m))
(cl:defmethod contour_points-val ((m <RadarObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:contour_points-val is deprecated.  Use sick_scan-msg:contour_points instead.")
  (contour_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarObject>) ostream)
  "Serializes a message object of type '<RadarObject>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'tracking_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'tracking_time) (cl:floor (cl:slot-value msg 'tracking_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'last_seen)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'last_seen) (cl:floor (cl:slot-value msg 'last_seen)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bounding_box_center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bounding_box_size) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_box_center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_box_size) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'contour_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'contour_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarObject>) istream)
  "Deserializes a message object of type '<RadarObject>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tracking_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'last_seen) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bounding_box_center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bounding_box_size) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_box_center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_box_size) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'contour_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'contour_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarObject>)))
  "Returns string type for a message object of type '<RadarObject>"
  "sick_scan/RadarObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarObject)))
  "Returns string type for a message object of type 'RadarObject"
  "sick_scan/RadarObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarObject>)))
  "Returns md5sum for a message object of type '<RadarObject>"
  "a5d0f2d250163ffa0098d0fc8218fc4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarObject)))
  "Returns md5sum for a message object of type 'RadarObject"
  "a5d0f2d250163ffa0098d0fc8218fc4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarObject>)))
  "Returns full string definition for message of type '<RadarObject>"
  (cl:format cl:nil "int32 id~%~%time tracking_time                          # since when the object is tracked~%time last_seen~%~%geometry_msgs/TwistWithCovariance velocity~%~%geometry_msgs/Pose bounding_box_center~%geometry_msgs/Vector3 bounding_box_size~%~%geometry_msgs/PoseWithCovariance object_box_center~%geometry_msgs/Vector3 object_box_size~%~%geometry_msgs/Point[] contour_points~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarObject)))
  "Returns full string definition for message of type 'RadarObject"
  (cl:format cl:nil "int32 id~%~%time tracking_time                          # since when the object is tracked~%time last_seen~%~%geometry_msgs/TwistWithCovariance velocity~%~%geometry_msgs/Pose bounding_box_center~%geometry_msgs/Vector3 bounding_box_size~%~%geometry_msgs/PoseWithCovariance object_box_center~%geometry_msgs/Vector3 object_box_size~%~%geometry_msgs/Point[] contour_points~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarObject>))
  (cl:+ 0
     4
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bounding_box_center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bounding_box_size))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_box_center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_box_size))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'contour_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarObject>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarObject
    (cl:cons ':id (id msg))
    (cl:cons ':tracking_time (tracking_time msg))
    (cl:cons ':last_seen (last_seen msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':bounding_box_center (bounding_box_center msg))
    (cl:cons ':bounding_box_size (bounding_box_size msg))
    (cl:cons ':object_box_center (object_box_center msg))
    (cl:cons ':object_box_size (object_box_size msg))
    (cl:cons ':contour_points (contour_points msg))
))
