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

## Get Edge Cluster ID for DHCP
data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster
}

## This will Create a DHCP Server in NSX-T
resource "nsxt_policy_dhcp_server" "dhcp" {
  display_name      = var.dhcp_server_name
  edge_cluster_path = data.nsxt_policy_edge_cluster.EC.path
  lease_time        = 36000
}

## This will Create a DHCP Relay in NSX-T
resource "nsxt_policy_dhcp_relay" "relay" {
  display_name     = var.dhcp_relay_name
  server_addresses = var.dhcp_external_ip
}
 

