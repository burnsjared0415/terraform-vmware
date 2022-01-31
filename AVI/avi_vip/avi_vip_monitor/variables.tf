## AVI variables
variable "avi_controller" { 
  description = "FQDN or IP address of Controller to Authenicate"
  type = string
  default = ""
}
variable "avi_username" { 
  description = "Default User Account"
  type = string
  default = ""
}
variable "avi_password" { 
  description = "Password for Default User Account"
  type = string
  default = ""
}
variable "monitor_name_port_list" {
  description = "List of Monitoring Names and Ports"
  type = map(object({
    monitor_name = string
	monitor_port = string
	}))
	default = {
	"config_1" = {
	monitor_name = ""
	monitor_port = ""
	},
	"config_2" = {
	monitor_name = ""
	monitor_port = ""
	}
	"config_3" = {
	monitor_name = ""
	monitor_port = ""
	}
  }
}