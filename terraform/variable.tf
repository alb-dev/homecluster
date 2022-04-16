# proxmox hypervisor variables
variable "pm_password" {}
# proxmox node variables
variable "ssh_key" {}
variable "ciuser" {}
variable "cipassword" {}

variable "common" {
  type = map(string)
  default = {
    ciuser        = "alb"
    os_type       = "cloud-init"
    clone         = "linux-alma-server-8"
    search_domain = "intern.breidenbach.koeln"
    nameserver    = "192.168.178.10"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    cp-01 = {
      id          = 4010
      cidr        = "192.168.178.12/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 8192
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-02"
    }
#    k8s-cp02 = {
#      id          = 4011
#      cidr        = "192.168.178.12/24"
#      ceph_cidr   = "10.75.33.41/24"
#      cores       = 3
#      gw          = "192.168.178.1"
#      memory      = 4096
#      disk        = "50G"
#      target_node = "pve-02"
#    },
#    k8s-cp03 = {
#      id          = 4012
#      cidr        = "192.168.178.13/24"
#      ceph_cidr   = "10.75.33.42/24"
#      cores       = 3
#      gw          = "192.168.178.1"
#      memory      = 4096
#      disk        = "50G"
#      target_node = "pve-02"
#    }
  }
}
variable "workers" {
  type = map(map(string))
  default = {
    wk-01 = {
      id          = 4020
      cidr        = "192.168.178.13/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-02"
    },
    wk-02 = {
      id          = 4021
      cidr        = "192.168.178.14/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-02"
    },
   wk-03 = {
      id          = 4022
      cidr        = "192.168.178.15/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-01"
    },
    wk-04 = {
      id          = 4023
      cidr        = "192.168.178.16/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-01"
    },
  }
}