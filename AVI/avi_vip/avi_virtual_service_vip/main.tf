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



## Collect AVI NSX-T Cloud for AVI Server Pool
data "avi_cloud" "avi_cloud_name_nsx" {
  name = var.avi_cloud_name_nsx
}

## Collect AVI vCenter Cloud for AVI Server Pool
data "avi_cloud" "avi_cloud_name_vcenter" {
  name = var.avi_cloud_name_vcenter
}

data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.tier1_name
}

## vCenter DataCenter
data "vsphere_datacenter" "dc" { 
  name = var.vc_datacenter 
}

## Collects the data of the vDS Port Group for Management for vCenter Cloud
data "vsphere_network" "port_group" {
  name = var.dvs_port_group
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Creation of AVI Virtual Service VIP for NSX-T Backed Cloud
resource "avi_vsvip" "virtual_service_1_vip_nsx" {
    for_each = var.virtual_service_list_nsxt
	name = each.value.virtual_service_name
    tenant_ref = "/api/tenant/?name=admin"
	cloud_ref = data.avi_cloud.avi_cloud_name_nsx.id
	tier1_lr = data.nsxt_policy_tier1_gateway.tier1_router.path
	vip {
		vip_id = each.value.virtual_service_id
		ip_address {
		 type = "V4"
		 addr = each.value.virtual_service_1_vip_ip_addr
        }		
	   }
}

## Collect vCenter Port Group for Placement Network on Virtual Service VIP
data "avi_network" "vcenter_network" {
    name = var.dvs_port_group
    cloud_ref = data.avi_cloud.avi_cloud_name_vcenter.id
}

## Creation of AVI Virtual Service VIP for vCenter Backed Cloud
resource "avi_vsvip" "virtual_service_2_vip_vcenter" {
    for_each = var.virtual_service_list_vcenter
	name = each.value.virtual_service_name
    tenant_ref = "/api/tenant/?name=admin"
	cloud_ref = data.avi_cloud.avi_cloud_name_vcenter.id
	vip {
		vip_id = each.value.virtual_service_id
		ip_address {
		 type = "V4"
		 addr = each.value.virtual_service_1_vip_ip_addr
        }
        placement_networks {
           network_ref = data.avi_network.vcenter_network.id
           subnet {
		    ip_addr {
		      addr = var.avi_vcenter_placement_network
			  type = "V4"
			}
            mask = var.avi_vcenter_placement_network_mask
           }
		}
	}
}