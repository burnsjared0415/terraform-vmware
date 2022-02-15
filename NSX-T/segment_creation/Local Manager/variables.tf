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
  default = "
}
variable "overlay_tz" {
  description = "Overlay Transport Zone for Segments"
  type = string
  default = ""
}
variable "tier0_name" {
  description = "Tier0 Gateway Name that will support Segments"
  type = string
  default = ""
}
variable "dhcp_server_name" {
  description = "Name of DHCP Server"
  type = string
  default = ""
}
variable "vlan_tz" {
  description = "VLAN Transport Zone for Segments"
  type = string
  default = ""
}
variable "segment_dhcp_name_list" {
  description = "List of Segments to create with DHCP"
  type = map(object({
    segment_name = string
	segment_gateway_cidr = string
	dhcp_ip_range = string
	dhcp_ip_address_for_segment = string
	}))
	default = {
	"config_1" = {
	segment_name = ""
	segment_gateway_cidr = ""
	dhcp_ip_range = ""
	dhcp_ip_address_for_segment = ""
	},
	"config_2" = {
	segment_name = ""
	segment_gateway_cidr = ""
	dhcp_ip_range = ""
	dhcp_ip_address_for_segment = ""
	}
  }
}
variable "segment_static_name_list" {
  description = "List of Segments to create with Static IP Addresses"
  type = map(object({
    segment_name = string
	segment_gateway_cidr = string
	}))
	default = {
	"config_1" = {
	segment_name = ""
	segment_gateway_cidr = ""
	},
	"config_2" = {
	segment_name = ""
	segment_gateway_cidr = ""
	}
  }
}
variable "segment_static_name_with_pool" {
  description = "List of Segments to create with Static IP Pool"
  type = string
  default = ""
}
variable "segment_static_name_with_pool_cidr" {
  description = "List of Segments to create with Static IP Pool"
  type = string
  default = ""
}

variable "ip_pool_name" {
  description = "IP Pool Name"
  type = string
  default = ""
}
variable "segment_vlan_name_list" {
  description = "List of Segments to create with VLAN Tags"
  type = map(object({
    segment_name = string
	segment_vlan_id = list(string)
	}))
	default = {
	"config_1" = {
	segment_name = ""
	segment_vlan_id = [""]
	},
	"config_2" = {
	segment_name = ""
	segment_vlan_id = [""]
	}
  }
}