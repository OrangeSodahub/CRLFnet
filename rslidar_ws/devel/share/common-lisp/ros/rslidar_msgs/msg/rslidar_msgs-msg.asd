
(cl:in-package :asdf)

(defsystem "rslidar_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "rslidarPacket" :depends-on ("_package_rslidarPacket"))
    (:file "_package_rslidarPacket" :depends-on ("_package"))
    (:file "rslidarScan" :depends-on ("_package_rslidarScan"))
    (:file "_package_rslidarScan" :depends-on ("_package"))
  ))