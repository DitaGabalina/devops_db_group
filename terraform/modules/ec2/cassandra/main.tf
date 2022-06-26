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
}
