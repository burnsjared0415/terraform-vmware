## AVI variables
variable "avi_username" {
	description = "AVI Default UserName"
	type = string
	default = ""
}
variable "avi_default_password" {
	description = "AVI Default Password, you can get this from the myvmware.com download page, on the right side as you download you will see a box that says Resources "
	type = string
	default = ""
}
variable "avi_password" {
	description = "AVI New Password that will be set requirements: Minimum of 8 characters, Contains at least one character in each of 3 of the 4 following categories: Uppercase letters, Lowercase letters, Digits, Special characters"
	type = string
	default = ""
}
variable "avi_controller_name_list" { 
   description = "Names of AVI Controllers, to create cluster you must have more than 2 nodes in the list below"
   type = list(string)
   default =  [""]
}
variable "avi_build_cluster" {
	description = "Do you want to Cluster AVI Nodes? if you set to true the list of controllers must be more than 2"
	type = bool
	default = true
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
   description = "vCenter url or address"
   type = string
   default =  ""
}

variable "vsphere_datacenter" {
	description = "vCenter DataCenter"
	type = string
	default = ""
}

