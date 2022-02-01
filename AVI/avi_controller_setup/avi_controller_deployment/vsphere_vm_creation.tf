## vCenter DataCenter
data "vsphere_datacenter" "dc" { 
  name = var.vc_datacenter 
}

## vCenter Cluster and DataCenter
data "vsphere_compute_cluster" "cluster" {
  name          = var.vc_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

## vCenter Datastore
data "vsphere_datastore" "datastore" {
  name          = var.vc_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

## Collect vSphere Port Group
data "vsphere_network" "net" {
  name = var.vc_dvs_portgroup_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

## Collect ESXi Host in Cluster (Required by Terraform to build OVF)
data "vsphere_host" "host" {
  name          = "jbvcfmgtesx01.vsanpe.vmware.com"
  datacenter_id = data.vsphere_datacenter.dc.id
}


data "vsphere_ovf_vm_template" "ovfLocal" {
  name = "node"
  disk_provisioning = "thin"
  resource_pool_id  = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id      = data.vsphere_datastore.datastore.id
  host_system_id    = data.vsphere_host.host.id
  local_ovf_path = var.avi_ova_url
  ovf_network_map   = {
    "Management" : data.vsphere_network.net.id
  }
}

resource "vsphere_virtual_machine" "avi_contoller_ova" {
  for_each = var.avi_controller_list
  name = each.key
  datastore_id = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  host_system_id = data.vsphere_host.host.id
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  datacenter_id = data.vsphere_datacenter.dc.id
  num_cpus = data.vsphere_ovf_vm_template.ovfLocal.num_cpus
  memory = data.vsphere_ovf_vm_template.ovfLocal.memory
   dynamic "network_interface" {
    for_each = data.vsphere_ovf_vm_template.ovfLocal.ovf_network_map
    content {
      network_id = network_interface.value
    }
  }
  ovf_deploy {
    local_ovf_path = data.vsphere_ovf_vm_template.ovfLocal.local_ovf_path
	disk_provisioning    = "thin"
    ip_protocol          = "IPV4"
    ip_allocation_policy = "STATIC_MANUAL"
	ovf_network_map = data.vsphere_ovf_vm_template.ovfLocal.ovf_network_map
    }
  vapp {
    properties = {
     "mgmt-ip" = each.value
     "mgmt-mask"  = var.avi_controller_netmask
     "default-gw" = var.avi_controller_gateway
    }
  }
}
