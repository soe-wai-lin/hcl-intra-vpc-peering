locals {
  common_tags = {
    environment = var.environment
  }
}

resource "aws_vpc_peering_connection" "fe_to_be" {
  vpc_id      = data.terraform_remote_state.fe_network.outputs.fe_vpc_id
  peer_vpc_id = data.terraform_remote_state.be_network.outputs.be_vpc_id
  auto_accept = true

  tags = merge(local.common_tags,{
    Name = "${var.name_prefix}-fe-to-be"
  })
}

resource "aws_route" "fe_to_be_private_02" {
  # for_each = toset([
  #   data.terraform_remote_state.fe_network.outputs.fe_private_route_table_02_id,
  #   data.terraform_remote_state.fe_network.outputs.fe_private_route_table_03_id
  # ])

  # route_table_id            = each.value
  route_table_id            = data.terraform_remote_state.fe_network.outputs.fe_private_route_table_02_id
  destination_cidr_block    = data.terraform_remote_state.be_network.outputs.be_private_subnet_02_subnet_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fe_to_be.id
}

resource "aws_route" "fe_to_be_private_03" {
  # for_each = toset([
  #   data.terraform_remote_state.fe_network.outputs.fe_private_route_table_02_id,
  #   data.terraform_remote_state.fe_network.outputs.fe_private_route_table_03_id
  # ])

  # route_table_id            = each.value
  route_table_id            = data.terraform_remote_state.fe_network.outputs.fe_private_route_table_03_id
  destination_cidr_block    = data.terraform_remote_state.be_network.outputs.be_private_subnet_03_subnet_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fe_to_be.id
}

resource "aws_route" "be_to_fe_private_02" {
  route_table_id            = data.terraform_remote_state.be_network.outputs.be_private_route_table_02_id
  destination_cidr_block    = data.terraform_remote_state.fe_network.outputs.fe_private_subnet_02_subnet_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fe_to_be.id
}

resource "aws_route" "be_to_fe_private_03" {
  route_table_id            = data.terraform_remote_state.be_network.outputs.be_private_route_table_03_id
  destination_cidr_block    = data.terraform_remote_state.fe_network.outputs.fe_private_subnet_03_subnet_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fe_to_be.id
}