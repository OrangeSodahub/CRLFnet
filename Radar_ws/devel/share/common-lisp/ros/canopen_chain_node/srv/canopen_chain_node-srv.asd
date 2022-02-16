
(cl:in-package :asdf)

(defsystem "canopen_chain_node-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetObject" :depends-on ("_package_GetObject"))
    (:file "_package_GetObject" :depends-on ("_package"))
    (:file "SetObject" :depends-on ("_package_SetObject"))
    (:file "_package_SetObject" :depends-on ("_package"))
  ))