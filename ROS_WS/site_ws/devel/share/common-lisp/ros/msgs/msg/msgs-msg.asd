
(cl:in-package :asdf)

(defsystem "msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ListPointCloud" :depends-on ("_package_ListPointCloud"))
    (:file "_package_ListPointCloud" :depends-on ("_package"))
    (:file "MsgCamera" :depends-on ("_package_MsgCamera"))
    (:file "_package_MsgCamera" :depends-on ("_package"))
    (:file "MsgRadar" :depends-on ("_package_MsgRadar"))
    (:file "_package_MsgRadar" :depends-on ("_package"))
    (:file "MsgRadarObject" :depends-on ("_package_MsgRadarObject"))
    (:file "_package_MsgRadarObject" :depends-on ("_package"))
  ))