variable "tags" {
  default = {
    Name        = " Cassandra_cluster "
    Environment = " Cassandra_test_env "
    Product     = " Cassandra_cluster "
  }
}
variable "region" {
}


variable "instance_type" {
  description = "Value of the Name tag for the EC2 instance type (proconfigured optionds of OS/RAM/HDD etc )"
  type        = string
  default     = "t3.small"
}

variable "vpc_security_group_idsc"{

description = "value"
}
variable "vpcid" {
  description = "ID of the VPC in which security resources are deployed"
  type = string
}

variable "subnet_id" {
  description = "The az that the resources will be launched"
}
variable "aws_private_key"{
  description = "SSH Private Key used for connecting to instances"
}


variable "aws-keypair-name"{
    description = "AWS key pair name used for connecting to instances"
}