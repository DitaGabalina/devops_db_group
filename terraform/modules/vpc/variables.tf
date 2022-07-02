variable "environment" {
  description = "The Deployment environment"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "public_subnets_cidr" {
  type        = list
  description = "VPC public subnets"
}
variable "private_subnets_cidr" {
  type        = list
  description = "VPC private subnets"
}
variable "region" {
  description = "AWS region to work with"
}

variable "availability_zones" {
  type        = list
  description = "AWS availabity zones"
}

