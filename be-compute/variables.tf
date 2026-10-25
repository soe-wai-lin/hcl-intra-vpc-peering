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

variable "bastion_instance_type" {
  description = "Instance type for the bastion host."
  type        = string
  default     = "t3.nano"
}

variable "private_instance_type" {
  description = "Instance type for the private hosts."
  type        = string
  default     = "t3.nano"
}

variable "be_network" {
  description = "The name of the backend network workspace."
  type        = string
  default     = "be-network"
}

variable "be_sgp" {
  description = "The name of the backend sgp workspace"
  type        = string
  default     = "be-sgp"
}

variable "hcp_org_name" {
  description = "The name of hcp Org"
  type        = string
  default     = "swl-tfc"
}