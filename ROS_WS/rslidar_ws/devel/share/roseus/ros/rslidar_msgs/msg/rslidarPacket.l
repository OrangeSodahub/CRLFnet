;; Auto-generated. Do not edit!


(when (boundp 'rslidar_msgs::rslidarPacket)
  (if (not (find-package "RSLIDAR_MSGS"))
    (make-package "RSLIDAR_MSGS"))
  (shadow 'rslidarPacket (find-package "RSLIDAR_MSGS")))
(unless (find-package "RSLIDAR_MSGS::RSLIDARPACKET")
  (make-package "RSLIDAR_MSGS::RSLIDARPACKET"))

(in-package "ROS")
;;//! \htmlinclude rslidarPacket.msg.html


(defclass rslidar_msgs::rslidarPacket
  :super ros::object
  :slots (_stamp _data ))

(defmethod rslidar_msgs::rslidarPacket
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:data __data) (make-array 1248 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _data __data)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; uint8[1248] _data
    (* 1    1248)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; uint8[1248] _data
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[1248] _data
   (setq _data (make-array 1248 :element-type :char))
   (replace _data buf :start2 ptr-) (incf ptr- 1248)
   ;;
   self)
  )

(setf (get rslidar_msgs::rslidarPacket :md5sum-) "1e4288e00b9222ea477b73350bf24f51")
(setf (get rslidar_msgs::rslidarPacket :datatype-) "rslidar_msgs/rslidarPacket")
(setf (get rslidar_msgs::rslidarPacket :definition-)
      "# Raw LIDAR packet.

time stamp              # packet timestamp
uint8[1248] data        # packet contents


")



(provide :rslidar_msgs/rslidarPacket "1e4288e00b9222ea477b73350bf24f51")


