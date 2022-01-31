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
## Creates Empty IP Pool Container
resource "nsxt_policy_ip_pool" "pool1" {
  display_name = var.nat_pool_name
}

## Updates IP Pool Container Above with IP information
resource "nsxt_policy_ip_pool_static_subnet" "static_subnet1" {
  display_name = var.nat_pool_name
  pool_path    = nsxt_policy_ip_pool.pool1.path
  cidr         = var.nat_ip_cidr

  allocation_range {
    start = var.nat_ip_start
    end   = var.nat_ip_end
  }
}



