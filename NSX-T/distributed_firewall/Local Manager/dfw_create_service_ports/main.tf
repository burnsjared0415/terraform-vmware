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

## Creation of Service with UDP or TCP as the Protocol
resource "nsxt_policy_service" "tcp_udp" {
  for_each = var.nsxt_policy_service_tcp_udp_list
  display_name = each.value.display_name_service

  l4_port_set_entry {
    display_name      = each.value.display_name_entry
    protocol          = each.value.protocol
    destination_ports = each.value.destination_ports
	source_ports = each.value.source_ports
  }
}

## Creation of Service with Algorithm as the Protocol
resource "nsxt_policy_service" "algorithm_entry" {
  for_each = var.nsxt_policy_service_algorithm_entry_list
  display_name = each.value.display_name_service

  algorithm_entry {
    display_name      = each.value.display_name_entry
	algorithm = each.value.alg
    destination_port = each.value.destination_ports
	source_ports = each.value.source_ports
  }
}

## Creation of Service with IP as the Protocol
resource "nsxt_policy_service" "ip_protocol_entry" {
  for_each = var.nsxt_policy_service_ip_protocol_entry_list
  display_name = each.value.display_name_service

  ip_protocol_entry {
    display_name      = each.value.display_name_entry
    protocol          = each.value.protocol
  }
}

## Creation of Service with ICMPv4 or ICMPv6 as the Protocol with no icmp_code
resource "nsxt_policy_service" "icmp_entry_no_code" {
  for_each = var.nsxt_policy_service_icmp_entry_list_no_code
  display_name = each.value.display_name_service

  icmp_entry {
    display_name      = each.value.display_name_entry
    protocol          = each.value.protocol
	icmp_type = each.value.icmp_type
  }
}

## Creation of Service with ICMPv4 or ICMPv6 as the Protocol with icmp_code
resource "nsxt_policy_service" "icmp_entry_code" {
  for_each = var.nsxt_policy_service_icmp_entry_list_code
  display_name = each.value.display_name_service

  icmp_entry {
    display_name      = each.value.display_name_entry
    protocol          = each.value.protocol
	icmp_type = each.value.icmp_type
	icmp_code = each.value.icmp_code
  }
}

## Creation of Service with IGMP as the Protocol
resource "nsxt_policy_service" "igmp_entry" {
  for_each = var.nsxt_policy_service_igmp_entry_list
  display_name = each.value.display_name_service

  igmp_entry {
    display_name      = each.value.display_name_entry
  }
}

