terraform {
  required_providers {
    avi = {
      source = "vmware/avi"
      version = "21.1.3"
    }
	 nsxt = {
      source = "vmware/nsxt"
      version = "3.2.5"
    }
  }
}