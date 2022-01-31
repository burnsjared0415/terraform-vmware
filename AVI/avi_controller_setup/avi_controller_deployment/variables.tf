## AVI variables
variable "avi_node_number" { 
   description = " Number of Appliances to Deploy (has to be either a odd number for clustering, or just 1)"
   type = string
   default = "3"  
}

variable "avi_controller_list" {
   description = "List is used to map name of the Controller and Ip address"
   type = map
   default = {
   "avicontrol1" = ""
   "avicontrol2" = ""
   "avicontrol3" = ""
   }
}

variable "avi_controller_netmask" { 
   description = "Avi Controller Subnet Mask"
   type = string
   default = ""   
}
variable "avi_controller_gateway" { 
   description = "Avi Controller Gateway"
   type = string
   default = ""  
}
variable "avi_username" { 
   description = "Avi UserName"
   type = string
   default = ""  
}

variable "avi_ova_url" { 
   description = "Location of File local to machine running Terraform, this will be a ova file"
   type = string
   default =  ""
}

## vCenter variables 
variable "vcenter_user" { 
   description = "vCenter User Name"
   type = string
   default =  ""
}
variable "vcenter_password" { 
   description = "vCenter User Password"
   type = string
   default =  ""
}
variable "vsphere_server" { 
   description = "vCenter FQDN or ip address"
   type = string
   default =  ""
}
variable "vc_cluster" { 
   description = "vCenter Cluster Name"
   type = string
   default =  ""
}
variable "vc_datastore" { 
   description = "vCenter DataStore Name"
   type = string
   default =  ""
}
variable "vc_datacenter" { 
   description = "vCenter Datacenter Name"
   type = string
   default =  ""
}
variable "vc_dvs_name" { 
   description = "vCenter vDS Name"
   type = string
   default =  ""
}
variable "vc_dvs_portgroup_name" { 
   description = "vCenter vDS Port Group"
   type = string
   default =  ""
}
