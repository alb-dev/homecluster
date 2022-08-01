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
    clone         = "linux-alma-server-9"
    search_domain = ""
    nameserver    = "192.168.178.5"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    k8s-01 = {
      id          = 4010
      cidr        = "192.168.178.12/24"
      cores       = 5
      gw          = "192.168.178.1"
      memory      = 10240
      disk0        = "125G"
      target_node = "pve-02"
    },
    k8s-02 = {
      id          = 4011
      cidr        = "192.168.178.13/24"
      cores       = 5
      gw          = "192.168.178.1"
      memory      = 10240
      disk0        = "125G"
      target_node = "pve-02"
    },
    k8s-03 = {
      id          = 4012
      cidr        = "192.168.178.14/24"
      cores       = 5
      gw          = "192.168.178.1"
      memory      = 10240
      disk0        = "125G"
      target_node = "pve-02"
    }
  }
}
#variable "workers" {
#  type = map(map(string))
#  default = {
#    k8s-wk-01 = {
#      id          = 4020
#      cidr        = "192.168.178.15/24"
#      cores       = 6
#      gw          = "192.168.178.1"
#      memory      = 12000
#      disk0        = "50G"
#      disk1        = "100G"
#      target_node = "pve-02"
#    },
#    k8s-wk-02 = {
#      id          = 4021
#      cidr        = "192.168.178.16/24"
#      cores       = 6
#      gw          = "192.168.178.1"
#      memory      = 12000
#      disk0        = "50G"
#      disk1        = "100G"
#      target_node = "pve-02"
#    },
#    k8s-wk-03 = {
#      id          = 4022
#      cidr        = "192.168.178.17/24"
#      cores       = 8
#      gw          = "192.168.178.1"
#      memory      = 24000
#      disk0        = "50G"
#      disk1        = "250G"
#      target_node = "pve-01"
#    },
#  }
#}