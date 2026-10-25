variable "name_prefix" {
  description = "Prefix used for VPC and related resource names."
  type        = string
  default     = "be"
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

variable "be_network" {
  description = "The name of the backend network workspace."
  type        = string
  default     = "be-network"
}

variable "fe_sgp" {
  description = "The name of the frontend sgp workspace"
  type        = string
  default     = "fe-sgp"
}

variable "hcp_org_name" {
  description = "The name of hcp Org"
  type        = string
  default     = "swl-tfc"
}