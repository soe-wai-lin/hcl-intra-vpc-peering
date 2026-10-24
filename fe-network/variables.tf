variable "region" {
  description = "AWS region where the frontend VPC will be created."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for VPC and related resource names."
  type        = string
}

variable "environment" {
  description = "Deployment environment tag."
  type        = string
}

variable "availability_zones" {
  description = "Three Availability Zones used by the public and private subnets."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) == 3
    error_message = "Exactly three Availability Zones must be provided."
  }
}

variable "fe_vpc_cidr" {
  description = "IPv4 CIDR block for the frontend VPC."
  type        = string
}

variable "fe_public_subnet_cidrs" {
  description = "Three IPv4 CIDR blocks for frontend public subnets."
  type        = list(string)

  validation {
    condition     = length(var.fe_public_subnet_cidrs) == 3
    error_message = "Exactly three frontend public subnet CIDRs must be provided."
  }
}

variable "fe_private_subnet_cidrs" {
  description = "Three IPv4 CIDR blocks for frontend private subnets."
  type        = list(string)

  validation {
    condition     = length(var.fe_private_subnet_cidrs) == 3
    error_message = "Exactly three frontend private subnet CIDRs must be provided."
  }
}