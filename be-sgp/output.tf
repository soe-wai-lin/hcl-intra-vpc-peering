output "be_pri_sgp_01_id" {
  description = "Backend private security group 01 ID."
  value       = aws_security_group.be_pri_sgp_01.id
}

output "be_pri_sgp_02_id" {
  description = "Backend private security group 02 ID."
  value       = aws_security_group.be_pri_sgp_02.id
}

output "be_pri_sgp_03_id" {
  description = "Backend private security group 03 ID."
  value       = aws_security_group.be_pri_sgp_03.id
}

output "be_public_sg_id" {
  description = "Backend public security group ID."
  value       = aws_security_group.be_pub_sgp.id
}