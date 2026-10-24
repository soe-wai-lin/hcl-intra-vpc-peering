output "be_vpc_id" {
  description = "Frontend VPC ID."
  value       = aws_vpc.be.id
}

output "be_public_subnet_01" {
  description = "Frontend public subnet IDs."
  value       = aws_subnet.be_public_01.id
}

output "be_public_subnet_01_subnet_cidr" {
  description = "Frontend public subnet CIDR blocks."
  value       = aws_subnet.be_public_01.cidr_block
}

output "be_public_subnet_02" {
  description = "Frontend public subnet IDs."
  value       = aws_subnet.be_public_02.id
}

output "be_public_subnet_02_subnet_cidr" {
  description = "Frontend public subnet CIDR blocks."
  value       = aws_subnet.be_public_02.cidr_block
}

output "be_public_subnet_03" {
  description = "Frontend public subnet IDs."
  value       = aws_subnet.be_public_03.id
}

output "be_public_subnet_03_subnet_cidr" {
  description = "Frontend public subnet CIDR blocks."
  value       = aws_subnet.be_public_03.cidr_block
}

output "be_private_subnet_01" {
  description = "Frontend private subnet IDs."
  value       = aws_subnet.be_private_01.id
}

output "be_private_subnet_01_subnet_cidr" {
  description = "Frontend private subnet CIDR blocks."
  value       = aws_subnet.be_private_01.cidr_block
}

output "be_private_subnet_02" {
  description = "Frontend private subnet IDs."
  value       = aws_subnet.be_private_02.id
}

output "be_private_subnet_02_subnet_cidr" {
  description = "Frontend private subnet CIDR blocks."
  value       = aws_subnet.be_private_02.cidr_block
}

output "be_private_subnet_03" {
  description = "Frontend private subnet IDs."
  value       = aws_subnet.be_private_03.id
}

output "be_private_subnet_03_subnet_cidr" {
  description = "Frontend private subnet CIDR blocks."
  value       = aws_subnet.be_private_03.cidr_block
}

output "be_nat_gateway_id" {
  description = "Frontend NAT Gateway ID."
  value       = aws_nat_gateway.be.id
}

output "be_internet_gateway_id" {
  description = "Frontend Internet Gateway ID."
  value       = aws_internet_gateway.be.id
}

output "be_public_route_table_id" {
  description = "Frontend public route table ID."
  value       = aws_route_table.be_public.id
}

output "be_private_route_table_01_id" {
  description = "Frontend private route table ID."
  value       = aws_route_table.be_private_rt_01.id
}

output "be_private_route_table_02_id" {
  description = "Frontend private route table ID."
  value       = aws_route_table.be_private_rt_02.id
}

output "be_private_route_table_03_id" {
  description = "Frontend private route table ID."
  value       = aws_route_table.be_private_rt_03.id
}

