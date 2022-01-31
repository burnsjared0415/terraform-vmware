## AVI Provider
provider "avi" {
  avi_username = var.avi_username
  avi_tenant = "admin"
  avi_password = var.avi_password
  avi_controller = var.avi_controller
  avi_version = "21.1.3"
}


## vSphere Provider
provider "vsphere" {
  user           = var.vcenter_user
  password       = var.vcenter_password
  vsphere_server = var.vsphere_server_address

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

## vCenter DataCenter
data "vsphere_datacenter" "dc" { 
  name = var.vc_datacenter 
}

## vCenter Cluster and DataCenter
data "vsphere_compute_cluster" "cluster" {
  name = var.vc_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

## vCenter Datastore
data "vsphere_datastore" "datastore" {
  name = var.vc_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

## Collects the data of the vDS for Management for vCenter Cloud
data "vsphere_distributed_virtual_switch" "dvs" {
  name          = var.vcenter_dvs
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Collects the data of the vDS Port Group for Management for vCenter Cloud
data "vsphere_network" "port_group" {
  name = var.dvs_port_group
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Create vCenter Credentials for AVI vCenter Cloud
resource "avi_cloudconnectoruser" "vcenter" {
    name = var.avi_vcenter_cred_name
    tenant_ref = "/api/tenant/?name=admin"
	vcenter_credentials {
    username = var.vcenter_user
    password = var.vcenter_password
  }
}

## Create vCenter ipam profile
resource "avi_ipamdnsproviderprofile" "test_ipam_vcenter" {
	name	= var.ipam_name_vcenter
	type	= "IPAMDNS_TYPE_INTERNAL"
	internal_profile {
		usable_networks {
			nw_ref = data.vsphere_network.port_group.id
		}
	}
}

## Create vCenter dns profile
resource "avi_ipamdnsproviderprofile" "test_dns_vcenter" {
	name	= var.dns_profile_name_vcenter
	type	= "IPAMDNS_TYPE_INTERNAL_DNS"
	internal_profile {
		dns_service_domain {
			domain_name  = var.dns_domain_name
			pass_through = false
			record_ttl   = 30
		}
	}
}

## Create AVI Cloud for vCenter (At this moment there is a bug in Adding Service Group to Cloud)
resource "avi_cloud" "vcenter" {
    name = var.avi_cloud_name_vcenter
    tenant_ref = "/api/tenant/?name=admin"
	vtype = var.avi_cloud_type_vcenter
	dns_provider_ref = avi_ipamdnsproviderprofile.test_dns_vcenter.id
	ipam_provider_ref = avi_ipamdnsproviderprofile.test_ipam_vcenter.id
	dhcp_enabled = true
	dns_resolvers {
	 resolver_name = var.resolver_name
	 min_ttl = "5"
	 nameserver_ips {
	  addr = var.dns_ip_address
	  type = "V4"
	 } 
	}
	vcenter_configuration {
	  username = var.vcenter_user
	  password = var.vcenter_password
	  datacenter = var.vc_datacenter
	  vcenter_url = var.vsphere_server_address
	  management_network = data.vsphere_network.port_group.name
	  privilege = "WRITE_ACCESS"
	  management_ip_subnet {
	    ip_addr {
		  addr = var.avi_se_mgmt_network
		  type = "V4"
		}
	  mask = var.avi_se_mgmt_network_mask
	  }
	}
}

##Create Service Engine Group for vCenter Cloud
resource "avi_serviceenginegroup" "vcenter_cloud" {
    name = var.segroup_vcenter_name
	se_name_prefix = var.se_name_prefix_vcenter
    max_vs_per_se = var.max_vs_per_se
	min_scaleout_per_vs = var.min_scaleout_per_vs
	vcpus_per_se = var.vcpus_per_se
	memory_per_se = var.memory_per_se
	ha_mode = var.ha_mode
	algo = var.algo
	distribute_load_active_standby = var.distribute_load_active_standby_false
    auto_redistribute_active_standby_load = var.auto_redistribute_active_standby_load
	se_dp_max_hb_version = var.se_dp_max_hb_version
	disk_per_se = var.disk_per_se
	cloud_ref = avi_cloud.vcenter.id
	vcenter_clusters {
	  cluster_refs	= [
			"https://${var.avi_controller}/api/vimgrclusterruntime/${data.vsphere_compute_cluster.cluster.id}-${avi_cloud.vcenter.uuid}"
		]
		include = true
	}
	vcenter_datastore_mode = "VCENTER_DATASTORE_SHARED"
	vcenter_datastores {
	  datastore_name = var.vc_datastore
	}
	vcenter_datastores_include = true
}


