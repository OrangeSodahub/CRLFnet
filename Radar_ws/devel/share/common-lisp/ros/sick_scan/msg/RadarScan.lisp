; Auto-generated. Do not edit!


(cl:in-package sick_scan-msg)


;//! \htmlinclude RadarScan.msg.html

(cl:defclass <RadarScan> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (radarPreHeader
    :reader radarPreHeader
    :initarg :radarPreHeader
    :type sick_scan-msg:RadarPreHeader
    :initform (cl:make-instance 'sick_scan-msg:RadarPreHeader))
   (targets
    :reader targets
    :initarg :targets
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector sick_scan-msg:RadarObject)
   :initform (cl:make-array 0 :element-type 'sick_scan-msg:RadarObject :initial-element (cl:make-instance 'sick_scan-msg:RadarObject))))
)

(cl:defclass RadarScan (<RadarScan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarScan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarScan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sick_scan-msg:<RadarScan> is deprecated: use sick_scan-msg:RadarScan instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:header-val is deprecated.  Use sick_scan-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'radarPreHeader-val :lambda-list '(m))
(cl:defmethod radarPreHeader-val ((m <RadarScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:radarPreHeader-val is deprecated.  Use sick_scan-msg:radarPreHeader instead.")
  (radarPreHeader m))

(cl:ensure-generic-function 'targets-val :lambda-list '(m))
(cl:defmethod targets-val ((m <RadarScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:targets-val is deprecated.  Use sick_scan-msg:targets instead.")
  (targets m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <RadarScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sick_scan-msg:objects-val is deprecated.  Use sick_scan-msg:objects instead.")
  (objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarScan>) ostream)
  "Serializes a message object of type '<RadarScan>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'radarPreHeader) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'targets) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarScan>) istream)
  "Deserializes a message object of type '<RadarScan>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'radarPreHeader) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'targets) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sick_scan-msg:RadarObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarScan>)))
  "Returns string type for a message object of type '<RadarScan>"
  "sick_scan/RadarScan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarScan)))
  "Returns string type for a message object of type 'RadarScan"
  "sick_scan/RadarScan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarScan>)))
  "Returns md5sum for a message object of type '<RadarScan>"
  "db9483dce93673bbf6148baa3d967315")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarScan)))
  "Returns md5sum for a message object of type 'RadarScan"
  "db9483dce93673bbf6148baa3d967315")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarScan>)))
  "Returns full string definition for message of type '<RadarScan>"
  (cl:format cl:nil "#~%# The message is divided into three parts:~%# 1. Header: containing information about general radar parameters~%# 2. RawTargets: List of targets containing maximum values in the range-doppler-matrix - used for tracking~%# 3. Objects: List of objects generated by the internal tracking algorithm - based on raw targets~%Header header~%RadarPreHeader radarPreHeader~%sensor_msgs/PointCloud2 targets~%sick_scan/RadarObject[] objects~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sick_scan/RadarPreHeader~%# Version information for this whole structure (MeasurementData)~%uint16 uiVersionNo~%sick_scan/RadarPreHeaderDeviceBlock radarPreHeaderDeviceBlock~%sick_scan/RadarPreHeaderStatusBlock radarPreHeaderStatusBlock~%sick_scan/RadarPreHeaderMeasurementParam1Block radarPreHeaderMeasurementParam1Block~%sick_scan/RadarPreHeaderEncoderBlock[] radarPreHeaderArrayEncoderBlock~%~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderDeviceBlock~%#~%#~%#~%#~%~%# Logical number of the device\"~%uint32 uiIdent~%# Serial number of the device~%uint32 udiSerialNo~%# State of the device~%bool bDeviceError~%# Contamination Warning~%bool bContaminationWarning~%# Contamination Error~%bool bContaminationError~%================================================================================~%MSG: sick_scan/RadarPreHeaderStatusBlock~%#~%#~%#~%uint32 uiTelegramCount # telegram number~%uint32 uiCycleCount # \"scan number\"~%uint32 udiSystemCountScan # system time since power on of scan gen. [us]~%uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]~%uint16 uiInputs # state of digital inputs~%uint16 uiOutputs # state of digital outputs~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderMeasurementParam1Block~%uint32 uiCycleDuration # Time in microseconds to detect this items~%uint32 uiNoiseLevel # [1/100dB]~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderEncoderBlock~%# Array with connected encoder sensors~%uint32 udiEncoderPos  # encoder position [inc]~%int16 iEncoderSpeed   # encoder speed [inc/mm]~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sick_scan/RadarObject~%int32 id~%~%time tracking_time                          # since when the object is tracked~%time last_seen~%~%geometry_msgs/TwistWithCovariance velocity~%~%geometry_msgs/Pose bounding_box_center~%geometry_msgs/Vector3 bounding_box_size~%~%geometry_msgs/PoseWithCovariance object_box_center~%geometry_msgs/Vector3 object_box_size~%~%geometry_msgs/Point[] contour_points~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarScan)))
  "Returns full string definition for message of type 'RadarScan"
  (cl:format cl:nil "#~%# The message is divided into three parts:~%# 1. Header: containing information about general radar parameters~%# 2. RawTargets: List of targets containing maximum values in the range-doppler-matrix - used for tracking~%# 3. Objects: List of objects generated by the internal tracking algorithm - based on raw targets~%Header header~%RadarPreHeader radarPreHeader~%sensor_msgs/PointCloud2 targets~%sick_scan/RadarObject[] objects~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sick_scan/RadarPreHeader~%# Version information for this whole structure (MeasurementData)~%uint16 uiVersionNo~%sick_scan/RadarPreHeaderDeviceBlock radarPreHeaderDeviceBlock~%sick_scan/RadarPreHeaderStatusBlock radarPreHeaderStatusBlock~%sick_scan/RadarPreHeaderMeasurementParam1Block radarPreHeaderMeasurementParam1Block~%sick_scan/RadarPreHeaderEncoderBlock[] radarPreHeaderArrayEncoderBlock~%~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderDeviceBlock~%#~%#~%#~%#~%~%# Logical number of the device\"~%uint32 uiIdent~%# Serial number of the device~%uint32 udiSerialNo~%# State of the device~%bool bDeviceError~%# Contamination Warning~%bool bContaminationWarning~%# Contamination Error~%bool bContaminationError~%================================================================================~%MSG: sick_scan/RadarPreHeaderStatusBlock~%#~%#~%#~%uint32 uiTelegramCount # telegram number~%uint32 uiCycleCount # \"scan number\"~%uint32 udiSystemCountScan # system time since power on of scan gen. [us]~%uint32 udiSystemCountTransmit # system time since power on of scan transmission [us]~%uint16 uiInputs # state of digital inputs~%uint16 uiOutputs # state of digital outputs~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderMeasurementParam1Block~%uint32 uiCycleDuration # Time in microseconds to detect this items~%uint32 uiNoiseLevel # [1/100dB]~%~%================================================================================~%MSG: sick_scan/RadarPreHeaderEncoderBlock~%# Array with connected encoder sensors~%uint32 udiEncoderPos  # encoder position [inc]~%int16 iEncoderSpeed   # encoder speed [inc/mm]~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sick_scan/RadarObject~%int32 id~%~%time tracking_time                          # since when the object is tracked~%time last_seen~%~%geometry_msgs/TwistWithCovariance velocity~%~%geometry_msgs/Pose bounding_box_center~%geometry_msgs/Vector3 bounding_box_size~%~%geometry_msgs/PoseWithCovariance object_box_center~%geometry_msgs/Vector3 object_box_size~%~%geometry_msgs/Point[] contour_points~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarScan>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'radarPreHeader))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'targets))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarScan>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarScan
    (cl:cons ':header (header msg))
    (cl:cons ':radarPreHeader (radarPreHeader msg))
    (cl:cons ':targets (targets msg))
    (cl:cons ':objects (objects msg))
))
