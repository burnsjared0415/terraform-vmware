## AVI Provider
provider "avi" {
  avi_username = var.avi_username
  avi_tenant = "admin"
  avi_password = var.avi_password
  avi_controller = var.avi_controller
  avi_version = "21.1.3"
}

## NSX-T Provider
provider "nsxt" {
  host                  = var.nsx_address
  username              = var.nsx_user
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
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

## Content Library
resource "vsphere_content_library" "library" {
  name  = var.vc_contentlib
  storage_backing = [data.vsphere_datastore.datastore.id]
}

## Collects the data of the specified Overlay Transport Zone
data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = var.overlay_tz
}

## Collects the data of the T1 Gateway Specified
data "nsxt_policy_tier1_gateway" "tier1_gateway" {
  display_name = var.tier1_name
}

## Collects the data of the DHCP Server Specified
data "nsxt_policy_dhcp_server" "dhcp_server" {
  display_name = var.dhcp_server_name
}

## Create Segments with DHCP Server configured
resource "nsxt_policy_segment" "segment_dhcp" {
  display_name = var.segment_dhcp_name
  connectivity_path = data.nsxt_policy_tier1_gateway.tier1_gateway.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  dhcp_config_path = data.nsxt_policy_dhcp_server.dhcp_server.path
  subnet {
    cidr = var.segment_dhcp_segment_gateway_cidr
    dhcp_ranges = [var.segment_dhcp_segment_dhcp_ip_range]
    dhcp_v4_config {
    server_address = var.segment_dhcp_segment_dhcp_ip_address_for_segment
    lease_time = 36000
    }
  }
}

## Create NSX-T Credentials for AVI NSX-T Cloud
resource "avi_cloudconnectoruser" "nsx_t" {
    name = var.avi_nsxt_cred_name
    tenant_ref = "/api/tenant/?name=admin"
	nsxt_credentials {
    username = var.nsx_user
    password = var.nsx_password
  }
}

## Create vCenter Credentials for AVI NSX-T Cloud
resource "avi_cloudconnectoruser" "vcenter" {
    name = var.avi_vcenter_cred_name
    tenant_ref = "/api/tenant/?name=admin"
	vcenter_credentials {
    username = var.vcenter_user
    password = var.vcenter_password
  }
}

resource "avi_cloud" "nsxt_cloud" {
    name = var.avi_cloud_name_nsx
    tenant_ref = "/api/tenant/?name=admin"
	vtype = var.avi_cloud_type_nsx
	obj_name_prefix = var.obj_name_prefix_nsx
	dhcp_enabled = true
	dns_provider_ref = avi_ipamdnsproviderprofile.test_dns_nsx.id
	ipam_provider_ref = avi_ipamdnsproviderprofile.test_ipam_nsx.id
	nsxt_configuration {
    nsxt_url = var.nsx_address
    nsxt_credentials_ref = avi_cloudconnectoruser.nsx_t.id
	  management_network_config {
      transport_zone = data.nsxt_policy_transport_zone.overlay_tz.path
      tz_type = "OVERLAY"
      overlay_segment {
        tier1_lr_id = data.nsxt_policy_tier1_gateway.tier1_gateway.path
        segment_id  = nsxt_policy_segment.segment_dhcp.path
      }
    }
    data_network_config {
      transport_zone = data.nsxt_policy_transport_zone.overlay_tz.path
      tz_type = "OVERLAY"
      tier1_segment_config {
        segment_config_mode = "TIER1_SEGMENT_MANUAL"
        manual {
          tier1_lrs {
            tier1_lr_id = data.nsxt_policy_tier1_gateway.tier1_gateway.path
            segment_id  = nsxt_policy_segment.segment_dhcp.path
          }
        }
      }
    }
  }
}

## Create NSX ipam profile
resource "avi_ipamdnsproviderprofile" "test_ipam_nsx" {
	name	= var.ipam_name_nsx
	type	= "IPAMDNS_TYPE_INTERNAL"
	internal_profile {
		usable_networks {
			nw_ref = nsxt_policy_segment.segment_dhcp.id
		}
	}
}

## Create NSX dns profile
resource "avi_ipamdnsproviderprofile" "test_dns_nsx" {
	name	= var.dns_profile_name_nsx
	type	= "IPAMDNS_TYPE_INTERNAL_DNS"
	internal_profile {
		dns_service_domain {
			domain_name  = var.dns_domain_name
			pass_through = false
			record_ttl   = 30
		}
	}
}

## Create AVI Content Lib
resource "avi_vcenterserver" "vcenter" {
  name = var.vsphere_server_address
  content_lib {
    id = vsphere_content_library.library.id
  }
  vcenter_url = var.vsphere_server_address
  vcenter_credentials_ref = avi_cloudconnectoruser.vcenter.id
  cloud_ref = avi_cloud.nsxt_cloud.id
}

## Create Service Engine Group for NSX-T Cloud
resource "avi_serviceenginegroup" "nsxt_cloud" {
    name = var.segroup_nsx_name
	se_name_prefix = var.se_name_prefix_nsx
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
	cloud_ref = avi_cloud.nsxt_cloud.id
	vcenters {
	 vcenter_ref = avi_vcenterserver.vcenter.id
     nsxt_datastores {
      include = true
      ds_ids = [data.vsphere_datastore.datastore.id]
     }
     nsxt_clusters {
      include = true
      cluster_ids = [data.vsphere_compute_cluster.cluster.id]
     }
	}		
}