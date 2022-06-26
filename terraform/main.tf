terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}


resource "aws_security_group" "cassandra-secgroup" {
  name        = "cassandra-secgroup"
  description = "Allow inbound / outbond traffic"

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }



}

resource "aws_instance" "cassandra_app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "eu_north-1-ansible-master-key"
  user_data              = file("app-server-init-script.sh")
  vpc_security_group_ids = [aws_security_group.cassandra-secgroup.id]
  tags = {
    Name = "cassandra_app_server"
  }
}

resource "aws_instance" "cassandra_db_node_1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "eu_north-1-ansible-master-key"
  user_data              = file("db-node-init-script.sh")
  vpc_security_group_ids = [aws_security_group.cassandra-secgroup.id]
  tags = {
    Name = "cassandra_db_node_1"
  }
}

resource "aws_instance" "cassandra_db_node_2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "eu_north-1-ansible-master-key"
  user_data              = file("db-node-init-script.sh")
  vpc_security_group_ids = [aws_security_group.cassandra-secgroup.id]
  tags = {
    Name = "cassandra_db_node_2"
  }
}
