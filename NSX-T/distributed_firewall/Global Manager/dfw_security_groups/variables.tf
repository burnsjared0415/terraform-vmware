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
	key = "Name"
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
	display_name = ""
	group_member_type = ""
	key = "OSName"
	group_operator = ""
	group_value = ""
	},
	"config_4" = {
	display_name = ""
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
variable "local_manager_name" { 
  description = "This is the Site Name for the Local Managers you want to create the dfw policy on"
  type = string
  default =  ""
}
