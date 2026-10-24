region                  = "ap-southeast-1"
name_prefix             = "fe"
environment             = "fe"
availability_zones      = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
fe_vpc_cidr             = "10.0.0.0/16"
fe_public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
fe_private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
