## NSX variables
variable "nsx_user" { 
  description = "NSX User to Authenicate with"
  type = string
  default = ""
}
variable "nsx_password" { 
  description = "NSX Password for User above"
  type = string
  default = ""
}
variable "nsx_address" { 
  description = "FQDN or IP Address of NSX-T VIP or Manager"
  type = string
  default = ""
}

variable "dhcp_server_name" { 
  description = "Name of DHCP Server"
  type = string 
  default = ""
}
variable "edge_cluster" { 
  description = "Edge Cluster that DHCP Server will use"
  type = string
  default = ""
}
variable "dhcp_external_ip" { 
  description = "IP address of dhcp server not in NSX-T"
  type = list(string)
  default = [""]
}
variable "dhcp_relay_name" { 
  description = "Name of DHCP Relay"
  type = string
  default = ""
}



