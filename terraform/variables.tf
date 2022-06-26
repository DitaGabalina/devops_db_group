variable "tags" {
  default = {
    Name        = " Cassandra_cluster "
    Environment = " Cassandra_test_env "
    Product     = " Cassandra_cluster "
  }
}
variable "region" {
  default = "eu-north-1"
}


variable "instance_type" {
  description = "Value of the Name tag for the EC2 instance type (proconfigured optionds of OS/RAM/HDD etc )"
  type        = string
  default     = "t3.small"
}

variable "ami" {
  description = "Value of the AMI template.  See https://eu-north-1.console.aws.amazon.com/ec2/v2/home?region=eu-north-1#AMICatalog)"
  type        = string
  default     = "ami-0440e5026412ff23f"
}