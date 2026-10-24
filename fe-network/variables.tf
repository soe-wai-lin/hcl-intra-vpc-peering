variable "region" {
  description = "AWS region where the frontend VPC will be created."
  type        = string
  default     = "ap-southeast-1"
}

variable "name_prefix" {
  description = "Prefix used for VPC and related resource names."
  type        = string
  default     = "fe"
}

variable "environment" {
  description = "Deployment environment tag."
  type        = string
  default     = "dev"
}

variable "availability_zones" {
  description = "Three Availability Zones used by the public and private subnets."
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

  validation {
    condition     = length(var.availability_zones) == 3
    error_message = "Exactly three Availability Zones must be provided."
  }
}

variable "fe_vpc_cidr" {
  description = "IPv4 CIDR block for the frontend VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "fe_public_subnet_cidrs" {
  description = "Three IPv4 CIDR blocks for frontend public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  validation {
    condition     = length(var.fe_public_subnet_cidrs) == 3
    error_message = "Exactly three frontend public subnet CIDRs must be provided."
  }
}

variable "fe_private_subnet_cidrs" {
  description = "Three IPv4 CIDR blocks for frontend private subnets."
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  validation {
    condition     = length(var.fe_private_subnet_cidrs) == 3
    error_message = "Exactly three frontend private subnet CIDRs must be provided."
  }
}