# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from delphi_esr_msgs/EsrVehicle3.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class EsrVehicle3(genpy.Message):
  _md5sum = "0833bf12f4f5dda6a3b6915054c197ac"
  _type = "delphi_esr_msgs/EsrVehicle3"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header

# ESR vehicle3
bool        long_accel_valid
bool        lat_accel_valid
float32     lat_accel
float32     long_accel
uint8       radar_fov_lr
uint8       radar_fov_mr
bool        auto_align_disable
uint8       radar_height
bool        serv_align_type
bool        serv_align_enable
uint16      align_avg_ctr_total
bool        auto_align_converged
uint8       wheel_slip
uint8       serv_align_updates_need
int8        angle_mounting_offset


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
"""
  __slots__ = ['header','long_accel_valid','lat_accel_valid','lat_accel','long_accel','radar_fov_lr','radar_fov_mr','auto_align_disable','radar_height','serv_align_type','serv_align_enable','align_avg_ctr_total','auto_align_converged','wheel_slip','serv_align_updates_need','angle_mounting_offset']
  _slot_types = ['std_msgs/Header','bool','bool','float32','float32','uint8','uint8','bool','uint8','bool','bool','uint16','bool','uint8','uint8','int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,long_accel_valid,lat_accel_valid,lat_accel,long_accel,radar_fov_lr,radar_fov_mr,auto_align_disable,radar_height,serv_align_type,serv_align_enable,align_avg_ctr_total,auto_align_converged,wheel_slip,serv_align_updates_need,angle_mounting_offset

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(EsrVehicle3, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.long_accel_valid is None:
        self.long_accel_valid = False
      if self.lat_accel_valid is None:
        self.lat_accel_valid = False
      if self.lat_accel is None:
        self.lat_accel = 0.
      if self.long_accel is None:
        self.long_accel = 0.
      if self.radar_fov_lr is None:
        self.radar_fov_lr = 0
      if self.radar_fov_mr is None:
        self.radar_fov_mr = 0
      if self.auto_align_disable is None:
        self.auto_align_disable = False
      if self.radar_height is None:
        self.radar_height = 0
      if self.serv_align_type is None:
        self.serv_align_type = False
      if self.serv_align_enable is None:
        self.serv_align_enable = False
      if self.align_avg_ctr_total is None:
        self.align_avg_ctr_total = 0
      if self.auto_align_converged is None:
        self.auto_align_converged = False
      if self.wheel_slip is None:
        self.wheel_slip = 0
      if self.serv_align_updates_need is None:
        self.serv_align_updates_need = 0
      if self.angle_mounting_offset is None:
        self.angle_mounting_offset = 0
    else:
      self.header = std_msgs.msg.Header()
      self.long_accel_valid = False
      self.lat_accel_valid = False
      self.lat_accel = 0.
      self.long_accel = 0.
      self.radar_fov_lr = 0
      self.radar_fov_mr = 0
      self.auto_align_disable = False
      self.radar_height = 0
      self.serv_align_type = False
      self.serv_align_enable = False
      self.align_avg_ctr_total = 0
      self.auto_align_converged = False
      self.wheel_slip = 0
      self.serv_align_updates_need = 0
      self.angle_mounting_offset = 0

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
      buff.write(_get_struct_2B2f6BH3Bb().pack(_x.long_accel_valid, _x.lat_accel_valid, _x.lat_accel, _x.long_accel, _x.radar_fov_lr, _x.radar_fov_mr, _x.auto_align_disable, _x.radar_height, _x.serv_align_type, _x.serv_align_enable, _x.align_avg_ctr_total, _x.auto_align_converged, _x.wheel_slip, _x.serv_align_updates_need, _x.angle_mounting_offset))
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
      end += 22
      (_x.long_accel_valid, _x.lat_accel_valid, _x.lat_accel, _x.long_accel, _x.radar_fov_lr, _x.radar_fov_mr, _x.auto_align_disable, _x.radar_height, _x.serv_align_type, _x.serv_align_enable, _x.align_avg_ctr_total, _x.auto_align_converged, _x.wheel_slip, _x.serv_align_updates_need, _x.angle_mounting_offset,) = _get_struct_2B2f6BH3Bb().unpack(str[start:end])
      self.long_accel_valid = bool(self.long_accel_valid)
      self.lat_accel_valid = bool(self.lat_accel_valid)
      self.auto_align_disable = bool(self.auto_align_disable)
      self.serv_align_type = bool(self.serv_align_type)
      self.serv_align_enable = bool(self.serv_align_enable)
      self.auto_align_converged = bool(self.auto_align_converged)
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
      buff.write(_get_struct_2B2f6BH3Bb().pack(_x.long_accel_valid, _x.lat_accel_valid, _x.lat_accel, _x.long_accel, _x.radar_fov_lr, _x.radar_fov_mr, _x.auto_align_disable, _x.radar_height, _x.serv_align_type, _x.serv_align_enable, _x.align_avg_ctr_total, _x.auto_align_converged, _x.wheel_slip, _x.serv_align_updates_need, _x.angle_mounting_offset))
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
      end += 22
      (_x.long_accel_valid, _x.lat_accel_valid, _x.lat_accel, _x.long_accel, _x.radar_fov_lr, _x.radar_fov_mr, _x.auto_align_disable, _x.radar_height, _x.serv_align_type, _x.serv_align_enable, _x.align_avg_ctr_total, _x.auto_align_converged, _x.wheel_slip, _x.serv_align_updates_need, _x.angle_mounting_offset,) = _get_struct_2B2f6BH3Bb().unpack(str[start:end])
      self.long_accel_valid = bool(self.long_accel_valid)
      self.lat_accel_valid = bool(self.lat_accel_valid)
      self.auto_align_disable = bool(self.auto_align_disable)
      self.serv_align_type = bool(self.serv_align_type)
      self.serv_align_enable = bool(self.serv_align_enable)
      self.auto_align_converged = bool(self.auto_align_converged)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2B2f6BH3Bb = None
def _get_struct_2B2f6BH3Bb():
    global _struct_2B2f6BH3Bb
    if _struct_2B2f6BH3Bb is None:
        _struct_2B2f6BH3Bb = struct.Struct("<2B2f6BH3Bb")
    return _struct_2B2f6BH3Bb
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
