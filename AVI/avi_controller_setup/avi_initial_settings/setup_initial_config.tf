## AVI Provider
provider "avi" {
  avi_username = var.avi_username
  avi_tenant = "admin"
  avi_password = var.avi_password
  avi_controller = var.avi_controller_ip
  avi_version = "21.1.3"
}

data "avi_systemconfiguration" "systemconfiguration" {
   uuid = "default"
}

resource "avi_systemconfiguration" "avi" {
    for_each = var.dns_ntp_ip_addresses
	uuid = "default"
	common_criteria_mode = var.common_criteria_mode
	default_license_tier = var.license_type
	dns_configuration {
	search_domain = var.search_domain
	 server_list {
	  addr = each.value.dns1
	  type = "V4"
	 }
	 server_list {
	  addr = each.value.dns2
	  type = "V4"
	 }
	}
	ntp_configuration {
	 ntp_servers {
	  server {
	    addr = each.value.ntp1
	    type = "DNS"
	  }
	 }
	 ntp_servers {
	  server {
	    addr = each.value.ntp2
	    type = "DNS"
	  }
	 }
	}
	welcome_workflow_complete = true
}
