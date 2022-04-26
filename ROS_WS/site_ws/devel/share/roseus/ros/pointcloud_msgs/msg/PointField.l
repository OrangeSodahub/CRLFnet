;; Auto-generated. Do not edit!


(when (boundp 'pointcloud_msgs::PointField)
  (if (not (find-package "POINTCLOUD_MSGS"))
    (make-package "POINTCLOUD_MSGS"))
  (shadow 'PointField (find-package "POINTCLOUD_MSGS")))
(unless (find-package "POINTCLOUD_MSGS::POINTFIELD")
  (make-package "POINTCLOUD_MSGS::POINTFIELD"))

(in-package "ROS")
;;//! \htmlinclude PointField.msg.html


(intern "*INT8*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*INT8* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*INT8* 1)
(intern "*UINT8*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*UINT8* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*UINT8* 2)
(intern "*INT16*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*INT16* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*INT16* 3)
(intern "*UINT16*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*UINT16* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*UINT16* 4)
(intern "*INT32*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*INT32* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*INT32* 5)
(intern "*UINT32*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*UINT32* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*UINT32* 6)
(intern "*FLOAT32*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*FLOAT32* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*FLOAT32* 7)
(intern "*FLOAT64*" (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(shadow '*FLOAT64* (find-package "POINTCLOUD_MSGS::POINTFIELD"))
(defconstant pointcloud_msgs::PointField::*FLOAT64* 8)

(defun pointcloud_msgs::PointField-to-symbol (const)
  (cond
        ((= const 1) 'pointcloud_msgs::PointField::*INT8*)
        ((= const 2) 'pointcloud_msgs::PointField::*UINT8*)
        ((= const 3) 'pointcloud_msgs::PointField::*INT16*)
        ((= const 4) 'pointcloud_msgs::PointField::*UINT16*)
        ((= const 5) 'pointcloud_msgs::PointField::*INT32*)
        ((= const 6) 'pointcloud_msgs::PointField::*UINT32*)
        ((= const 7) 'pointcloud_msgs::PointField::*FLOAT32*)
        ((= const 8) 'pointcloud_msgs::PointField::*FLOAT64*)
        (t nil)))

(defclass pointcloud_msgs::PointField
  :super ros::object
  :slots (_name _offset _datatype _count ))

(defmethod pointcloud_msgs::PointField
  (:init
   (&key
    ((:name __name) "")
    ((:offset __offset) 0)
    ((:datatype __datatype) 0)
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _offset (round __offset))
   (setq _datatype (round __datatype))
   (setq _count (round __count))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:datatype
   (&optional __datatype)
   (if __datatype (setq _datatype __datatype)) _datatype)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint32 _offset
    4
    ;; uint8 _datatype
    1
    ;; uint32 _count
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint32 _offset
       (write-long _offset s)
     ;; uint8 _datatype
       (write-byte _datatype s)
     ;; uint32 _count
       (write-long _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _offset
     (setq _offset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _datatype
     (setq _datatype (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pointcloud_msgs::PointField :md5sum-) "268eacb2962780ceac86cbd17e328150")
(setf (get pointcloud_msgs::PointField :datatype-) "pointcloud_msgs/PointField")
(setf (get pointcloud_msgs::PointField :definition-)
      "# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
")



(provide :pointcloud_msgs/PointField "268eacb2962780ceac86cbd17e328150")


