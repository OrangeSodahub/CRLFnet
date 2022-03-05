# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from per_msgs/SensorMsgsRadar.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import per_msgs.msg
import std_msgs.msg

class SensorMsgsRadar(genpy.Message):
  _md5sum = "0c024c9d8ad963f855e814137a581c47"
  _type = "per_msgs/SensorMsgsRadar"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
float32 range  # meters
float32 total_front_esr_tracks
float32 total_front_right_esr_tracks
float32 total_front_left_esr_tracks
float32 front_esr_tracker_counter
float32 front_left_esr_tracker_counter
float32 front_right_esr_tracker_counter
float32 total_rear_sbmp_tracks
float32 rear_sbmp_tracker_counter
float32 rear_sbmp_tracklist
float32 total_fsm4_tracks
float32 fsm4_tracklist
float32 fsm4_tracker_counter
GeometryMsgsRadarObject[] front_esr_tracklist
GeometryMsgsRadarObject[] front_right_esr_tracklist
GeometryMsgsRadarObject[] front_left_esr_tracklist
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: per_msgs/GeometryMsgsRadarObject
Header header
float32 range  # meters
float32 range_rate #velocity
float32 angle_centroid
float32 obj_vcs_posex
float32 obj_vcs_posey
uint8 track_id
"""
  __slots__ = ['header','range','total_front_esr_tracks','total_front_right_esr_tracks','total_front_left_esr_tracks','front_esr_tracker_counter','front_left_esr_tracker_counter','front_right_esr_tracker_counter','total_rear_sbmp_tracks','rear_sbmp_tracker_counter','rear_sbmp_tracklist','total_fsm4_tracks','fsm4_tracklist','fsm4_tracker_counter','front_esr_tracklist','front_right_esr_tracklist','front_left_esr_tracklist']
  _slot_types = ['std_msgs/Header','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','per_msgs/GeometryMsgsRadarObject[]','per_msgs/GeometryMsgsRadarObject[]','per_msgs/GeometryMsgsRadarObject[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,range,total_front_esr_tracks,total_front_right_esr_tracks,total_front_left_esr_tracks,front_esr_tracker_counter,front_left_esr_tracker_counter,front_right_esr_tracker_counter,total_rear_sbmp_tracks,rear_sbmp_tracker_counter,rear_sbmp_tracklist,total_fsm4_tracks,fsm4_tracklist,fsm4_tracker_counter,front_esr_tracklist,front_right_esr_tracklist,front_left_esr_tracklist

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SensorMsgsRadar, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.range is None:
        self.range = 0.
      if self.total_front_esr_tracks is None:
        self.total_front_esr_tracks = 0.
      if self.total_front_right_esr_tracks is None:
        self.total_front_right_esr_tracks = 0.
      if self.total_front_left_esr_tracks is None:
        self.total_front_left_esr_tracks = 0.
      if self.front_esr_tracker_counter is None:
        self.front_esr_tracker_counter = 0.
      if self.front_left_esr_tracker_counter is None:
        self.front_left_esr_tracker_counter = 0.
      if self.front_right_esr_tracker_counter is None:
        self.front_right_esr_tracker_counter = 0.
      if self.total_rear_sbmp_tracks is None:
        self.total_rear_sbmp_tracks = 0.
      if self.rear_sbmp_tracker_counter is None:
        self.rear_sbmp_tracker_counter = 0.
      if self.rear_sbmp_tracklist is None:
        self.rear_sbmp_tracklist = 0.
      if self.total_fsm4_tracks is None:
        self.total_fsm4_tracks = 0.
      if self.fsm4_tracklist is None:
        self.fsm4_tracklist = 0.
      if self.fsm4_tracker_counter is None:
        self.fsm4_tracker_counter = 0.
      if self.front_esr_tracklist is None:
        self.front_esr_tracklist = []
      if self.front_right_esr_tracklist is None:
        self.front_right_esr_tracklist = []
      if self.front_left_esr_tracklist is None:
        self.front_left_esr_tracklist = []
    else:
      self.header = std_msgs.msg.Header()
      self.range = 0.
      self.total_front_esr_tracks = 0.
      self.total_front_right_esr_tracks = 0.
      self.total_front_left_esr_tracks = 0.
      self.front_esr_tracker_counter = 0.
      self.front_left_esr_tracker_counter = 0.
      self.front_right_esr_tracker_counter = 0.
      self.total_rear_sbmp_tracks = 0.
      self.rear_sbmp_tracker_counter = 0.
      self.rear_sbmp_tracklist = 0.
      self.total_fsm4_tracks = 0.
      self.fsm4_tracklist = 0.
      self.fsm4_tracker_counter = 0.
      self.front_esr_tracklist = []
      self.front_right_esr_tracklist = []
      self.front_left_esr_tracklist = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_13f().pack(_x.range, _x.total_front_esr_tracks, _x.total_front_right_esr_tracks, _x.total_front_left_esr_tracks, _x.front_esr_tracker_counter, _x.front_left_esr_tracker_counter, _x.front_right_esr_tracker_counter, _x.total_rear_sbmp_tracks, _x.rear_sbmp_tracker_counter, _x.rear_sbmp_tracklist, _x.total_fsm4_tracks, _x.fsm4_tracklist, _x.fsm4_tracker_counter))
      length = len(self.front_esr_tracklist)
      buff.write(_struct_I.pack(length))
      for val1 in self.front_esr_tracklist:
        _v1 = val1.header
        _x = _v1.seq
        buff.write(_get_struct_I().pack(_x))
        _v2 = _v1.stamp
        _x = _v2
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v1.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_5fB().pack(_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id))
      length = len(self.front_right_esr_tracklist)
      buff.write(_struct_I.pack(length))
      for val1 in self.front_right_esr_tracklist:
        _v3 = val1.header
        _x = _v3.seq
        buff.write(_get_struct_I().pack(_x))
        _v4 = _v3.stamp
        _x = _v4
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v3.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_5fB().pack(_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id))
      length = len(self.front_left_esr_tracklist)
      buff.write(_struct_I.pack(length))
      for val1 in self.front_left_esr_tracklist:
        _v5 = val1.header
        _x = _v5.seq
        buff.write(_get_struct_I().pack(_x))
        _v6 = _v5.stamp
        _x = _v6
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v5.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_5fB().pack(_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.front_esr_tracklist is None:
        self.front_esr_tracklist = None
      if self.front_right_esr_tracklist is None:
        self.front_right_esr_tracklist = None
      if self.front_left_esr_tracklist is None:
        self.front_left_esr_tracklist = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 52
      (_x.range, _x.total_front_esr_tracks, _x.total_front_right_esr_tracks, _x.total_front_left_esr_tracks, _x.front_esr_tracker_counter, _x.front_left_esr_tracker_counter, _x.front_right_esr_tracker_counter, _x.total_rear_sbmp_tracks, _x.rear_sbmp_tracker_counter, _x.rear_sbmp_tracklist, _x.total_fsm4_tracks, _x.fsm4_tracklist, _x.fsm4_tracker_counter,) = _get_struct_13f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.front_esr_tracklist = []
      for i in range(0, length):
        val1 = per_msgs.msg.GeometryMsgsRadarObject()
        _v7 = val1.header
        start = end
        end += 4
        (_v7.seq,) = _get_struct_I().unpack(str[start:end])
        _v8 = _v7.stamp
        _x = _v8
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v7.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          _v7.frame_id = str[start:end]
        _x = val1
        start = end
        end += 21
        (_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id,) = _get_struct_5fB().unpack(str[start:end])
        self.front_esr_tracklist.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.front_right_esr_tracklist = []
      for i in range(0, length):
        val1 = per_msgs.msg.GeometryMsgsRadarObject()
        _v9 = val1.header
        start = end
        end += 4
        (_v9.seq,) = _get_struct_I().unpack(str[start:end])
        _v10 = _v9.stamp
        _x = _v10
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v9.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          _v9.frame_id = str[start:end]
        _x = val1
        start = end
        end += 21
        (_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id,) = _get_struct_5fB().unpack(str[start:end])
        self.front_right_esr_tracklist.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.front_left_esr_tracklist = []
      for i in range(0, length):
        val1 = per_msgs.msg.GeometryMsgsRadarObject()
        _v11 = val1.header
        start = end
        end += 4
        (_v11.seq,) = _get_struct_I().unpack(str[start:end])
        _v12 = _v11.stamp
        _x = _v12
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v11.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          _v11.frame_id = str[start:end]
        _x = val1
        start = end
        end += 21
        (_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id,) = _get_struct_5fB().unpack(str[start:end])
        self.front_left_esr_tracklist.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_13f().pack(_x.range, _x.total_front_esr_tracks, _x.total_front_right_esr_tracks, _x.total_front_left_esr_tracks, _x.front_esr_tracker_counter, _x.front_left_esr_tracker_counter, _x.front_right_esr_tracker_counter, _x.total_rear_sbmp_tracks, _x.rear_sbmp_tracker_counter, _x.rear_sbmp_tracklist, _x.total_fsm4_tracks, _x.fsm4_tracklist, _x.fsm4_tracker_counter))
      length = len(self.front_esr_tracklist)
      buff.write(_struct_I.pack(length))
      for val1 in self.front_esr_tracklist:
        _v13 = val1.header
        _x = _v13.seq
        buff.write(_get_struct_I().pack(_x))
        _v14 = _v13.stamp
        _x = _v14
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v13.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_5fB().pack(_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id))
      length = len(self.front_right_esr_tracklist)
      buff.write(_struct_I.pack(length))
      for val1 in self.front_right_esr_tracklist:
        _v15 = val1.header
        _x = _v15.seq
        buff.write(_get_struct_I().pack(_x))
        _v16 = _v15.stamp
        _x = _v16
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v15.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_5fB().pack(_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id))
      length = len(self.front_left_esr_tracklist)
      buff.write(_struct_I.pack(length))
      for val1 in self.front_left_esr_tracklist:
        _v17 = val1.header
        _x = _v17.seq
        buff.write(_get_struct_I().pack(_x))
        _v18 = _v17.stamp
        _x = _v18
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v17.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_5fB().pack(_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.front_esr_tracklist is None:
        self.front_esr_tracklist = None
      if self.front_right_esr_tracklist is None:
        self.front_right_esr_tracklist = None
      if self.front_left_esr_tracklist is None:
        self.front_left_esr_tracklist = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 52
      (_x.range, _x.total_front_esr_tracks, _x.total_front_right_esr_tracks, _x.total_front_left_esr_tracks, _x.front_esr_tracker_counter, _x.front_left_esr_tracker_counter, _x.front_right_esr_tracker_counter, _x.total_rear_sbmp_tracks, _x.rear_sbmp_tracker_counter, _x.rear_sbmp_tracklist, _x.total_fsm4_tracks, _x.fsm4_tracklist, _x.fsm4_tracker_counter,) = _get_struct_13f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.front_esr_tracklist = []
      for i in range(0, length):
        val1 = per_msgs.msg.GeometryMsgsRadarObject()
        _v19 = val1.header
        start = end
        end += 4
        (_v19.seq,) = _get_struct_I().unpack(str[start:end])
        _v20 = _v19.stamp
        _x = _v20
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v19.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          _v19.frame_id = str[start:end]
        _x = val1
        start = end
        end += 21
        (_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id,) = _get_struct_5fB().unpack(str[start:end])
        self.front_esr_tracklist.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.front_right_esr_tracklist = []
      for i in range(0, length):
        val1 = per_msgs.msg.GeometryMsgsRadarObject()
        _v21 = val1.header
        start = end
        end += 4
        (_v21.seq,) = _get_struct_I().unpack(str[start:end])
        _v22 = _v21.stamp
        _x = _v22
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v21.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          _v21.frame_id = str[start:end]
        _x = val1
        start = end
        end += 21
        (_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id,) = _get_struct_5fB().unpack(str[start:end])
        self.front_right_esr_tracklist.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.front_left_esr_tracklist = []
      for i in range(0, length):
        val1 = per_msgs.msg.GeometryMsgsRadarObject()
        _v23 = val1.header
        start = end
        end += 4
        (_v23.seq,) = _get_struct_I().unpack(str[start:end])
        _v24 = _v23.stamp
        _x = _v24
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v23.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          _v23.frame_id = str[start:end]
        _x = val1
        start = end
        end += 21
        (_x.range, _x.range_rate, _x.angle_centroid, _x.obj_vcs_posex, _x.obj_vcs_posey, _x.track_id,) = _get_struct_5fB().unpack(str[start:end])
        self.front_left_esr_tracklist.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_13f = None
def _get_struct_13f():
    global _struct_13f
    if _struct_13f is None:
        _struct_13f = struct.Struct("<13f")
    return _struct_13f
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_5fB = None
def _get_struct_5fB():
    global _struct_5fB
    if _struct_5fB is None:
        _struct_5fB = struct.Struct("<5fB")
    return _struct_5fB
