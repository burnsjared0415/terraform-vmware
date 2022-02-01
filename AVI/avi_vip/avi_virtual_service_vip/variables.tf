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

## NSX-T Virtual Service VIP variables
variable "avi_cloud_name_nsx" { 
  description = "AVI Cloud Name NSX Cloud"
  type = string
  default = ""
}
variable "virtual_service_list_nsxt" {
  description = "AVI VIP Address IP Addresses. This would include a the name of the virtual service vip, virtual service id(unique to each VIP), IP address assigment(Static or DHCP)"
  type = map(object({
  virtual_service_name = string
	virtual_service_id = string
	virtual_service_1_vip_ip_addr = string
	}))
	default = {
	"config_1" = {
	virtual_service_name = ""
	virtual_service_id = "0"
	virtual_service_1_vip_ip_addr = ""
	},
	"config_2" = {
	virtual_service_name = ""
	virtual_service_id = "1"
	virtual_service_1_vip_ip_addr = ""
	}
  }
}

## vCenter Virtual Service VIP variables
variable "avi_cloud_name_vcenter" { 
  description = "AVI Cloud Name vCenter Cloud"
  type = string
  default = ""
}

variable "virtual_service_list_vcenter" {
  description = "AVI VIP Address IP Addresses. This would include a the name of the virtual service vip, virtual service id(unique to each VIP), IP address assigment(Static or DHCP)"
  type = map(object({
    virtual_service_name = string
	virtual_service_id = string
	virtual_service_1_vip_ip_addr = string
	}))
	default = {
	"config_1" = {
	virtual_service_name = ""
	virtual_service_id = "2"
	virtual_service_1_vip_ip_addr = ""
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
variable "avi_vcenter_vrfcontext_for_pool" { 
  description = "AVI VRF Context Name for vCenter Virtual Service"
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
variable "vc_datacenter" {
  description = "vCenter Datacenter Name for Service Engine"
  type = string
  default = ""
}
variable "dvs_port_group" {
  description = "vCenter vDS Port Group used for vCenter Cloud"
  type = string
  default = ""
}