variable "name_prefix" {
  description = "Prefix used for VPC and related resource names."
  type        = string
  default     = "peering"
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

variable "be_network" {
  description = "The name of the backend network workspace."
  type        = string
  default     = "be-network"
}

variable "fe_network" {
  description = "The name of the frontend network workspace"
  type        = string
  default     = "fe-network"
}

variable "hcp_org_name" {
  description = "The name of hcp Org"
  type        = string
  default     = "swl-tfc"
}

# variable "vpc_a_id" {
#   description = "ID of the first VPC"
#   type        = string
# }

# variable "vpc_b_id" {
#   description = "ID of the second VPC"
#   type        = string
# }

# variable "vpc_a_route_table_ids" {
#   description = "Route table IDs for VPC A"
#   type        = list(string)
# }

# variable "vpc_b_route_table_ids" {
#   description = "Route table IDs for VPC B"
#   type        = list(string)
# }

