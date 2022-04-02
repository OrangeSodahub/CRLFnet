;; Auto-generated. Do not edit!


(when (boundp 'sick_scan::LFErecFieldMsg)
  (if (not (find-package "SICK_SCAN"))
    (make-package "SICK_SCAN"))
  (shadow 'LFErecFieldMsg (find-package "SICK_SCAN")))
(unless (find-package "SICK_SCAN::LFERECFIELDMSG")
  (make-package "SICK_SCAN::LFERECFIELDMSG"))

(in-package "ROS")
;;//! \htmlinclude LFErecFieldMsg.msg.html


(defclass sick_scan::LFErecFieldMsg
  :super ros::object
  :slots (_version_number _field_index _sys_count _dist_scale_factor _dist_scale_offset _angle_scale_factor _angle_scale_offset _field_result_mrs _time_state _year _month _day _hour _minute _second _microsecond ))

(defmethod sick_scan::LFErecFieldMsg
  (:init
   (&key
    ((:version_number __version_number) 0)
    ((:field_index __field_index) 0)
    ((:sys_count __sys_count) 0)
    ((:dist_scale_factor __dist_scale_factor) 0.0)
    ((:dist_scale_offset __dist_scale_offset) 0.0)
    ((:angle_scale_factor __angle_scale_factor) 0)
    ((:angle_scale_offset __angle_scale_offset) 0)
    ((:field_result_mrs __field_result_mrs) 0)
    ((:time_state __time_state) 0)
    ((:year __year) 0)
    ((:month __month) 0)
    ((:day __day) 0)
    ((:hour __hour) 0)
    ((:minute __minute) 0)
    ((:second __second) 0)
    ((:microsecond __microsecond) 0)
    )
   (send-super :init)
   (setq _version_number (round __version_number))
   (setq _field_index (round __field_index))
   (setq _sys_count (round __sys_count))
   (setq _dist_scale_factor (float __dist_scale_factor))
   (setq _dist_scale_offset (float __dist_scale_offset))
   (setq _angle_scale_factor (round __angle_scale_factor))
   (setq _angle_scale_offset (round __angle_scale_offset))
   (setq _field_result_mrs (round __field_result_mrs))
   (setq _time_state (round __time_state))
   (setq _year (round __year))
   (setq _month (round __month))
   (setq _day (round __day))
   (setq _hour (round __hour))
   (setq _minute (round __minute))
   (setq _second (round __second))
   (setq _microsecond (round __microsecond))
   self)
  (:version_number
   (&optional __version_number)
   (if __version_number (setq _version_number __version_number)) _version_number)
  (:field_index
   (&optional __field_index)
   (if __field_index (setq _field_index __field_index)) _field_index)
  (:sys_count
   (&optional __sys_count)
   (if __sys_count (setq _sys_count __sys_count)) _sys_count)
  (:dist_scale_factor
   (&optional __dist_scale_factor)
   (if __dist_scale_factor (setq _dist_scale_factor __dist_scale_factor)) _dist_scale_factor)
  (:dist_scale_offset
   (&optional __dist_scale_offset)
   (if __dist_scale_offset (setq _dist_scale_offset __dist_scale_offset)) _dist_scale_offset)
  (:angle_scale_factor
   (&optional __angle_scale_factor)
   (if __angle_scale_factor (setq _angle_scale_factor __angle_scale_factor)) _angle_scale_factor)
  (:angle_scale_offset
   (&optional __angle_scale_offset)
   (if __angle_scale_offset (setq _angle_scale_offset __angle_scale_offset)) _angle_scale_offset)
  (:field_result_mrs
   (&optional __field_result_mrs)
   (if __field_result_mrs (setq _field_result_mrs __field_result_mrs)) _field_result_mrs)
  (:time_state
   (&optional __time_state)
   (if __time_state (setq _time_state __time_state)) _time_state)
  (:year
   (&optional __year)
   (if __year (setq _year __year)) _year)
  (:month
   (&optional __month)
   (if __month (setq _month __month)) _month)
  (:day
   (&optional __day)
   (if __day (setq _day __day)) _day)
  (:hour
   (&optional __hour)
   (if __hour (setq _hour __hour)) _hour)
  (:minute
   (&optional __minute)
   (if __minute (setq _minute __minute)) _minute)
  (:second
   (&optional __second)
   (if __second (setq _second __second)) _second)
  (:microsecond
   (&optional __microsecond)
   (if __microsecond (setq _microsecond __microsecond)) _microsecond)
  (:serialization-length
   ()
   (+
    ;; uint16 _version_number
    2
    ;; uint8 _field_index
    1
    ;; uint32 _sys_count
    4
    ;; float32 _dist_scale_factor
    4
    ;; float32 _dist_scale_offset
    4
    ;; uint32 _angle_scale_factor
    4
    ;; int32 _angle_scale_offset
    4
    ;; uint8 _field_result_mrs
    1
    ;; uint16 _time_state
    2
    ;; uint16 _year
    2
    ;; uint8 _month
    1
    ;; uint8 _day
    1
    ;; uint8 _hour
    1
    ;; uint8 _minute
    1
    ;; uint8 _second
    1
    ;; uint32 _microsecond
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _version_number
       (write-word _version_number s)
     ;; uint8 _field_index
       (write-byte _field_index s)
     ;; uint32 _sys_count
       (write-long _sys_count s)
     ;; float32 _dist_scale_factor
       (sys::poke _dist_scale_factor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dist_scale_offset
       (sys::poke _dist_scale_offset (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _angle_scale_factor
       (write-long _angle_scale_factor s)
     ;; int32 _angle_scale_offset
       (write-long _angle_scale_offset s)
     ;; uint8 _field_result_mrs
       (write-byte _field_result_mrs s)
     ;; uint16 _time_state
       (write-word _time_state s)
     ;; uint16 _year
       (write-word _year s)
     ;; uint8 _month
       (write-byte _month s)
     ;; uint8 _day
       (write-byte _day s)
     ;; uint8 _hour
       (write-byte _hour s)
     ;; uint8 _minute
       (write-byte _minute s)
     ;; uint8 _second
       (write-byte _second s)
     ;; uint32 _microsecond
       (write-long _microsecond s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _version_number
     (setq _version_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _field_index
     (setq _field_index (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _sys_count
     (setq _sys_count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _dist_scale_factor
     (setq _dist_scale_factor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dist_scale_offset
     (setq _dist_scale_offset (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _angle_scale_factor
     (setq _angle_scale_factor (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _angle_scale_offset
     (setq _angle_scale_offset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _field_result_mrs
     (setq _field_result_mrs (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _time_state
     (setq _time_state (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _year
     (setq _year (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _month
     (setq _month (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _day
     (setq _day (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hour
     (setq _hour (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _minute
     (setq _minute (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _second
     (setq _second (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _microsecond
     (setq _microsecond (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sick_scan::LFErecFieldMsg :md5sum-) "268600f47eb96b8f384e54c8bc6e18f6")
(setf (get sick_scan::LFErecFieldMsg :datatype-) "sick_scan/LFErecFieldMsg")
(setf (get sick_scan::LFErecFieldMsg :definition-)
      "# This message contains a single field of a \"sSN LFErec\" message of a Sick laser scanner as an ros message.
# See https://github.com/SICKAG/libsick_ldmrs/blob/master/src/sopas/LdmrsSopasLayer.cpp lines 1414 ff.
# Field result field_result_mrs is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
# Note: field indices are sorted in reverse order, i.e. with 2 configured fields, we typically have
# output_msg.fields[0].field_index = 1, output_msg.fields[0].field_result_mrs = 0 (invalid)
# output_msg.fields[1].field_index = 2, output_msg.fields[1].field_result_mrs = 1 or 2 (clear=1 or infringed=2)
# output_msg.fields[2].field_index = 3, output_msg.fields[2].field_result_mrs = 1 or 2 (clear=1 or infringed=2)

uint16 version_number
uint8 field_index
uint32 sys_count
float32 dist_scale_factor
float32 dist_scale_offset
uint32 angle_scale_factor
int32 angle_scale_offset
uint8 field_result_mrs # field result is 0 (invalid/incorrect), 1 (free/clear) or 2 (infringed)
# Time block
uint16 time_state  # No time data: 0, Time data: 1
uint16 year        # f.e. 2021
uint8 month        # 1 ... 12
uint8 day          # 1 ... 31
uint8 hour         # 0 ... 23
uint8 minute       # 0 ... 59
uint8 second       # 0 ... 59
uint32 microsecond # 0 ... 999999

")



(provide :sick_scan/LFErecFieldMsg "268600f47eb96b8f384e54c8bc6e18f6")


