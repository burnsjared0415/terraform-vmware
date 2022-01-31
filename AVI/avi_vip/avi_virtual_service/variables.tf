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
variable "avi_applicationprofile_name" { 
  description = "Application Proifle Name options: APPLICATION_PROFILE_TYPE_L4, APPLICATION_PROFILE_TYPE_HTTP, APPLICATION_PROFILE_TYPE_SYSLOG, APPLICATION_PROFILE_TYPE_DNS, APPLICATION_PROFILE_TYPE_SSL, APPLICATION_PROFILE_TYPE_SIP."
  type = string
  default = ""
}

## NSX-T Virtual Service variables
variable "avi_cloud_name_nsx" { 
  description = "AVI Cloud Name NSX Cloud"
  type = string
  default = ""
}
variable "segroup_nsx_name" { 
  description = "Service Engine Group Name NSX"
  type = string
  default = ""
}
variable "avi_virtual_service_name_nsxt" { 
  description = "Virtual Service Name"
  type = string
  default = ""
}
variable "avi_vsvip_1_name_nsxt" { 
  description = "Virtual Service VIP Name"
  type = string
  default = ""
}
variable "avi_nsxt_pool_name" { 
  description = "Pool Name"
  type = string
  default = ""
}
variable "avi_virtual_service_port_nsxt" { 
  description = "Virtual Service Default Port"
  type = string
  default = ""
}

## vCenter Virtual Service variables
variable "avi_cloud_name_vcenter" { 
  description = "AVI Cloud Name vCenter Cloud"
  type = string
  default = ""
}
variable "avi_vcenter_pool_name" { 
  description = "Pool Name"
  type = string
  default = ""
}
variable "avi_virtual_service_name_vcenter" { 
  description = "Virtual Service Name"
  type = string
  default = ""
}
variable "avi_vsvip_1_name_vcenter" { 
  description = "Virtual Service VIP Name"
  type = string
  default = ""
}
variable "segroup_vcenter_name" { 
  description = "Service Engine Group Name vCenter"
  type = string
  default = ""
}
variable "avi_virtual_service_port_vcenter" { 
  description = "Virtual Service Default Port"
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
variable "nsxt_segment" {
  description = "Segment Name for AVI Management and VIP"
  type = string
  default = ""
}