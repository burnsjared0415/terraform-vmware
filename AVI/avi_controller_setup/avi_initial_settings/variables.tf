## AVI variables
variable "avi_controller_ip" {
	description = "AVI Controller IP Address"
	type = string
	default = ""
}
variable "avi_username" {
	description = "AVI Default UserName"
	type = string
	default = ""
}
variable "avi_password" {
	description = "AVI Password for controller"
	type = string
	default = ""
}
variable "common_criteria_mode" {
	description = "This is a new feature required in AVi 21.1.3 which requires this field"
	type = string
	default = "false"
}
variable "license_type" {
  description = "Licenses for AVI, License Types: ENTERPRISE_16, ENTERPRISE, ENTERPRISE_18, BASIC, ESSENTIALS, ENTERPRISE_WITH_CLOUD_SERVICES."
  type = string
  default = ""
}
variable "search_domain" {
  description = "Search Domain"
  type = string
  default = ""
}

variable "dns_ntp_ip_addresses" {
  description = "NTP and DNS Entries"
  type = map(object({
  dns1 = string
  dns2 = string
  ntp1 = string
  ntp2 = string
  }))
  default = {
  "config_1" = {
  "dns1" = ""
  "dns2" = ""
  "ntp1" = ""
  "ntp2" = ""
  }
 }
}

## vCenter variables 
variable "vcenter_user" { 
   description = "vCenter User Name"
   type = string
   default =  ""
}
variable "vcenter_password" { 
   description = "vCenter User Password"
   type = string
   default =  ""
}
variable "vsphere_server" { 
   description = "vCenter url or address"
   type = string
   default =  ""
}
variable "vsphere_datacenter" {
	description = "vCenter DataCenter"
	type = string
	default = ""
}

