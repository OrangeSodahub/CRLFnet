
(cl:in-package :asdf)

(defsystem "pointcloud_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MsgObject" :depends-on ("_package_MsgObject"))
    (:file "_package_MsgObject" :depends-on ("_package"))
    (:file "MsgPointCloud" :depends-on ("_package_MsgPointCloud"))
    (:file "_package_MsgPointCloud" :depends-on ("_package"))
    (:file "PointField" :depends-on ("_package_PointField"))
    (:file "_package_PointField" :depends-on ("_package"))
  ))