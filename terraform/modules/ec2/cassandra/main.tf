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
    user_data = "${file("./assets/secrets/install-ssh_key.sh")}"
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
    user_data = "${file("./assets/secrets/install-ssh_key.sh")}"
}

resource "local_file" "hosts_cfg" {
  content = templatefile("./assets/templates/hosts.tpl",
    {
      cassandra_node1 = aws_instance.cassandra_db_node_1.private_ip
      cassandra_node2 = aws_instance.cassandra_db_node_2.private_ip
    }
  )
  filename = "./assets/inventory/hosts.cfg"
}