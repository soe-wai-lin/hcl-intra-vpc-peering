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

