provider "aws" {
  region  = var.region
}

data "aws_ami"  "ubuntu" {
most_recent = true
filter {
name = "name"
values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}
filter {
name = "virtualization-type"
values = ["hvm"]
}
owners = ["099720109477"]

}

resource "aws_instance" "apache_server" {
depends_on=[var.apache-ec2-depends_on]

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name = "${var.aws-keypair-name}"
  subnet_id = var.subnet_id[0]
  vpc_security_group_ids = var.vpc_security_group_idsc
  tags = {
    Name = "apache_server"
  }


provisioner "file" {
source = "./assets/secrets/secret-key.pem"
destination = "/home/ubuntu/.ssh/id_rsa"

 connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.aws_private_key}")
      host        = self.public_dns
    }
}
provisioner "file" {
source = "./assets/inventory/hosts.cfg"
destination = "/tmp/hosts"

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.aws_private_key}")
      host        = self.public_dns
    }

}
provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 ~/.ssh/id_rsa",
      "sudo apt-add-repository ppa:ansible/ansible -y",
      "sudo apt update -y",
      "sudo apt install ansible -y",
      "sudo mv /etc/ansible/hosts /etc/ansible/hosts.bak",
      "sudo mv /tmp/hosts /etc/ansible/hosts",
      "mkdir ~/ansible-codes",
      "git clone -b main https://github.com/DitaGabalina/devops_db_group.git ~/ansible-codes/devops_db_group",
      "ansible-playbook ~/ansible-codes/devops_db_group/ansible/cassandra_node-setup.yaml --ssh-common-args='-o StrictHostKeyChecking=accept-new'",
      "ansible-playbook ~/ansible-codes/devops_db_group/ansible/cassandra_main_node-data_load.yaml",
      "ansible-playbook ~/ansible-codes/devops_db_group/ansible/cassandra-cluster-creation.yaml",
      "ansible-playbook ~/ansible-codes/devops_db_group/ansible/apache_server-setup.yaml --ssh-common-args='-o StrictHostKeyChecking=accept-new'"
    ]

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.aws_private_key}")
      host        = self.public_dns
    }
  }
}
