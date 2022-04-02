
(cl:in-package :asdf)

(defsystem "radar_pa_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "radar_msg" :depends-on ("_package_radar_msg"))
    (:file "_package_radar_msg" :depends-on ("_package"))
    (:file "radar_msg_A" :depends-on ("_package_radar_msg_A"))
    (:file "_package_radar_msg_A" :depends-on ("_package"))
    (:file "radar_msg_B" :depends-on ("_package_radar_msg_B"))
    (:file "_package_radar_msg_B" :depends-on ("_package"))
  ))