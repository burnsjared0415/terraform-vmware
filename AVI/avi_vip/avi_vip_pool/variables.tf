## AVI variables
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

## NSX-T Pool Variables
variable "avi_cloud_name_nsx" { 
  description = "AVI Cloud Name NSX Cloud"
  type = string
  default = ""
}
variable "avi_monitor_name" { 
   description = "AVI Monitor Name"
   type = string
   default = ""
}
variable "avi_cloud_name_vcenter" { 
  description = "AVI Cloud Name vCenter Cloud"
  type = string
  default = ""
}
variable "pool_1_name_nsx" { 
  description = "AVI Pool Name"
  type = string
  default = ""
}
variable "pool_1_default_server_port_nsx" { 
  description = "AVI Pool Default Port for VIP"
  type = string
  default = ""
}
variable "pool_member_nsx_list" {
  description = "AVI List of Pool Members"
  type = map(object({
    ip_address = string
	hostname = string
	}))
	default = {
	"config_1" = {
	ip_address = ""
	hostname = ""
	},
	"config_2" = {
	ip_address = ""
	hostname = ""
	}
	"config_3" = {
	ip_address = ""
	hostname = ""
	}
  }
}

## vCenter Pool Variables
variable "pool_2_name_vcenter" { 
  description = "AVI Pool Name"
  type = string
  default = ""
}
variable "pool_2_default_server_port_vcenter" { 
  description = "AVI Pool Default Port for VIP"
  type = string
  default = ""
}
variable "pool_member_vcenter_list" {
  description = "AVI List of Pool Members"
  type = map(object({
    ip_address = string
	hostname = string
	}))
	default = {
	"config_1" = {
	ip_address = ""
	hostname = ""
	},
	"config_2" = {
	ip_address = ""
	hostname = ""
	}
	"config_3" = {
	ip_address = ""
	hostname = ""
	}
  }
}
variable "avi_vcenter_placement_network" { 
  description = "AVI Service Enginer Managment Network"
  type = string
  default = ""
}
variable "avi_vcenter_placement_network_mask" { 
  description = "AVI Service Enginer Managment Network submask"
  type = string
  default = ""
}
variable "avi_vcenter_vrfcontext_for_pool" { 
  description = "AVI VRF Context Name for vCenter Virtual Service"
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
variable "tier1_name" {
  description = "Tier1 Gateway Name that will support Segments"
  type = string
  default = ""
}
variable "dvs_port_group" {
  description = "vCenter vDS Port Group used for vCenter Cloud"
  type = string
  default = ""
}