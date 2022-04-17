
(cl:in-package :asdf)

(defsystem "radar_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MsgObject" :depends-on ("_package_MsgObject"))
    (:file "_package_MsgObject" :depends-on ("_package"))
    (:file "MsgRadar" :depends-on ("_package_MsgRadar"))
    (:file "_package_MsgRadar" :depends-on ("_package"))
  ))