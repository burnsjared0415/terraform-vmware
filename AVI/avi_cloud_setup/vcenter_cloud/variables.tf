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
variable "avi_cloud_name_vcenter" { 
  description = "AVI Cloud Name vCenter Cloud"
  type = string
  default = ""
}
variable "avi_cloud_type_vcenter" { 
  description = "AVI Cloud Type, Can be: NSX-T, vCenter, OpenStack, AWS, Linux Server, AZURE, Google"
  type = string
  default = "CLOUD_VCENTER"
}
variable "avi_se_mgmt_network" { 
  description = "AVI Service Enginer Managment Network"
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

## AVI Service Engine Variables
variable "segroup_vcenter_name" { 
  description = "Service Engine Group Name vCenter"
  type = string
  default = ""
}
variable "se_name_prefix_vcenter" { 
  description = "Service Engine Prefix name attached to each Service Engine to overwrite name on vCenter_cloud"
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
variable "ipam_name_vcenter" { 
  description = "IPAM Profile Name to attach to Cloud"
  type = string
  default = ""
}
variable "dns_profile_name_vcenter" { 
  description = "DNS Profile Name to attach to Cloud"
  type = string
  default = ""
}

variable "dns_domain_name" { 
  description = "DNS Search Zone"
  type = string
  default = ""
}

variable "dns_ip_address" { 
  description = "DNS Resolver IP Address"
  type = string
  default = ""
}
variable "resolver_name" { 
  description = "DNS Resolver Name"
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