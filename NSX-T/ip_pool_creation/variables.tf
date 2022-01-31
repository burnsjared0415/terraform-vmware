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
variable "nat_pool_name" { 
  description = "This the object name for the IP pool that is seen when first looking at IP Pools and Subnet Name in NSX-T"
  type = string
  default =  ""
}
variable "nat_ip_cidr" { 
  description = "This is the CIDR of the IP Pool"
  type = string
  default =  ""
}
variable "nat_ip_start" { 
  description = "This is the Starting IP address of the pool"
  type = string
  default =  ""
}
variable "nat_ip_end" { 
  description = "This is the Ending IP address of the pool"
  type = string
  default =  ""
}