region                  = "ap-southeast-1"
name_prefix             = "be"
environment             = "be"
availability_zones      = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
be_vpc_cidr             = "192.168.0.0/16"
be_public_subnet_cidrs  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
be_private_subnet_cidrs = ["192.168.253.0/24", "192.168.254.0/24", "192.168.255.0/24"]
