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
    k8s-master01 = {
      id          = 4010
      cidr        = "192.168.178.11/24"
 #     ceph_cidr   = "10.75.33.40/24"
      cores       = 3
      gw          = "192.168.178.1"
      memory      = 4096
      disk        = "50G"
      target_node = "pve-01"
    },
    k8s-master02 = {
      id          = 4011
      cidr        = "192.168.178.12/24"
#      ceph_cidr   = "10.75.33.41/24"
      cores       = 3
      gw          = "192.168.178.1"
      memory      = 4096
      disk        = "50G"
      target_node = "pve-02"
    },
    k8s-master03 = {
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
    k8s-worker01 = {
      id          = 4020
      cidr        = "192.168.178.230/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 8192
      disk        = "50G"
      target_node = "pve-01"
    },
    k8s-worker02 = {
      id          = 4021
      cidr        = "192.168.178.231/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 8192
      disk        = "50G"
      target_node = "pve-01"
    },
    k8s-worker03 = {
      id          = 4022
      cidr        = "192.168.178.232/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 8192
      disk        = "50G"
      target_node = "pve-02"
    },
    k8s-worker04 = {
      id          = 4023
      cidr        = "192.168.178.233/24"
      cores       = 4
      gw          = "192.168.178.1"
      memory      = 8192
      disk        = "50G"
      target_node = "pve-02"
    },
  }
}