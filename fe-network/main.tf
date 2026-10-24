locals {
  common_tags = {
    environment = var.environment
  }
}

resource "aws_vpc" "fe" {
  cidr_block           = var.fe_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-vpc"
  })
}

resource "aws_subnet" "fe_public_01" {
  # count                   = 3
  vpc_id                  = aws_vpc.fe.id
  cidr_block              = var.fe_public_subnet_cidrs[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pub-subnet-01"
    Tier = "public"
  })
}

resource "aws_subnet" "fe_public_02" {
  # count                   = 3
  vpc_id                  = aws_vpc.fe.id
  cidr_block              = var.fe_public_subnet_cidrs[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pub-subnet-02"
    Tier = "public"
  })
}

resource "aws_subnet" "fe_public_03" {
  # count                   = 3
  vpc_id                  = aws_vpc.fe.id
  cidr_block              = var.fe_public_subnet_cidrs[2]
  availability_zone       = var.availability_zones[2]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pub-subnet-03"
    Tier = "public"
  })
}

resource "aws_subnet" "fe_private_01" {
  # count                   = 3
  vpc_id                  = aws_vpc.fe.id
  cidr_block              = var.fe_private_subnet_cidrs[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-subnet-01"
    Tier = "private"
  })
}

resource "aws_subnet" "fe_private_02" {
  # count                   = 3
  vpc_id                  = aws_vpc.fe.id
  cidr_block              = var.fe_private_subnet_cidrs[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-subnet-02"
    Tier = "private"
  })
}

resource "aws_subnet" "fe_private_03" {
  # count                   = 3
  vpc_id                  = aws_vpc.fe.id
  cidr_block              = var.fe_private_subnet_cidrs[2]
  availability_zone       = var.availability_zones[2]
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-subnet-03"
    Tier = "private"
  })
}

resource "aws_internet_gateway" "fe" {
  vpc_id = aws_vpc.fe.id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-igw"
  })
}

resource "aws_route_table" "fe_public" {
  vpc_id = aws_vpc.fe.id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pub-rt"
  })
}

resource "aws_route" "fe_public_internet" {
  route_table_id         = aws_route_table.fe_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.fe.id
}

resource "aws_route_table_association" "fe_public" {
  # count          = 3
  subnet_id      = aws_subnet.fe_public_01.id
  route_table_id = aws_route_table.fe_public.id
}

resource "aws_route_table" "fe_private_rt_01" {
  vpc_id = aws_vpc.fe.id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-rt-01"
  })
}

resource "aws_route_table_association" "fe_private_01" {
  subnet_id      = aws_subnet.fe_private_01.id
  route_table_id = aws_route_table.fe_private_rt_01.id
}

resource "aws_route_table" "fe_private_rt_02" {
  vpc_id = aws_vpc.fe.id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-rt-02"
  })
}

resource "aws_route_table_association" "fe_private_02" {
  subnet_id      = aws_subnet.fe_private_02.id
  route_table_id = aws_route_table.fe_private_rt_02.id
}

resource "aws_route_table" "fe_private_rt_03" {
  vpc_id = aws_vpc.fe.id

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-pri-rt-03"
  })
}

resource "aws_route_table_association" "fe_private_03" {
  subnet_id      = aws_subnet.fe_private_03.id
  route_table_id = aws_route_table.fe_private_rt_03.id
}

resource "aws_eip" "fe_nat" {
  domain = "vpc"
  tags   = merge(local.common_tags, { Name = "${var.name_prefix}-fe-nat-eip" })
}

resource "aws_nat_gateway" "fe" {
  allocation_id = aws_eip.fe_nat.id
  subnet_id     = aws_subnet.fe_public_01.id
  depends_on    = [aws_internet_gateway.fe]
  tags          = merge(local.common_tags, { Name = "${var.name_prefix}-nat" })
}

resource "aws_route" "fe_private_nat" {
  route_table_id         = aws_route_table.fe_private_rt_01.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.fe.id
}
