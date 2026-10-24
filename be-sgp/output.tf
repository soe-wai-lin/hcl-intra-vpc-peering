output "be-pri-sgp-01-id" {
  description = "Backend private security group 01 ID."
  value       = aws_security_group.be_pri_sgp_01.id
}

output "be-pri-sgp-02-id" {
  description = "Backend private security group 02 ID."
  value       = aws_security_group.be_pri_sgp_02.id
}

output "be-pri-sgp-03-id" {
  description = "Backend private security group 03 ID."
  value       = aws_security_group.be_pri_sgp_03.id
}

output "be-public-sg-id" {
  description = "Backend public security group ID."
  value       = aws_security_group.be_pub_sgp.id
}