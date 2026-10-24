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

variable "bastion_instance_type" {
  description = "Instance type for the bastion host."
  type        = string
}

variable "private_instance_type" {
  description = "Instance type for the private hosts."
  type        = string
}