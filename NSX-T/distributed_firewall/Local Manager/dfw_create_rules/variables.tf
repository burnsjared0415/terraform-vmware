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
variable "security_policy_infrastructure_category" { 
  description = "This is the Name of the Security Policy under Infrastructure Category on Distributed Firewall"
  type = string
  default =  ""
}
variable "security_policy_application_1_category" { 
  description = "This is the Name of the Security Policy under Application Category on Distributed Firewall"
  type = string
  default =  ""
}
variable "security_policy_application_2_category" { 
  description = "This is the Name of the Security Policy under Application Category on Distributed Firewall"
  type = string
  default =  ""
}
variable "dfw_create_rule_destination_policy_list" {
  description = "List Policies to create in DFW, Category is where policy will sit, Local Managers options: Ethernet, Emergency, Infrastructure, Environment, Application. Global Managers Infrastructure, Environment, Application"
  type = map(object({
    display_name_rule = string
	}))
	default = {
	"config_1" = {
	display_name_rule = ""
	}
  }
}
variable "dfw_create_rule_source_policy_list" {
  description = "List Policies to create in DFW, Category is where policy will sit, Local Managers options: Ethernet, Emergency, Infrastructure, Environment, Application. Global Managers Infrastructure, Environment, Application"
  type = map(object({
	display_name_rule = string
	}))
	default = {
	"config_1" = {
	display_name_rule = ""
	}
  }
}
variable "dfw_create_rule_source_destination_policy_list" {
  description = "List Policies to create in DFW, Category is where policy will sit, Local Managers options: Ethernet, Emergency, Infrastructure, Environment, Application. Global Managers Infrastructure, Environment, Application"
  type = map(object({
	display_name_rule = string
	}))
	default = {
	"config_1" = {
	display_name_rule = ""
	}
  }
}
variable "dfw_source_group" { 
  description = "Distributed Firewall Source Group"
  type = string
  default =  ""
}
variable "dfw_destination_group" { 
  description = "Distributed Firewall Destination Group"
  type = string
  default =  ""
}
variable "service_port" { 
  description = "Distributed Firewall Service Port"
  type = string
  default =  ""
}
variable "action_allow" { 
  description = "DFW Rule action, one of ALLOW, DROP, REJECT"
  type = string
  default =  ""
}
variable "action_deny" { 
  description = "DFW Rule action, one of ALLOW, DROP, REJECT"
  type = string
  default =  ""
}