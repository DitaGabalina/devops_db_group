module "devops_db_group-vpc"{
    source = "./modules/vpc"
    region=var.region
    vpc_cidr=var.vpc-cidr
    environment=var.env
    public_subnets_cidr = var.public_subnets_cidr
    availability_zones = var.availability_zones
}

module "apache-ec2"{
    source = "./modules/ec2/apache"
    region=var.region
    instance_type = var.instance_type
    vpcid = module.devops_db_group-vpc.vpc_id
    vpc_security_group_idsc = module.devops_db_group-vpc.security_groups_ids
    subnet_id = module.devops_db_group-vpc.public_subnets_id[0]
    aws_private_key = var.aws-private-key-location
    aws-keypair-name = var.aws-access-key-name
    apache-ec2-depends_on = [module.cassandra-ec2.inventorycreate]

}

module "cassandra-ec2"{
    source = "./modules/ec2/cassandra"
    region=var.region
    instance_type = var.instance_type
    vpcid = module.devops_db_group-vpc.vpc_id
    vpc_security_group_idsc = module.devops_db_group-vpc.security_groups_ids
    subnet_id = module.devops_db_group-vpc.public_subnets_id[0]
    aws_private_key = var.aws-private-key-location
    aws-keypair-name = var.aws-access-key-name
}