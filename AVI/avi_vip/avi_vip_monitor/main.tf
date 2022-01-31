## AVI Provider
provider "avi" {
  avi_username = var.avi_username
  avi_tenant = "admin"
  avi_password = var.avi_password
  avi_controller = var.avi_controller
  avi_version = "21.1.3"
}

## Creation of Health Monitors, this can be 1 new monitor or many new monitors
resource "avi_healthmonitor" "monitor_1" {
    for_each = var.monitor_name_port_list
    name = each.value.monitor_name
    tenant_ref = "/api/tenant/?name=admin"
	type = "HEALTH_MONITOR_TCP"
	monitor_port = each.value.monitor_port
}