Header header

# ESR Track Msg
uint16	      xcp_format_version
uint16        scan_index
uint16        tcp_size
uint8         xcp_scan_type
uint16        look_index
uint16        mmr_scan_index
float32         target_report_host_speed
float32         target_report_host_yaw_rate
uint32        xcp_timestamp
uint8         release_revision
uint8         promote_revision
uint8         field_revision
uint8        target_report_count
float32[64]       target_report_range
float32[64]       target_report_range_rate
float32[64]       target_report_theta
float32[64]       target_report_amplitude
