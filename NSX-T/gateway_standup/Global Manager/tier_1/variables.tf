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
variable "tier1_gateway_list" { 
  description = "Name of Tier_1 Gateway can be 1 or many"
  type = list(string)
  default = [""]  
}
variable "tier0_name" { 
  description = "Name of Tier 0 GW in NSX-T"
  type = string
  default = ""
}
variable "edge_cluster" { 
  description = "Edge Cluster that Tier 1 Gateway will Connect"
  type = string
  default = ""
}
variable "local_manager_name" { 
  description = "This is the Site Name for the Local Managers you want to create the dfw policy on"
  type = string
  default =  ""
}
