## AVI Cloud Variables
variable "avi_controller" { 
  description = "FQDN or IP address of Controller to Authenicate"
  type = string
  default = ""
}
variable "avi_username" { 
  description = "Default User Account"
  type = string
  default = ""
}
variable "avi_password" { 
  description = "Password for Default User Account"
  type = string
  default = ""
}
variable "avi_cloud_name_nsx" { 
  description = "AVI Cloud Name NSX Cloud"
  type = string
  default = ""
}
variable "avi_cloud_type_nsx" { 
  description = "AVI Cloud Type, Can be: NSX-T, vCenter, OpenStack, AWS, Linux Server, AZURE, Google"
  type = string
  default = "CLOUD_NSXT"
}
variable "obj_name_prefix_nsx" { 
  description = "Service Engine Prefix Name"
  type = string
  default = ""
}

variable "avi_se_mgmt_network_mask" { 
  description = "AVI Service Enginer Managment Network submask"
  type = string
  default = ""
}

## AVI Account Creation for vCenter and NSX
variable "avi_vcenter_cred_name" { 
  description = "AVI vCenter Credentials for Cloud"
  type = string
  default = ""
}
variable "avi_nsxt_cred_name" { 
  description = "AVI NSX-T Credentials for Cloud"
  type = string
  default = ""
}

## AVI Service Engine Variables
variable "segroup_nsx_name" { 
  description = "Service Engine Group Name NSX"
  type = string
  default = ""
}
variable "se_name_prefix_nsx" { 
  description = "Service Engine Prefix name attached to each Service Engine to overwrite name on nsx_cloud"
  type = string
  default = ""
}
variable "max_vs_per_se" { 
  description = "Maximum Virtual Services per Service Engine default 10"
  type = string
  default = "10"
}
variable "min_scaleout_per_vs" { 
  description = "Minmum scale out per Virtual Services default 2"
  type = string
  default = "2"
}
variable "vcpus_per_se" { 
  description = "vCPU per Service Engine Default 1"
  type = string
  default = "1"
}
variable "memory_per_se" { 
  description = "Memory per Service Engine Default 2048mb"
  type = string
  default = "2048"
}
variable "ha_mode" { 
  description = "High Availiblity on Service Engine Options: HA_MODE_SHARED - N + M (buffer) - default, HA_MODE_SHARED_PAIR - Active/Active, A_MODE_LEGACY_ACTIVE_STANDBY - Legacy"
  type = string
  default = ""
}
variable "algo" { 
  description = "Algo mode that can be selected: PLACEMENT_ALGO_DISTRIBUTED - ha_mode: A_MODE_LEGACY_ACTIVE_STANDBY - Legacy, A_MODE_SHARED_PAIR, PLACEMENT_ALGO_PACKED, HA_MODE_SHARED"
  type = string
  default = ""
}
variable "distribute_load_active_standby_false" { 
  description = "Only change true, if you choice ha_mode A_MODE_LEGACY_ACTIVE_STANDBY and want SE placement to be distributed"
  type = string
  default = "false"
}
variable "auto_redistribute_active_standby_load" { 
  description = "Only change true, if you choice ha_mode A_MODE_LEGACY_ACTIVE_STANDBY and want SE placement to be Auto-redistribute"
  type = string
  default = "false"
}
variable "se_dp_max_hb_version" { 
  description = "Range is between 1-2"
  type = string
  default = "2"
}
variable "disk_per_se" { 
  description = "Disk Space of Service Engine Default 15gb"
  type = string
  default = "15"
}

## AVI Template Profile Names
variable "ipam_name_nsx" { 
  description = "IPAM Profile Name to attach to Cloud"
  type = string
  default = ""
}
variable "dns_profile_name_nsx" { 
  description = "DNS Profile Name to attach to Cloud"
  type = string
  default = ""
}
variable "dns_domain_name" { 
  description = "DNS Search Zone"
  type = string
  default = ""
}

## NSX variables
variable "nsx_user" { 
  description = "NSX User to Authenicate with"
  type = string
  default =  ""
}
variable "nsx_password" { 
  description = "NSX Password for User above"
  type = string
  default =  ""
}
variable "nsx_address" { 
  description = "FQDN or IP Address of NSX-T VIP or Manager"
  type = string
  default =  ""
}
variable "overlay_tz" {
  description = "Overlay Transport Zone for Segments"
  type = string
  default = ""
}
variable "tier1_name" {
  description = "Tier1 Gateway Name that will support Segments"
  type = string
  default = ""
}
variable "dhcp_server_name" {
  description = "Name of DHCP Server"
  type = string
  default = ""
}
variable "segment_dhcp_name" {
  description = "Segment Name for AVI Management and VIP"
  type = string
  default = ""
}
variable "segment_dhcp_segment_gateway_cidr" {
  description = "DHCP Segment Gateway Address"
  type = string
  default = ""
}
variable "segment_dhcp_segment_dhcp_ip_range" {
  description = "DHCP Segment Range"
  type = string
  default = ""
}
variable "segment_dhcp_segment_dhcp_ip_address_for_segment" {
  description = "DHCP Segment DHCP Server IP Assigment"
  type = string
  default = ""
}

## vCenter variables 
variable "vcenter_user" {
  description = "vCenter User Name to Authenicate"
  type = string
  default = ""
}
variable "vcenter_password" {
  description = "vCenter Password for User Name Above"
  type = string
  default = ""
}
variable "vsphere_server_address" {
  description = "FQDN or IP Address of vCenter"
  type = string
  default = ""
}
variable "vc_cluster" {
  description = "vCenter Cluster Name for Service Engine deployment"
  type = string
  default = ""
}
variable "vc_datastore" {
  description = "vCenter Datastore Name for Service Engine deployment"
  type = string
  default = ""
}
variable "vc_contentlib" {
  description = "vCenter Content Library Name for Service Engine ova"
  type = string
  default = ""
}
variable "vc_datacenter" {
  description = "vCenter Datacenter Name for Service Engine"
  type = string
  default = ""
}
variable "vcenter_dvs" {
  description = "vCenter vDS used for vCenter Cloud"
  type = string
  default = ""
}
variable "dvs_port_group" {
  description = "vCenter vDS Port Group used for vCenter Cloud"
  type = string
  default = ""
}