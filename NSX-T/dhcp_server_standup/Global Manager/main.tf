## NSX-T Provider
provider "nsxt" {
  host                  = var.nsx_address
  username              = var.nsx_user
  password              = var.nsx_password
  global_manager = true
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

## Site of Local Manager in Global Manager
data "nsxt_policy_site" "site1" {
   display_name = var.local_manager_name
}

## Get Edge Cluster ID for DHCP
data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster
  site_path = data.nsxt_policy_site.site1.path
}

## This will Create a DHCP Server in NSX-T
resource "nsxt_policy_dhcp_server" "dhcp" {
  display_name      = var.dhcp_server_name
  edge_cluster_path = data.nsxt_policy_edge_cluster.EC.path
  lease_time        = 36000
}
 

