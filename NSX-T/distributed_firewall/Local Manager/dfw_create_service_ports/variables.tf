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
variable "nsxt_policy_service_tcp_udp_list" {
  description = "NSX-T Service Creation using TCP or UDP Ports"
  type = map(object({
    display_name_service = string
	display_name_entry = string
	protocol = string
	destination_ports = list(string)
	source_ports = list(string)
	}))
	default = {
	"config_1" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	destination_ports = [""]
	source_ports = ["]
	},
	"config_2" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	destination_ports = [""]
	source_ports = [""]
	}
  }
}
variable "nsxt_policy_service_algorithm_entry_list" {
  description = "NSX-T Service Creation using Algorithm. Algorithm Options: FTP, MS_RPC_TCP, MS_RPC_UDP, ORACLE_TNS, SUN_RPC_TCP, SUN_RPC_UDP, TFTP"
  type = map(object({
    display_name_service = string
	display_name_entry = string
	alg = string
	destination_ports = string
	source_ports = list(string)
	}))
	default = {
	"config_1" = {
	display_name_service = ""
	display_name_entry = ""
	alg = ""
	destination_ports = ""
	source_ports = [""]
	},
	"config_2" = {
	display_name_service = ""
	display_name_entry = ""
	alg = "TFTP"
	destination_ports = ""
	source_ports = [""]
	}
  }
}
variable "nsxt_policy_service_ip_protocol_entry_list" {
  description = "NSX-T Service Creation using IP Protocol, Options for Protocols: See Readme Port Information.txt"
  type = map(object({
    display_name_service = string
	display_name_entry = string
	protocol = string
	}))
	default = {
	"config_1" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	}
  }
}
variable "nsxt_policy_service_icmp_entry_list_no_code" {
  description = "NSX-T Service Creation using ICMPv4 or ICMPv6 with no code, Options for Protocols: See Readme Port Information.txt"
  type = map(object({
    display_name_service = string
	display_name_entry = string
	protocol = string
	icmp_type = string
	}))
	default = {
	"config_1" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	icmp_type = ""
	},
	"config_2" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	icmp_type = ""
	}
  }
}
variable "nsxt_policy_service_icmp_entry_list_code" {
  description = "NSX-T Service Creation using ICMPv4 or ICMPv6 with code, Options for Protocols: See Readme Port Information.txt"
  type = map(object({
    display_name_service = string
	display_name_entry = string
	protocol = string
	icmp_type = string
	icmp_code = string
	}))
	default = {
	"config_1" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	icmp_type = ""
	icmp_code = ""
	},
	"config_2" = {
	display_name_service = ""
	display_name_entry = ""
	protocol = ""
	icmp_type = ""
	icmp_code = ""
	}
  }
}
variable "nsxt_policy_service_igmp_entry_list" {
  description = "NSX-T Service Creation using IGMP Protocol"
  type = map(object({
    display_name_service = string
	display_name_entry = string
	}))
	default = {
	"config_1" = {
	display_name_service = ""
	display_name_entry = ""
	}
  }
}


