## NSX-T Provider
provider "nsxt" {
  host                  = var.nsx_address
  username              = var.nsx_user
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

## NSX-T Edge Cluster Collection for Placement of Tier-0
data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster
}


## Creation of Tier-0
resource "nsxt_policy_tier0_gateway" "tier0_gw" {
  display_name             = var.tier0_gw_name
  failover_mode            = var.tier0_failover_mode
  default_rule_logging     = false
  enable_firewall          = true
  ha_mode                  = var.tier0_ha_mode
  internal_transit_subnets = [var.tier0_internal_transit_subnets]
  transit_subnets          = [var.tier0_transit_subnets]
  edge_cluster_path        = data.nsxt_policy_edge_cluster.EC.path

  bgp_config {
    local_as_num    = var.tier0_local_as_num
    multipath_relax = false
	ecmp = true
	inter_sr_ibgp = true
  }
}

## Collect Edge Node 1 for Creation of Interface
data "nsxt_policy_edge_node" "node1" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.EC.path
  display_name      = var.edge_node_1
}

## Collect Edge Node 2 for Creation of Interface
data "nsxt_policy_edge_node" "node2" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.EC.path
  display_name      = var.edge_node_2
}

## Collect Transport Zone for VLAN Back Networks
data "nsxt_policy_transport_zone" "vlan_tz" {
  display_name = var.vlan_tz
}

## Create Uplink-1 Segment for Tier-0
resource "nsxt_policy_vlan_segment" "uplink1" {
  display_name = var.edge_uplink1_vlan_segment
  vlan_ids = [var.edge_uplink1_vlan_tag]
  transport_zone_path = data.nsxt_policy_transport_zone.vlan_tz.path
}

## Create Uplink-2 Segment for Tier-0
resource "nsxt_policy_vlan_segment" "uplink2" {
  display_name = var.edge_uplink2_vlan_segment
  vlan_ids = [var.edge_uplink2_vlan_tag]
  transport_zone_path = data.nsxt_policy_transport_zone.vlan_tz.path
}

## Create Tier-0 Interface for Edge Node 1
resource "nsxt_policy_tier0_gateway_interface" "interface_uplink1_edge_node1" {
  display_name = var.interface_name_uplink1_edge_node1
  type = "EXTERNAL"
  gateway_path = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path = nsxt_policy_vlan_segment.uplink1.path
  subnets = [var.interface_ip_address_w_cidr_uplink1_node1]
  mtu = 9000
  edge_node_path = data.nsxt_policy_edge_node.node1.path
}

## Create Tier-0 Interface for Edge Node 2
resource "nsxt_policy_tier0_gateway_interface" "interface_uplink1_edge_node2" {
  display_name = var.interface_name_uplink1_edge_node2
  type = "EXTERNAL"
  gateway_path = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path = nsxt_policy_vlan_segment.uplink1.path
  subnets = [var.interface_ip_address_w_cidr_uplink1_node2]
  mtu = 9000
  edge_node_path = data.nsxt_policy_edge_node.node2.path
}

## Added BGP Neigherbors for Tier-0 to Switch Configuration
resource "nsxt_policy_bgp_neighbor" "neighbor_1" {
  display_name          = var.bgp_neighbor_1_name
  bgp_path              = nsxt_policy_tier0_gateway.tier0_gw.bgp_config.0.path
  allow_as_in           = true
  graceful_restart_mode = "HELPER_ONLY"
  hold_down_time        = 300
  keep_alive_time       = 100
  neighbor_address      = var.bgp_switch_ip_address_uplink1
  password              = var.bgp_password
  remote_as_num         = var.bgp_remote_asn_number
  source_addresses = [nsxt_policy_tier0_gateway_interface.interface_uplink1_edge_node1.ip_addresses[0], nsxt_policy_tier0_gateway_interface.interface_uplink1_edge_node2.ip_addresses[0]]
}

