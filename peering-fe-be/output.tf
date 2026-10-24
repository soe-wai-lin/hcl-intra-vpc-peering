# output "fe-pri-sgp-01-id" {
#   description = "Frontend private security group 01 ID."
#   value       = aws_security_group.fe_pri_sgp_01.id
# }

# output "fe-pri-sgp-02-id" {
#   description = "Frontend private security group 02 ID."
#   value       = aws_security_group.fe_pri_sgp_02.id
# }

# output "fe-pri-sgp-03-id" {
#   description = "Frontend private security group 03 ID."
#   value       = aws_security_group.fe_pri_sgp_03.id
# }

# output "fe-public-sg-id" {
#   description = "Frontend public security group ID."
#   value       = aws_security_group.fe_pub_sgp.id
# }

output "fe_to_be_peering_connection_id" {
  description = "Frontend to backend VPC peering connection ID."
  value       = aws_vpc_peering_connection.fe_to_be.id
}