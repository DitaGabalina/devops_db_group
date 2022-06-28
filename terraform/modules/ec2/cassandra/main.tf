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


resource "aws_instance" "cassandra_db_node_1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name = "${var.aws-keypair-name}"
  subnet_id = var.subnet_id[0]
  vpc_security_group_ids = var.vpc_security_group_idsc
  tags = {
    Name = "cassandra_db_node_1"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo echo \"${file("./assets/secrets/public-key.pub")}\" >> .ssh/authorized_keys",
      "sudo apt update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade"
    ]

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.aws_private_key}")
      host        = self.public_dns
    }
  }
}

resource "aws_instance" "cassandra_db_node_2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name = "${var.aws-keypair-name}"
  subnet_id = var.subnet_id[0]
  vpc_security_group_ids = var.vpc_security_group_idsc
  tags = {
    Name = "cassandra_db_node_2"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo echo \"${file("./assets/secrets/public-key.pub")}\" >> .ssh/authorized_keys",
    ]

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.aws_private_key}")
      host        = self.public_dns
    }
  }
}

resource "local_file" "hosts_cfg" {
  content = templatefile("./assets/templates/hosts.tpl",
    {
      cassandra_node1 = aws_instance.cassandra_db_node_1.public_dns
      cassandra_node2 = aws_instance.cassandra_db_node_2.public_dns
    }
  )
  filename = "./assets/inventory/hosts.cfg"
}