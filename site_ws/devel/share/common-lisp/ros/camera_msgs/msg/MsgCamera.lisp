; Auto-generated. Do not edit!


(cl:in-package camera_msgs-msg)


;//! \htmlinclude MsgCamera.msg.html

(cl:defclass <MsgCamera> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (camera
    :reader camera
    :initarg :camera
    :type (cl:vector camera_msgs-msg:MsgObject)
   :initform (cl:make-array 0 :element-type 'camera_msgs-msg:MsgObject :initial-element (cl:make-instance 'camera_msgs-msg:MsgObject))))
)

(cl:defclass MsgCamera (<MsgCamera>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgCamera>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgCamera)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name camera_msgs-msg:<MsgCamera> is deprecated: use camera_msgs-msg:MsgCamera instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MsgCamera>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader camera_msgs-msg:header-val is deprecated.  Use camera_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'camera-val :lambda-list '(m))
(cl:defmethod camera-val ((m <MsgCamera>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader camera_msgs-msg:camera-val is deprecated.  Use camera_msgs-msg:camera instead.")
  (camera m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgCamera>) ostream)
  "Serializes a message object of type '<MsgCamera>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'camera))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'camera))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgCamera>) istream)
  "Deserializes a message object of type '<MsgCamera>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'camera) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'camera)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'camera_msgs-msg:MsgObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgCamera>)))
  "Returns string type for a message object of type '<MsgCamera>"
  "camera_msgs/MsgCamera")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgCamera)))
  "Returns string type for a message object of type 'MsgCamera"
  "camera_msgs/MsgCamera")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgCamera>)))
  "Returns md5sum for a message object of type '<MsgCamera>"
  "3fabcdea7625c1fd8242127e85ce45f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgCamera)))
  "Returns md5sum for a message object of type 'MsgCamera"
  "3fabcdea7625c1fd8242127e85ce45f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgCamera>)))
  "Returns full string definition for message of type '<MsgCamera>"
  (cl:format cl:nil "Header header~%MsgObject[] camera~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: camera_msgs/MsgObject~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgCamera)))
  "Returns full string definition for message of type 'MsgCamera"
  (cl:format cl:nil "Header header~%MsgObject[] camera~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: camera_msgs/MsgObject~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgCamera>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'camera) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgCamera>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgCamera
    (cl:cons ':header (header msg))
    (cl:cons ':camera (camera msg))
))
