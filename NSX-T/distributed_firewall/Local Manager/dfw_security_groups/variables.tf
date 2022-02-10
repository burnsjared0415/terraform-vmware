## NSX variables
variable "nsx_user" { 
  description = "NSX User to Authenicate with"
  type = string
  default =  ""
}
variable "nsx_password" { 
  description = "NSX Password for User above"
  type = string
  default =  ""
}
variable "nsx_address" { 
  description = "FQDN or IP Address of NSX-T VIP or Manager"
  type = string
  default =  ""
}
variable "nsxt_policy_group_one_condition_virtual_machine_type" {
  description = "NSX-T Policy Security Group for Virtual Machine Criteria, Key Types are: Tag(Tag), Computer Name(ComputerName), Name(Name), and OS Name(OSName), Operator Types are: Contains(CONTAINS), Ends With(ENDSWITH), Equals(EQUALS), Not Equal(NOTEQUALS) and Start With(STARTSWITH)"
  type = map(object({
    display_name = string
	key = string
	group_member_type = string
	group_operator = string
	group_value = string
	}))
	default = {
	"config_1" = {
	display_name = ""
	group_member_type = ""
	key = ""
	group_operator = ""
	group_value = ""
	},
	"config_2" = {
	display_name = ""
	group_member_type = ""
	key = ""
	group_operator = ""
	group_value = ""
	},
	"config_3" = {
	display_name = "VirtualMachine_OSName"
	group_member_type = ""
	key = ""
	group_operator = ""
	group_value = ""
	},
	"config_4" = {
	display_name = "VirtualMachine_ComputerName"
	group_member_type = ""
	key = ""
	group_operator = ""
	group_value = ""
	}
  }
}
variable "nsxt_policy_group_one_condition_segment_port_type" {
  description = "NSX-T Policy Security Group for Segement Port Criteria, Key Types are: Tag, Operator is always EQUALS"
  type = map(object({
    display_name = string
	key = string
	group_member_type = string
	group_operator = string
	group_value = string
	}))
	default = {
	"config_1" = {
	display_name = ""
	group_member_type = ""
	key = "Tag"
	group_operator = "EQUALS"
	group_value = ""
	}
  }
}
variable "nsxt_policy_group_one_condition_segment_type" {
  description = "NSX-T Policy Security Group for Segement Criteria, Key Types are: Tag, Operator is always EQUALS"
  type = map(object({
    display_name = string
	key = string
	group_member_type = string
	group_operator = string
	group_value = string
	}))
	default = {
	"config_1" = {
	display_name = ""
	group_member_type = ""
	key = "Tag"
	group_operator = "EQUALS"
	group_value = ""
	}
  }
}
variable "nsxt_policy_group_one_condition_ipset_type" {
  description = "NSX-T Policy Security Group for IPSet Criteria, Key Types are: Tag, Operator is always EQUALS"
  type = map(object({
    display_name = string
	key = string
	group_member_type = string
	group_operator = string
	group_value = string
	}))
	default = {
	"config_1" = {
	display_name = ""
	group_member_type = ""
	key = "Tag"
	group_operator = "EQUALS"
	group_value = ""
	}
  }
}
variable "nsxt_policy_group_one_condition_virtual_machine_type_with_and_or" {
  description = "NSX-T Policy Security Group for Virtual Machine Criteria, Key Types are: Tag, Computer Name, Name, and OS Name, Operator Types are: Contains, Ends With, Equals, Not Equal and Start With, with AND/OR Operator"
  type = map(object({
    display_name = string
	key_1 = string
	group_member_type_1 = string
	group_operator_1 = string
	group_value_1 = string
	key_2 = string
	group_member_type_2 = string
	group_operator_2 = string
	group_value_2 = string
	conjunction_operator = string
	}))
	default = {
	"config_1" = {
	display_name = ""
	group_member_type_1 = ""
	key_1 = ""
	group_operator_1 = ""
	group_value_1 = ""
	group_member_type_2 = ""
	key_2 = ""
	group_operator_2 = ""
	group_value_2 = ""
	conjunction_operator = ""
	}
  }
}
variable "nsxt_policy_group_one_condition_virtual_machine_type_with_or" {
  description = "NSX-T Policy Security Group for Virtual Machine Criteria, Key Types are: Tag, Computer Name, Name, and OS Name, Operator Types are: Contains, Ends With, Equals, Not Equal and Start With, with OR Operator"
  type = map(object({
    display_name = string
	key_1 = string
	group_member_type_1 = string
	group_operator_1 = string
	group_value_1 = string
	key_2 = string
	group_member_type_2 = string
	group_operator_2 = string
	group_value_2 = string
	conjunction_operator = string
	}))
	default = {
	"config_1" = {
	display_name = ""
	group_member_type_1 = ""
	key_1 = ""
	group_operator_1 = ""
	group_value_1 = ""
	group_member_type_2 = ""
	key_2 = ""
	group_operator_2 = ""
	group_value_2 = ""
	conjunction_operator = ""
	}
  }
}
