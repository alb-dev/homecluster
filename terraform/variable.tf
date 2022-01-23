# proxmox hypervisor variables
variable "pm_password" {}
# proxmox node variables
variable "ssh_key" {}
variable "ciuser" {}
variable "cipassword" {}

variable "common" {
  type = map(string)
  default = {
    ciuser        = "nao"
    os_type       = "cloud-init"
    clone         = "linux-ubuntu-server-20.04"
    search_domain = "intern.breidenbach.koeln"
    nameserver    = "192.168.178.1"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    k8s-cp01 = {
      id          = 4010
      cidr        = "192.168.178.11/24"
 #     ceph_cidr   = "10.75.33.40/24"
      cores       = 3
      gw          = "192.168.178.1"
      memory      = 4096
      disk        = "50G"
      target_node = "pve-01"
    },
    k8s-cp02 = {
      id          = 4011
      cidr        = "192.168.178.12/24"
#      ceph_cidr   = "10.75.33.41/24"
      cores       = 3
      gw          = "192.168.178.1"
      memory      = 4096
      disk        = "50G"
      target_node = "pve-02"
    },
    k8s-cp03 = {
      id          = 4012
      cidr        = "192.168.178.13/24"
#      ceph_cidr   = "10.75.33.42/24"
      cores       = 3
      gw          = "192.168.178.1"
      memory      = 4096
      disk        = "50G"
      target_node = "pve-02"
    }
  }
}
variable "workers" {
  type = map(map(string))
  default = {
    k8s-wk01 = {
      id          = 4020
      cidr        = "192.168.178.14/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk        = "50G"
      target_node = "pve-01"
    },
    k8s-wk02 = {
      id          = 4021
      cidr        = "192.168.178.15/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk        = "50G"
      target_node = "pve-02"
    },
    k8s-wk03 = {
      id          = 4022
      cidr        = "192.168.178.16/24"
      cores       = 6
      gw          = "192.168.178.1"
      memory      = 12288
      disk        = "50G"
      target_node = "pve-02"
    },
  }
}