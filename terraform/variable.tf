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
    search_domain = "int.swalb.io"
    nameserver    = "192.168.178.5"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    k8s-cp-01 = {
      id          = 4010
      cidr        = "192.168.178.12/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 6144
      disk0        = "50G"
      target_node = "pve-02"
    }
    k8s-cp-02 = {
      id          = 4011
      cidr        = "192.168.178.13/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 6144
      disk0        = "50G"
      target_node = "pve-01"
    },
    k8s-cp-03 = {
      id          = 4012
      cidr        = "192.168.178.14/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 6144
      disk0        = "50G"
      target_node = "pve-01"
    }
  }
}
variable "workers" {
  type = map(map(string))
  default = {
    k8s-wk-01 = {
      id          = 4020
      cidr        = "192.168.178.15/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12000
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-02"
    },
    k8s-wk-02 = {
      id          = 4021
      cidr        = "192.168.178.16/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12000
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-02"
    },
    k8s-wk-03 = {
      id          = 4022
      cidr        = "192.168.178.17/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 10000
      disk0        = "50G"
      disk1        = "60G"
      target_node = "pve-01"
    },
  }
}