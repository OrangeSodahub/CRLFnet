;; Auto-generated. Do not edit!


(when (boundp 'pkg::status)
  (if (not (find-package "PKG"))
    (make-package "PKG"))
  (shadow 'status (find-package "PKG")))
(unless (find-package "PKG::STATUS")
  (make-package "PKG::STATUS"))

(in-package "ROS")
;;//! \htmlinclude status.msg.html


(defclass pkg::status
  :super ros::object
  :slots (_leader _follower1 _follower2 _follower3 _follower4 _formation ))

(defmethod pkg::status
  (:init
   (&key
    ((:leader __leader) "")
    ((:follower1 __follower1) "")
    ((:follower2 __follower2) "")
    ((:follower3 __follower3) "")
    ((:follower4 __follower4) "")
    ((:formation __formation) 0)
    )
   (send-super :init)
   (setq _leader (string __leader))
   (setq _follower1 (string __follower1))
   (setq _follower2 (string __follower2))
   (setq _follower3 (string __follower3))
   (setq _follower4 (string __follower4))
   (setq _formation (round __formation))
   self)
  (:leader
   (&optional __leader)
   (if __leader (setq _leader __leader)) _leader)
  (:follower1
   (&optional __follower1)
   (if __follower1 (setq _follower1 __follower1)) _follower1)
  (:follower2
   (&optional __follower2)
   (if __follower2 (setq _follower2 __follower2)) _follower2)
  (:follower3
   (&optional __follower3)
   (if __follower3 (setq _follower3 __follower3)) _follower3)
  (:follower4
   (&optional __follower4)
   (if __follower4 (setq _follower4 __follower4)) _follower4)
  (:formation
   (&optional __formation)
   (if __formation (setq _formation __formation)) _formation)
  (:serialization-length
   ()
   (+
    ;; string _leader
    4 (length _leader)
    ;; string _follower1
    4 (length _follower1)
    ;; string _follower2
    4 (length _follower2)
    ;; string _follower3
    4 (length _follower3)
    ;; string _follower4
    4 (length _follower4)
    ;; uint8 _formation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _leader
       (write-long (length _leader) s) (princ _leader s)
     ;; string _follower1
       (write-long (length _follower1) s) (princ _follower1 s)
     ;; string _follower2
       (write-long (length _follower2) s) (princ _follower2 s)
     ;; string _follower3
       (write-long (length _follower3) s) (princ _follower3 s)
     ;; string _follower4
       (write-long (length _follower4) s) (princ _follower4 s)
     ;; uint8 _formation
       (write-byte _formation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _leader
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _leader (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _follower1
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _follower1 (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _follower2
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _follower2 (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _follower3
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _follower3 (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _follower4
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _follower4 (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _formation
     (setq _formation (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get pkg::status :md5sum-) "7f786ce8ae9e22085ec0c660926ddd4c")
(setf (get pkg::status :datatype-) "pkg/status")
(setf (get pkg::status :definition-)
      "string leader
string follower1
string follower2
string follower3
string follower4
uint8 formation
")



(provide :pkg/status "7f786ce8ae9e22085ec0c660926ddd4c")


