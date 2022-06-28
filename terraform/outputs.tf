/* resource "local_file" "ansible_inventory" {
  content = templatefile("./assets/templates/hosts.tpl", {
    hosts =  module.apache-ec2.*.public_dns
  })
  filename = "./assets/inventory/hosts.cfg"
} */