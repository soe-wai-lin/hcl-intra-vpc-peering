locals {
  common_tags = {
    environment = var.environment
  }
}

resource "aws_security_group" "fe_pub_sgp" {
  name        = "${var.name_prefix}-pub-sgp"
  description = "SSH access to the frontend bastion from explicitly allowed IPv4 CIDRs."
  # vpc_id      = data.terraform_remote_state.fe_network.outputs.fe_vpc_id
  vpc_id = data.tfe_outputs.fe_network.nonsensitive_values.fe_vpc_id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pub-sgp-01"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_bastion_ssh" {
  for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pub_sgp.id
  description       = "SSH from an explicitly allowed source CIDR."
  cidr_ipv4         = each.value
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-bastion-ssh"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_bastion_icmp" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pub_sgp.id
  description       = "Ping allowed source CIDR."
  #   cidr_ipv4         = each.value
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = -1
  ip_protocol = "icmp"
  to_port     = -1

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-bastion-icmp"
  })
}

resource "aws_vpc_security_group_egress_rule" "fe_bastion_all_ipv4" {
  security_group_id = aws_security_group.fe_pub_sgp.id
  description       = "Outbound IPv4 connectivity for bastion administration."
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-bastion-egress"
  })
}

resource "aws_security_group" "fe_pri_sgp_01" {
  name        = "${var.name_prefix}-pri-sgp-01"
  description = "SSH access to the frontend bastion from explicitly allowed IPv4 CIDRs."
  # vpc_id      = data.terraform_remote_state.fe_network.outputs.fe_vpc_id
  vpc_id = data.tfe_outputs.fe_network.nonsensitive_values.fe_vpc_id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-01"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_01_ingress_ssh" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pri_sgp_01.id
  description       = "Inbound IPv4 connnectivity"
  #   cidr_ipv4         = each.value
  referenced_security_group_id = aws_security_group.fe_pub_sgp.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-01-ingress-ssh"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_01_ingress_icmp" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pri_sgp_01.id
  description       = "Inbound IPv4 connnectivity"
  #   cidr_ipv4         = each.value
  referenced_security_group_id = aws_security_group.fe_pub_sgp.id
  from_port                    = -1
  ip_protocol                  = "icmp"
  to_port                      = -1

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-01-ingress-icmp"
  })
}

resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp_01_egress" {
  security_group_id = aws_security_group.fe_pri_sgp_01.id
  description       = "Outbound IPv4 connectivity"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-01-egress"
  })
}

resource "aws_security_group" "fe_pri_sgp_02" {
  name = "${var.name_prefix}-pri-sgp-02"
  # vpc_id      = data.terraform_remote_state.fe_network.outputs.fe_vpc_id
  vpc_id = data.tfe_outputs.fe_network.nonsensitive_values.fe_vpc_id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-02"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_02_ingress_ssh" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pri_sgp_02.id
  description       = "Inbound IPv4 connnectivity"
  #   cidr_ipv4         = each.value
  referenced_security_group_id = aws_security_group.fe_pri_sgp_01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-02-ingress-ssh"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_02_ingress_icmp" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pri_sgp_02.id
  description       = "Inbound IPv4 connnectivity"
  #   cidr_ipv4         = each.value
  referenced_security_group_id = aws_security_group.fe_pri_sgp_01.id
  from_port                    = -1
  ip_protocol                  = "icmp"
  to_port                      = -1

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-02-ingress-icmp"
  })
}

# resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_02_ingress_icmp_from_be_pri_sgp_02" {
# #   for_each          = toset(var.bastion_ssh_cidr_blocks)
#   security_group_id = aws_security_group.fe_pri_sgp_02.id
#   description       = "Inbound IPv4 connnectivity from be-pri-sgp-02"
#   referenced_security_group_id = data.terraform_remote_state.be_sgp.outputs.be-pri-sgp-02-id
#   from_port         = -1
#   ip_protocol       = "icmp"
#   to_port           = -1

#   tags = merge(local.common_tags, {
#     Name = "${var.name_prefix}-pri-sgp-02-ingress-icmp"
#   })
# }

resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp_02_egress" {
  security_group_id = aws_security_group.fe_pri_sgp_02.id
  description       = "Outbound IPv4 connectivity"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-02-egress"
  })
}

resource "aws_security_group" "fe_pri_sgp_03" {
  name = "${var.name_prefix}-pri-sgp-03"
  # vpc_id      = data.terraform_remote_state.fe_network.outputs.fe_vpc_id
  vpc_id = data.tfe_outputs.fe_network.nonsensitive_values.fe_vpc_id
  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-03"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_03_ingress_ssh" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pri_sgp_03.id
  description       = "Inbound IPv4 connnectivity"
  #   cidr_ipv4         = each.value
  referenced_security_group_id = aws_security_group.fe_pri_sgp_01.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-03-ingress-ssh"
  })
}

resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_03_ingress_icmp" {
  #   for_each          = toset(var.bastion_ssh_cidr_blocks)
  security_group_id = aws_security_group.fe_pri_sgp_03.id
  description       = "Inbound IPv4 connnectivity"
  #   cidr_ipv4         = each.value
  referenced_security_group_id = aws_security_group.fe_pri_sgp_01.id
  from_port                    = -1
  ip_protocol                  = "icmp"
  to_port                      = -1

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-03-ingress-icmp"
  })
}

# resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp_03_ingress_icmp_from_be_pri_sgp_03" {
# #   for_each          = toset(var.bastion_ssh_cidr_blocks)
#   security_group_id = aws_security_group.fe_pri_sgp_03.id
#   description       = "Inbound IPv4 connnectivity from be-pri-sgp-03"
# #   cidr_ipv4         = each.value
#   referenced_security_group_id = data.terraform_remote_state.be_sgp.outputs.be-pri-sgp-03-id
#   from_port         = -1
#   ip_protocol       = "icmp"
#   to_port           = -1

#   tags = merge(local.common_tags, {
#     Name = "${var.name_prefix}-pri-sgp-03-ingress-icmp"
#   })
# }

resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp_03_egress" {
  security_group_id            = aws_security_group.fe_pri_sgp_03.id
  description                  = "Outbound IPv4 connectivity"
  referenced_security_group_id = aws_security_group.fe_pri_sgp_01.id
  ip_protocol                  = "tcp"
  from_port                    = 0
  to_port                      = 65535

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-sgp-03-egress"
  })
}

