
(cl:in-package :asdf)

(defsystem "per_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GeometryMsgsRadarObject" :depends-on ("_package_GeometryMsgsRadarObject"))
    (:file "_package_GeometryMsgsRadarObject" :depends-on ("_package"))
    (:file "SensorMsgsRadar" :depends-on ("_package_SensorMsgsRadar"))
    (:file "_package_SensorMsgsRadar" :depends-on ("_package"))
  ))