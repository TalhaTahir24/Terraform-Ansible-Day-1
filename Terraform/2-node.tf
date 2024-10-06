resource "proxmox_virtual_environment_vm" "vm1" {
  name        = "terraform"

  node_name = "NA"
  vm_id     = 199

clone {
 vm_id=2404
 full=true
}
network_device{
    bridge="V10"
}

  initialization {
    datastore_id="local-zfs"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

}
}
output "IP_Address" {
  value = flatten(proxmox_virtual_environment_vm.vm1.ipv4_addresses)[1]
}
