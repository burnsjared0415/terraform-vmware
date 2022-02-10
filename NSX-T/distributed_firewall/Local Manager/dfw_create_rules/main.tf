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

## Collection of a Pre-Defined Security Policy in the Infrastructure Category on Distributed Firewall
data "nsxt_policy_security_policy" "infrastructure" {
  display_name = var.security_policy_infrastructure_category
}

## Collection of a Pre-Defined Security Policy in the Application Category on Distributed Firewall
data "nsxt_policy_security_policy" "application_1" {
  display_name = var.security_policy_application_1_category
}

## Collection of a Pre-Defined Security Policy in the Application Category on Distributed Firewall
data "nsxt_policy_security_policy" "application_2" {
  display_name = var.security_policy_application_2_category
}

## Build NSX-T Rule on existing policy, that specific Port and Destination, Source is Any(Only one Rule can be added to a Security Policy at a time)
resource "nsxt_policy_predefined_security_policy" "policy_with_destination_rule" {
  for_each = var.dfw_create_rule_destination_policy_list
  path =  data.nsxt_policy_security_policy.infrastructure.path
  rule {
    display_name  = each.value.display_name_rule
    destination_groups = [data.nsxt_policy_group.destination_group.path]
    action = var.action_allow
    services = [data.nsxt_policy_service.service_port_1.path]
    logged  = true
  }
}

## Build NSX-T Rule on existing policy, specific Port and Source, Destination is Any
resource "nsxt_policy_predefined_security_policy" "policy_with_source_rule" {
  for_each = var.dfw_create_rule_source_policy_list
  path =  data.nsxt_policy_security_policy.application_1.path
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

## Build NSX-T Rule on existing policy, that specific Port and Destination and Source
resource "nsxt_policy_predefined_security_policy" "policy_with_both_source_destination_rule" {
  for_each = var.dfw_create_rule_source_destination_policy_list
  path =  data.nsxt_policy_security_policy.application_2.path
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