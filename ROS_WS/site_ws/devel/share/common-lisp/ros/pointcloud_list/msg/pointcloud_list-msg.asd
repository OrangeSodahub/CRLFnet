
(cl:in-package :asdf)

(defsystem "pointcloud_list-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ListPointCloud" :depends-on ("_package_ListPointCloud"))
    (:file "_package_ListPointCloud" :depends-on ("_package"))
  ))