resource "proxmox_vm_qemu" "kube-worker" {
  for_each = var.workers

  name        = each.key
  target_node = each.value.target_node
  agent       = 1
  clone       = var.common.clone
  vmid        = each.value.id
  memory      = each.value.memory
  cores       = each.value.cores
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = each.value.disk
    format  = "raw"
    ssd     = 1
    discard = "on"
  }
  serial {
    id   = 0
    type = "socket"
  }
  bootdisk  = "scsi0"
  scsihw    = "virtio-scsi-pci"
  os_type   = "cloud-init"
  ipconfig0 = "ip=${each.value.cidr},gw=${each.value.gw}"
  # ipconfig1    = "ip=${each.value.ceph_cidr}"
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  searchdomain = var.common.search_domain
  nameserver   = var.common.nameserver
  sshkeys      = var.ssh_key
}