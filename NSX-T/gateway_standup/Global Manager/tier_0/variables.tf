## NSX variables
variable "nsx_user" { 
  description = "NSX User to Authenicate with"
  type = string
  default = ""
}
variable "nsx_password" { 
  description = "NSX Password for User above"
  type = string
  default = ""
}
variable "nsx_address" { 
  description = "FQDN or IP Address of NSX-T VIP or Manager"
  type = string
  default = ""
}
variable "tier0_gw_name" { 
  description = "Tier 0 Gateway Name"
  type = string
  default = ""
}
variable "tier0_failover_mode" { 
  description = "Failover Mode options are PREEMPTIVE or NON_PREEMPTIVE"
  type = string
  default = ""
}
variable "tier0_ha_mode" { 
  description = "HA Mode option are ACTIVE_ACTIVE or ACTIVE_STANDBY"
  type = string
  default = ""
}
variable "tier0_internal_transit_subnets" { 
  description = "Tier 0 Internal Transit Subnets"
  type = string
  default = ""
}
variable "tier0_transit_subnets" { 
  description = "Tier 0 Transit Subnets"
  type = string
  default = ""
}
variable "tier0_local_as_num" { 
  description = "Tier 0 ASN Number"
  type = string
  default = ""
}
variable "edge_cluster" { 
  description = "Edge Cluster that Tier 1 Gateway will Connect"
  type = string
  default = ""
}
variable "edge_node_1" {
  description = "Edge Node 1"
  type = string
  default = ""
}
variable "edge_node_2" {
  description = "Edge Node 2"
  type = string
  default = ""
}
variable "vlan_tz" {
  description = "VLAN Transport Zone for Uplinks"
  type = string
  default = ""
}
variable "tier0_bgp_asn" {
  description = "Tier 0 Gateway ASN for BGP"
  type = string
  default = ""
}
variable "edge_uplink1_vlan_segment" {
  description = "Edge Uplink 1 VLAN Segment for Tier 0 Interface"
  type = string
  default = ""
}
variable "edge_uplink1_vlan_tag" {
  description = "Edge Uplink 1 VLAN Tag for Tier 0 Interface"
  type = string
  default = ""
}
variable "edge_uplink2_vlan_segment" {
  description = "Edge Uplink 2 VLAN Segment for Tier 0 Interface"
  type = string
  default = ""
}
variable "edge_uplink2_vlan_tag" {
  description = "Edge Uplink 2 VLAN Tag for Tier 0 Interface"
  type = string
  default = ""
}
variable "interface_name_uplink1_edge_node1" {
  description = "Interface for Uplink1 Edge Node 1 name"
  type = string
  default = ""
}
variable "interface_ip_address_w_cidr_uplink1_node1" {
  description = "Interface for Uplink1 Edge Node 1 ip address with cidr"
  type = string
  default = ""
}
variable "interface_name_uplink1_edge_node2" {
  description = "Interface for Uplink1 Edge Node 2 name"
  type = string
  default = ""
}
variable "interface_ip_address_w_cidr_uplink1_node2" {
  description = "Interface for Uplink1 Edge Node 2 ip address with cidr"
  type = string
  default = ""
}
variable "bgp_neighbor_1_name" {
  description = "BGP Neighbor first connection name"
  type = string
  default = ""
}
variable "bgp_switch_ip_address_uplink1" {
  description = "BGP Switch Neighbor IP Address"
  type = string
  default = ""
}
variable "bgp_neighbor_2_name" {
  description = "BGP Neighbor first connection name"
  type = string
  default = ""
}
variable "bgp_switch_ip_address_uplink2" {
  description = "BGP Switch Neighbor IP Address"
  type = string
  default = ""
}
variable "bgp_password" {
  description = "BGP Switch Neighbor Password"
  type = string
  default = ""
}
variable "bgp_remote_asn_number" {
  description = "BGP Remote ASN Number on Switch"
  type = string
  default = ""
}
variable "local_manager_name" { 
  description = "This is the Site Name for the Local Managers you want to create the dfw policy on"
  type = string
  default =  ""
}
variable "tier0_interface_list_uplink_1_node1" {
  description = "Uplink IP Address for Uplink 1 on Edge Node 1"
  type = map(object({
    display_name = string
	subnets = list(string)
	}))
	default = {
	"config_1" = {
	display_name = ""
	subnets = [""]
	}
  }
}
variable "tier0_interface_list_uplink_1_node2" {
  description = "Uplink IP Address for Uplink 1 on Edge Node 2"
  type = map(object({
    display_name = string
	subnets = list(string)
	}))
	default = {
	"config_1" = {
	display_name = ""
	subnets = [""]
	}
  }
}
variable "tier0_interface_list_uplink_2_node1" {
  description = "Uplink IP Address for Uplink 2 on Edge Node 1"
  type = map(object({
    display_name = string
	subnets = list(string)
	}))
	default = {
	"config_1" = {
	display_name = ""
	subnets = [""]
	}
  }
}
variable "tier0_interface_list_uplink_2_node2" {
  description = "Uplink IP Address for Uplink 2 on Edge Node 2"
  type = map(object({
    display_name = string
	subnets = list(string)
	}))
	default = {
	"config_1" = {
	display_name = ""
	subnets = [""]
	}
  }
}