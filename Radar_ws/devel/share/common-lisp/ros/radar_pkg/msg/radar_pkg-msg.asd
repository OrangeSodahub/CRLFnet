
(cl:in-package :asdf)

(defsystem "radar_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "radar_msg" :depends-on ("_package_radar_msg"))
    (:file "_package_radar_msg" :depends-on ("_package"))
  ))