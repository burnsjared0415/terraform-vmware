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

## NSX-T Configuration deployment
data "nsxt_policy_tier0_gateway" "T0" {
  display_name = var.tier0_name
}

## NSX-T Edge Cluster Collection for Placment of Tier-1
data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster
  site_path = data.nsxt_policy_site.site1.path
}

## Creation of Tier-1
resource "nsxt_policy_tier1_gateway" "tier1_nodes" {
  count = length(var.tier1_gateway_list)
  display_name              = var.tier1_gateway_list[count.index]
  failover_mode             = "PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "true"
  enable_standby_relocation = "true"
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED", "TIER1_LB_SNAT", "TIER1_DNS_FORWARDER_IP"]
  pool_allocation           = "ROUTING"
  
  locale_service {
   edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  }
  
  intersite_config {
   primary_site_path = data.nsxt_policy_site.site1.path
  } 
}





 

