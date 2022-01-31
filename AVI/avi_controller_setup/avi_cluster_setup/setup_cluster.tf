## AVI Provider, the AVI Contoller line will be given based on the first ip address of the first controller that was deployed
provider "avi" {
  avi_username = var.avi_username
  avi_tenant = "admin"
  avi_password = var.avi_default_password
  avi_controller = data.vsphere_virtual_machine.avi_contoller_ova[0].vapp[0].properties.mgmt-ip
  avi_version = "21.1.3"
}

## vSphere Provider
provider "vsphere" {
  user           = var.vcenter_user
  password       = var.vcenter_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}


## vCenter DataCenter
data "vsphere_datacenter" "dc" { 
  name = var.vsphere_datacenter
}

data "vsphere_virtual_machine" "avi_contoller_ova" {
  count = length(var.avi_controller_name_list)
  name = var.avi_controller_name_list[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

## Update Password First AVI Controller
resource "avi_useraccount" "avi_user" {
  username     = var.avi_username
  old_password = var.avi_default_password
  password     = var.avi_password
}

## Build AVI Cluster with 3 Nodes (Only runs if there are more than 2 in the list)
resource "avi_cluster" "avi_cluster" {
  count = var.avi_build_cluster ? 1 : 0
  name = "cluster-0-1"
  tenant_ref = "/api/tenant/?name=admin"
  nodes {
    ip {
      type = "V4"
      addr = data.vsphere_virtual_machine.avi_contoller_ova[0].vapp[0].properties.mgmt-ip
    }
    name = data.vsphere_virtual_machine.avi_contoller_ova[0].name
  }
   nodes {
    ip {
      type = "V4"
      addr = data.vsphere_virtual_machine.avi_contoller_ova[1].vapp[0].properties.mgmt-ip
    }
    name = data.vsphere_virtual_machine.avi_contoller_ova[1].name
  }
   nodes {
    ip {
      type = "V4"
      addr = data.vsphere_virtual_machine.avi_contoller_ova[2].vapp[0].properties.mgmt-ip
    }
    name = data.vsphere_virtual_machine.avi_contoller_ova[2].name
  }
}