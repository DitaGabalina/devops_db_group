variable "region" {
  default = "eu-north-1"
}

variable "tags" {
  default = {
    Name        = " Cassandra_cluster "
    Environment = " Cassandra_test_env "
    Product     = " Cassandra_cluster "
  }
}

variable "vpc-cidr" {
  description = "The CIDR to assign to VPC"
}

variable "instance_type" {
  description = "Value of the Name tag for the EC2 instance type (proconfigured optionds of OS/RAM/HDD etc )"
  type        = string
  default     = "t3.small"
}

variable "env" {
  description = "The Deployment environment"
}

variable "public_subnets_cidr" {
  type        = list
  description = "VPC public subnets"
}

variable "availability_zones" {
  type        = list
  description = "AWS availabity zones"
}

variable "aws-private-key-location"{
  description = "SSH Private Key used for connecting to instances"
}

variable "aws-access-key-name"{
    description = "AWS key pair name used for connecting to instances"
}