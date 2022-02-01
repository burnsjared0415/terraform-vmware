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

## Collect AVI Health Monitor for AVI Server Pool
data "avi_healthmonitor" "monitor" {
	name = var.avi_monitor_name
}

## Collect AVI NSX-T Cloud for AVI Server Pool
data "avi_cloud" "avi_cloud_name_nsx" {
  name = var.avi_cloud_name_nsx
}

## Collect AVI vCenter Cloud for AVI Server Pool
data "avi_cloud" "avi_cloud_name_vcenter" {
  name = var.avi_cloud_name_vcenter
}

## Collect NSX-T Tier 1 for NSX-T AVI Server Pool
data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.tier1_name
}


## Build NSX-T AVI Server Pool
resource "avi_pool" "pool_1_nsx" {
    name = var.pool_1_name_nsx
    tenant_ref = "/api/tenant/?name=admin"
	cloud_ref = data.avi_cloud.avi_cloud_name_nsx.id
	enabled = true
	default_server_port = var.pool_1_default_server_port_nsx
	lb_algorithm = "LB_ALGORITHM_ROUND_ROBIN"
	tier1_lr = data.nsxt_policy_tier1_gateway.tier1_router.path
	health_monitor_refs = [data.avi_healthmonitor.monitor.id]	 
}

## Add Servers to NSX-T Server Pool
resource "avi_server" "server_1_pool_1_nsx" {
    for_each = var.pool_member_nsx_list
	ip = each.value.ip_address
	pool_ref = avi_pool.pool_1_nsx.id
	hostname = each.value.hostname
	enabled = true
}

## Collect vCenter Network information from vCenter for assignment of port group to pool
data "avi_network" "vcenter_network" {
    name = var.dvs_port_group
    cloud_ref = data.avi_cloud.avi_cloud_name_vcenter.id
}

## Creation of VRF Context for vCenter Virtual Service Pool(Required to allow creation of Virtual Service)
resource "avi_vrfcontext" "vcenter_context" {
  name = var.avi_vcenter_vrfcontext_for_pool
  tenant_ref = "/api/tenant/?name=admin"
	cloud_ref = data.avi_cloud.avi_cloud_name_vcenter.id
}

## Build vCenter AVI Server Pool
resource "avi_pool" "pool_2_vcenter" {
  name = var.pool_2_name_vcenter
  tenant_ref = "/api/tenant/?name=admin"
	cloud_ref = data.avi_cloud.avi_cloud_name_vcenter.id
	enabled = true
  vrf_ref = avi_vrfcontext.vcenter_context.id
	default_server_port = var.pool_2_default_server_port_vcenter
	lb_algorithm = "LB_ALGORITHM_ROUND_ROBIN"
	health_monitor_refs = [data.avi_healthmonitor.monitor.id]
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

## Add Servers to vCenter Server Pool
resource "avi_server" "server_2_pool_1_vcenter" {
	for_each = var.pool_member_vcenter_list
	ip = each.value.ip_address
	pool_ref = avi_pool.pool_2_vcenter.id
	hostname = each.value.hostname
	enabled = true
}