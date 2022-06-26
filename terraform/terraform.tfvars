    region="us-west-1"
    vpc-cidr="192.168.0.0/16"
    env="Cassandra_test_env"
    public_subnets_cidr  = ["192.168.1.0/24", "192.168.2.0/24"]
    availability_zones   = ["us-west-1a", "us-west-1c"]
    instance_type = "t3.small"
    aws-private-key-location = "~/rolands_jankovskis.pem"
    aws-access-key-name = "rolands_jankovskis"