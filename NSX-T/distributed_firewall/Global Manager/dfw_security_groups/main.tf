## NSX-T Provider
provider "nsxt" {
  host                  = var.nsx_address
  username              = var.nsx_user
  password              = var.nsx_password
  allow_unverified_ssl  = true
  global_manager = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

## Site of Local Manager in Global Manager
data "nsxt_policy_site" "site1" {
   display_name = var.local_manager_name
}

## Creation of Security Group with Virtual Machine Type as the Criteria
resource "nsxt_policy_group" "policy_group_one_condition_virtual_machine_type" {
  for_each = var.nsxt_policy_group_one_condition_virtual_machine_type
  display_name = each.value.display_name
  domain = data.nsxt_policy_site.site1.id
  criteria {
    condition {
      key         = each.value.key
      member_type = each.value.group_member_type
      operator    = each.value.group_operator
      value       = each.value.group_value
    }
  }
}

## Creation of Security Group with Port Segment Type as the Criteria
resource "nsxt_policy_group" "policy_group_one_condition_segment_port_type" {
  for_each = var.nsxt_policy_group_one_condition_segment_port_type
  display_name = each.value.display_name
  domain = data.nsxt_policy_site.site1.id
  criteria {
    condition {
      key         = each.value.key
      member_type = each.value.group_member_type
	  operator    = each.value.group_operator
      value       = each.value.group_value
    }
  }
}

## Creation of Security Group with Segment Type as the Criteria
resource "nsxt_policy_group" "policy_group_one_condition_segment_type" {
  for_each = var.nsxt_policy_group_one_condition_segment_type
  display_name = each.value.display_name
  domain = data.nsxt_policy_site.site1.id
  criteria {
    condition {
      key         = each.value.key
      member_type = each.value.group_member_type
	  operator    = each.value.group_operator
      value       = each.value.group_value
    }
  }
}