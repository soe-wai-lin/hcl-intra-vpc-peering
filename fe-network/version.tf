terraform {
  required_version = "v1.16.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }
  
  cloud {

    organization = "swl-tfc"

    workspaces {
      name = "fe-network"
    }
  }
}

