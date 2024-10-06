locals {
 ansible_dir   = "../../../Ansible"
 inventory_dir = "${local.ansible_dir}/inventory"
}
data "template_file" "nodes_inventory" {
  template = file("${local.inventory_dir}/hosts.tpl")
  vars = {
    master_nodes_ip = join("\n", [flatten(proxmox_virtual_environment_vm.vm1.ipv4_addresses)[1]])
  }
}
resource "local_file" "nodes_inventory" {
 content  = data.template_file.nodes_inventory.rendered
 filename = "${local.inventory_dir}/hosts.ini"
provisioner "local-exec" {
command = "ANSIBLE_CONFIG=${local.ansible_dir}/ansible.cfg ansible-playbook -i ${local_file.nodes_inventory.filename} ${local.ansible_dir}/playbook.yml -u srvadmin"
}
}