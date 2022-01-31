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

## NSX-T Configuration deployment
data "nsxt_policy_tier0_gateway" "T0" {
  display_name = var.tier0_name
}

## NSX-T Edge Cluster Collection for Placment of Tier-1
data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster
}

## Creation of Tier-1
resource "nsxt_policy_tier1_gateway" "tier1_nodes" {
  count = length(var.tier1_gateway_list)
  display_name              = var.tier1_gateway_list[count.index]
  edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  failover_mode             = "PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "true"
  enable_standby_relocation = "true"
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED", "TIER1_LB_SNAT", "TIER1_DNS_FORWARDER_IP"]
  pool_allocation           = "ROUTING"
}





 

