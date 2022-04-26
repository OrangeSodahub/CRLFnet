
(cl:in-package :asdf)

(defsystem "camera_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MsgCamera" :depends-on ("_package_MsgCamera"))
    (:file "_package_MsgCamera" :depends-on ("_package"))
  ))