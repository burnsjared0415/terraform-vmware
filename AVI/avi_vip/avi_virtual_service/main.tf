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

## Collect data AVI NSX-T Cloud information
data "avi_cloud" "nsxt_cloud" {
  name = var.avi_cloud_name_nsx
}

## Collect data AVI vCenter Cloud information
data "avi_cloud" "vcenter_cloud" {
  name = var.avi_cloud_name_vcenter
}

## Collect data NSX-T Tier1 gateway for Virtual Service
data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.tier1_name
}

## Collect data AVI Application Profile for Virtual Service
data "avi_applicationprofile" "application_profile_1" {
  name = var.avi_applicationprofile_name
}

## Collect data AVI VRF Context for NSX-T Segment for Virtual Service
data "avi_vrfcontext" "segment" {
    name = var.nsxt_segment
}

## Collect data AVI Service Engine Group for NSX-T Cloud for Virtual Service
data "avi_serviceenginegroup" "nsxt_cloud" {
  name = var.segroup_nsx_name
}

## Collect data AVI Service Engine Group for vCenter Cloud for Virtual Service
data "avi_serviceenginegroup" "vcenter_cloud" {
  name = var.segroup_vcenter_name
}

## Collect data AVI Pool for NSX-T for Virtual Service
data "avi_pool" "nsxt_pool" {
    name = var.avi_nsxt_pool_name
}

## Collect data AVI Pool for vCenter for Virtual Service
data "avi_pool" "vcenter_pool" {
    name = var.avi_vcenter_pool_name
}

## Collect data AVI Virtual Service VIP for NSX-T for Virtual Service
data "avi_vsvip" "vsvip_1_nsxt" {
    name = var.avi_vsvip_1_name_nsxt
}

## Collect data AVI Virtual Service VIP for vCenter for Virtual Service
data "avi_vsvip" "vsvip_2_vcenter" {
    name = var.avi_vsvip_1_name_vcenter
}

## Create Virtual Service for NSX-T Cloud with Data above
resource "avi_virtualservice" "vip_1_nsx" {
  name = var.avi_virtual_service_name_nsxt
  tenant_ref = "/api/tenant/?name=admin"
  cloud_ref = data.avi_cloud.nsxt_cloud.id
  pool_ref = data.avi_pool.nsxt_pool.id
  vrf_context_ref = data.avi_vrfcontext.segment.id
  vsvip_ref = data.avi_vsvip.vsvip_1_nsxt.id
  application_profile_ref = data.avi_applicationprofile.application_profile_1.id
  se_group_ref = data.avi_serviceenginegroup.nsxt_cloud.id
  services {
    port = var.avi_virtual_service_port_nsxt
  }
}

## Collect VRF Context from vCenter Cloud
data "avi_vrfcontext" "vcenter_vrfcontext" {
    name = var.avi_vcenter_vrfcontext_for_pool
    cloud_ref = data.avi_cloud.avi_cloud_name_vcenter.id
}

## Create Virtual Service for vCenter Cloud with Data Collected
resource "avi_virtualservice" "vip_2_vcenter" {
  name = var.avi_virtual_service_name_vcenter
  tenant_ref = "/api/tenant/?name=admin"
  cloud_ref = data.avi_cloud.vcenter_cloud.id
  pool_ref = data.avi_pool.vcenter_pool.id
  vrf_context_ref = data.avi_vrfcontext.vcenter_vrfcontext.id
  vsvip_ref = data.avi_vsvip.vsvip_2_vcenter.id
  application_profile_ref = data.avi_applicationprofile.application_profile_1.id
  se_group_ref = data.avi_serviceenginegroup.vcenter_cloud.id
  services {
    port = var.avi_virtual_service_port_vcenter
  }
}
