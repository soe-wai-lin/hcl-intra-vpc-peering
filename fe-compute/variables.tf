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

variable "fe_sgp" {
  type        = string
  default     = "fe-sgp"
  description = "Workspace name of fe-sgp"
}
