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

## Create Blank Policy with out Rule for Local Manager
resource "nsxt_policy_security_policy" "blank_policy" {
  for_each = var.dfw_blank_policy_list
  display_name = each.value.display_name
  category     = each.value.category
  locked       = false
  stateful     = true
  tcp_strict   = false
}

## Collection of Security Group for Source
data "nsxt_policy_group" "source_group" {
  display_name = var.dfw_source_group
}

## Collection of Security Group for Destination
data "nsxt_policy_group" "destination_group" {
  display_name = var.dfw_destination_group
}

## Collection Service Port for DFW
data "nsxt_policy_service" "service_port_1" {
  display_name = var.service_port
}

## Site of Local Manager in Global Manager
data "nsxt_policy_site" "site1" {
   display_name = var.local_manager_name
}

## Build NSX-T Policy with Rule that specific Port and Destination, Source is Any
resource "nsxt_policy_security_policy" "policy_with_destination_rule" {
  for_each = var.dfw_withrule_destination_policy_list
  display_name = each.value.display_name_policy
  category = each.value.category
  locked = false
  stateful = true
  tcp_strict = false
  domain = data.nsxt_policy_site.site1.id
  rule {
    display_name  = each.value.display_name_rule
    destination_groups = [data.nsxt_policy_group.destination_group.path]
    action = var.action_allow
    services = [data.nsxt_policy_service.service_port_1.path]
    logged  = true
  }
}

## Build NSX-T Policy with Rule that specific Port and Source, Destination is Any
resource "nsxt_policy_security_policy" "policy_with_source_rule" {
  for_each = var.dfw_withrule_source_policy_list
  display_name = each.value.display_name_policy
  category = each.value.category
  locked  = false
  stateful = true
  tcp_strict = false
  domain = data.nsxt_policy_site.site1.id
  rule {
    display_name = each.value.display_name_rule
    source_groups = [data.nsxt_policy_group.source_group.path]
    sources_excluded = true
    action = var.action_allow
    services = [data.nsxt_policy_service.service_port_1.path]
    logged = true
    disabled = true
  }
}

## Build NSX-T Policy with Rule that specific Port and Destination and Source
resource "nsxt_policy_security_policy" "policy_with_both_source_destination_rule" {
  for_each = var.dfw_withrule_source_destination_policy_list
  display_name = each.value.display_name_policy
  category = each.value.category
  locked = false
  stateful = true
  tcp_strict = false
  domain = data.nsxt_policy_site.site1.id
  rule {
    display_name     = each.value.display_name_rule
	source_groups    = [data.nsxt_policy_group.source_group.path]
    destination_groups	= [data.nsxt_policy_group.destination_group.path]
    sources_excluded = true
    action = var.action_deny
    services = [data.nsxt_policy_service.service_port_1.path]
    logged = true
    disabled = true
  }
}