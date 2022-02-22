## *********************************************************
##
## File autogenerated for the sick_scan package
## by the dynamic_reconfigure package.
## Please do not edit.
##
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'name': 'Default', 'type': '', 'state': True, 'cstate': 'true', 'id': 0, 'parent': 0, 'parameters': [{'name': 'min_ang', 'type': 'double', 'default': -3.141592653589793, 'level': 0, 'description': 'The angle of the first range measurement [rad].', 'min': -6.283185307179586, 'max': 6.283185307179586, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'max_ang', 'type': 'double', 'default': 3.141592653589793, 'level': 0, 'description': 'The angle of the last range measurement [rad].', 'min': -6.283185307179586, 'max': 6.283185307179586, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'intensity', 'type': 'bool', 'default': True, 'level': 0, 'description': 'Whether or not to return intensity values.    ', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'intensity_resolution_16bit', 'type': 'bool', 'default': True, 'level': 0, 'description': 'True = 16Bit False = 8Bit.    ', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'skip', 'type': 'int', 'default': 0, 'level': 0, 'description': 'The number of scans to skip between each measured scan.', 'min': 0, 'max': 9, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'frame_id', 'type': 'str', 'default': 'laser', 'level': 0, 'description': 'The TF frame in which laser scans will be returned.', 'min': '', 'max': '', 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'std::string', 'cconsttype': 'const char * const'}, {'name': 'imu_frame_id', 'type': 'str', 'default': 'imu_link', 'level': 0, 'description': 'The TF frame in which imu_data will be returned.', 'min': '', 'max': '', 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'std::string', 'cconsttype': 'const char * const'}, {'name': 'time_offset', 'type': 'double', 'default': -0.0, 'level': 0, 'description': 'An offset to add to the time stamp before publication of a scan [s].', 'min': -0.25, 'max': 0.25, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'sw_pll_only_publish', 'type': 'bool', 'default': False, 'level': 0, 'description': 'Publishes datagrams only if the software time synchronization is locked. This prevents leaps in the scan timestamps.', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'auto_reboot', 'type': 'bool', 'default': True, 'level': 0, 'description': 'Whether or not to reboot laser if it reports an error.', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'filter_echos', 'type': 'int', 'default': 1, 'level': 0, 'description': 'Bitmask to filter first [0], all [1], or last echos [2]', 'min': 0, 'max': 2, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'powerOnCount', 'type': 'int', 'default': 0, 'level': 0, 'description': 'Read only Power On counter at start up.', 'min': 0, 'max': 65536, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'operationHours', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'Read only operationg hours [h].', 'min': 0.0, 'max': 6553.6, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'locationName', 'type': 'str', 'default': '', 'level': 0, 'description': 'Device Location Name', 'min': '', 'max': '', 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'std::string', 'cconsttype': 'const char * const'}, {'name': 'timelimit', 'type': 'double', 'default': 5.0, 'level': 0, 'description': 'Network time limit for datagram request [sec].', 'min': 0.1, 'max': 100.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'cloud_output_mode', 'type': 'int', 'default': 0, 'level': 0, 'description': '[0] Pointcloud is dense all layers in one cloud,[1] Each layer in its own cloud message to improve timestamp accuracy,[2] layers are split to achieve approx. 1 KHz data rate', 'min': 0, 'max': 2, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'ang_res', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'Angular resolution in deg/scan set to 0 to use scanner default', 'min': 0.0, 'max': 10.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'scan_freq', 'type': 'double', 'default': 0.0, 'level': 0, 'description': 'Scan frequency set to 0 to use scanner default', 'min': 0.0, 'max': 100.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'encoder_mode', 'type': 'int', 'default': -1, 'level': 0, 'description': '-1:No Encoder, 0:Off, 1:Single increment, 2:Direction Phase, 3:Direction Level', 'min': -1, 'max': 3, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}], 'groups': [], 'srcline': 246, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'class': 'DEFAULT', 'parentclass': '', 'parentname': 'Default', 'field': 'default', 'upper': 'DEFAULT', 'lower': 'groups'}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

