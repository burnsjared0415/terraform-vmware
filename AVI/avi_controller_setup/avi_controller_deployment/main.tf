## vSphere Provider
provider "vsphere" {
  user           = var.vcenter_user
  password       = var.vcenter_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
