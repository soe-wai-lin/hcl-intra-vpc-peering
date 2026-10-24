variable "name_prefix" {
  description = "Prefix used for VPC and related resource names."
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources in."
  type        = string
}

variable "environment" {
  description = "Deployment environment tag."
  type        = string
}

variable "bastion_ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH into the bastion host."
  type        = list(string)
}

