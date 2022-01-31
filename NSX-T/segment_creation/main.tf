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

## Collects the data of the specified T0 Gateway(If you want to connect Segment to T0)
data "nsxt_policy_tier0_gateway" "T0" {
  display_name = var.tier0_name
}

## Collects the data of the specified Overlay Transport Zone
data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = var.overlay_tz
}

## Collects the data of the T1 Gateway Specified
data "nsxt_policy_tier1_gateway" "tier1_gateway" {
  display_name = var.tier1_name
}

## Collects the data of the DHCP Server Specified
data "nsxt_policy_dhcp_server" "dhcp_server" {
  display_name = var.dhcp_server_name
}

## Collects IP Pool data for assignment to Segment
data "nsxt_policy_ip_pool" "ip_pool" {
  display_name = var.ip_pool_name
}

data "nsxt_policy_transport_zone" "vlan_tz" {
  display_name = var.vlan_tz
}

## Create Segments with DHCP Server configured
resource "nsxt_policy_segment" "segment_dhcp" {
  for_each = var.segment_dhcp_name_list
  display_name = each.value.segment_name
  connectivity_path = data.nsxt_policy_tier1_gateway.tier1_gateway.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  dhcp_config_path = data.nsxt_policy_dhcp_server.dhcp_server.path
  subnet {
    cidr = each.value.segment_gateway_cidr
    dhcp_ranges = [each.value.dhcp_ip_range]
    dhcp_v4_config {
    server_address = each.value.dhcp_ip_address_for_segment
    lease_time = 36000
    }
  }
}

## Create Segments with Static Address required configured
resource "nsxt_policy_segment" "segment_static" {
  for_each = var.segment_static_name_list
  display_name = each.value.segment_name
  connectivity_path = data.nsxt_policy_tier1_gateway.tier1_gateway.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  subnet {
    cidr = each.value.segment_gateway_cidr
    }
}

## Create Segments with Static Address with IP Pool required configured ( Bug in IP Pool Assignment to be Corrected in Module)
resource "nsxt_policy_segment" "segment_static_with_ip_pool" {
  display_name = var.segment_static_name_with_pool
  connectivity_path = data.nsxt_policy_tier1_gateway.tier1_gateway.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  subnet {
    cidr = var.segment_static_name_with_pool_cidr
    }
  advanced_config {
   address_pool_path = data.nsxt_policy_ip_pool.ip_pool.path
  }
}

## Create Segments with VLAN Backed Network required configured
resource "nsxt_policy_vlan_segment" "vlan_segment" {
  for_each = var.segment_vlan_name_list
  display_name = each.value.segment_name
  transport_zone_path = data.nsxt_policy_transport_zone.vlan_tz.path
  vlan_ids = each.value.segment_vlan_id
}