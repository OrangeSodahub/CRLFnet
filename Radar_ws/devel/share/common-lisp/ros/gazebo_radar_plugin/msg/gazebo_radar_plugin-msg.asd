
(cl:in-package :asdf)

(defsystem "gazebo_radar_plugin-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ModeCRadar" :depends-on ("_package_ModeCRadar"))
    (:file "_package_ModeCRadar" :depends-on ("_package"))
    (:file "ModeCRadarSummary" :depends-on ("_package_ModeCRadarSummary"))
    (:file "_package_ModeCRadarSummary" :depends-on ("_package"))
  ))