variable "name_prefix" {
  description = "Prefix used for VPC and related resource names."
  type        = string
  default     = "fe"
}

variable "region" {
  description = "AWS region to deploy resources in."
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Deployment environment tag."
  type        = string
  default     = "dev"
}

variable "bastion_ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH into the bastion host."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "hcp_org_name" {
  type        = string
  default     = "swl-tfc"
  description = "Organization name of HCP"
}

variable "fe_network" {
  type        = string
  default     = "fe-network"
  description = "Workspace name of fe-network"
}

