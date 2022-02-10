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

## Creation of Security Group with Virtual Machine Type as the Criteria
resource "nsxt_policy_group" "policy_group_one_condition_virtual_machine_type" {
  for_each = var.nsxt_policy_group_one_condition_virtual_machine_type
  display_name = each.value.display_name
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
  criteria {
    condition {
      key         = each.value.key
      member_type = each.value.group_member_type
	  operator    = each.value.group_operator
      value       = each.value.group_value
    }
  }
}

## Creation of Security Group with IPSet Type as the Criteria
resource "nsxt_policy_group" "policy_group_one_condition_ipset_type" {
  for_each = var.nsxt_policy_group_one_condition_ipset_type
  display_name = each.value.display_name
  criteria {
    condition {
      key         = each.value.key
      member_type = each.value.group_member_type
	  operator    = each.value.group_operator
      value       = each.value.group_value
    }
  }
}

## Creation of Security Group with Virtual Machine Type as the Criteria with AND/OR Operator and Virtual Machine Criteria, AND/OR Operator is for two of the same Criteria
resource "nsxt_policy_group" "policy_group_one_condition_virtual_machine_type_with_and_or_operator" {
  for_each = var.nsxt_policy_group_one_condition_virtual_machine_type_with_and_or
  display_name = each.value.display_name
  criteria {
    condition {
      key         = each.value.key_1
      member_type = each.value.group_member_type_1
      operator    = each.value.group_operator_1
      value       = each.value.group_value_1
    }
  }
  conjunction {
    operator = each.value.conjunction_operator
  }
  criteria {
    condition {
      key         = each.value.key_2
      member_type = each.value.group_member_type_2
      operator    = each.value.group_operator_2
      value       = each.value.group_value_2
    }
  }
}

## Creation of Security Group with Virtual Machine Type as the Criteria with OR Operator and Virtual Machine Criteria, OR Operator is for two of the different Criteria
resource "nsxt_policy_group" "policy_group_one_condition_virtual_machine_type_with_or_operator" {
  for_each = var.nsxt_policy_group_one_condition_virtual_machine_type_with_or
  display_name = each.value.display_name
  criteria {
    condition {
      key         = each.value.key_1
      member_type = each.value.group_member_type_1
      operator    = each.value.group_operator_1
      value       = each.value.group_value_1
    }
  }
  conjunction {
    operator = each.value.conjunction_operator
  }
  criteria {
    condition {
      key         = each.value.key_2
      member_type = each.value.group_member_type_2
      operator    = each.value.group_operator_2
      value       = each.value.group_value_2
    }
  }
}