
(cl:in-package :asdf)

(defsystem "sick_scan-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ColaMsgSrv" :depends-on ("_package_ColaMsgSrv"))
    (:file "_package_ColaMsgSrv" :depends-on ("_package"))
    (:file "ECRChangeArrSrv" :depends-on ("_package_ECRChangeArrSrv"))
    (:file "_package_ECRChangeArrSrv" :depends-on ("_package"))
    (:file "LIDoutputstateSrv" :depends-on ("_package_LIDoutputstateSrv"))
    (:file "_package_LIDoutputstateSrv" :depends-on ("_package"))
  ))