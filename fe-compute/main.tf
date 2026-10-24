locals {
  common_tags = {
    environment = var.environment
  }
}

data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "fe_bastion" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = var.bastion_instance_type
  subnet_id                   = data.terraform_remote_state.fe_network.outputs.fe_public_subnet_01
  vpc_security_group_ids      = data.terraform_remote_state.fe_sgp.outputs.fe-public-sg-id != null ? [data.terraform_remote_state.fe_sgp.outputs.fe-public-sg-id] : []
  associate_public_ip_address = true
  # key_name                    = "singapore-key"
  key_name                    = aws_key_pair.fe_keypair.key_name

#   metadata_options {
#     http_endpoint               = "enabled"
#     http_tokens                 = "required"
#     http_put_response_hop_limit = 1
#   }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-bastion"
  })
}

data "aws_ssm_parameter" "ubuntu_24604" {
  name = "/aws/service/canonical/ubuntu/server/26.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

resource "aws_instance" "fe_private_01" {
  ami                         = data.aws_ssm_parameter.ubuntu_24604.value
  instance_type               = var.private_instance_type
  subnet_id                   = data.terraform_remote_state.fe_network.outputs.fe_private_subnet_01
  vpc_security_group_ids      = data.terraform_remote_state.fe_sgp.outputs.fe-pri-sgp-01-id != null ? [data.terraform_remote_state.fe_sgp.outputs.fe-pri-sgp-01-id] : []
  associate_public_ip_address = false
  # key_name                    = "singapore-key"
  key_name                    = aws_key_pair.fe_keypair.key_name

#   metadata_options {
#     http_endpoint               = "enabled"
#     http_tokens                 = "required"
#     http_put_response_hop_limit = 1
#   }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-private-01"
  })
}

resource "aws_instance" "fe_private_02" {
  ami                         = data.aws_ssm_parameter.ubuntu_24604.value
  instance_type               = var.private_instance_type
  subnet_id                   = data.terraform_remote_state.fe_network.outputs.fe_private_subnet_02
  vpc_security_group_ids      = data.terraform_remote_state.fe_sgp.outputs.fe-pri-sgp-02-id != null ? [data.terraform_remote_state.fe_sgp.outputs.fe-pri-sgp-02-id] : []
  associate_public_ip_address = false
  key_name                    = aws_key_pair.fe_keypair.key_name

#   metadata_options {
#     http_endpoint               = "enabled"
#     http_tokens                 = "required"
#     http_put_response_hop_limit = 1
#   }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-private-02"
  })
}

resource "aws_instance" "fe_private_03" {
  ami                         = data.aws_ssm_parameter.ubuntu_24604.value
  instance_type               = var.private_instance_type
  subnet_id                   = data.terraform_remote_state.fe_network.outputs.fe_private_subnet_03
  vpc_security_group_ids      = data.terraform_remote_state.fe_sgp.outputs.fe-pri-sgp-03-id != null ? [data.terraform_remote_state.fe_sgp.outputs.fe-pri-sgp-03-id] : []
  associate_public_ip_address = false
  # key_name                    = "singapore-key"
  key_name                    = aws_key_pair.fe_keypair.key_name

#   metadata_options {
#     http_endpoint               = "enabled"
#     http_tokens                 = "required"
#     http_put_response_hop_limit = 1
#   }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-private-03"
  })
}

#------------------------------------------
# SSH KeyPair
#------------------------------------------

locals {
  fe_private_key_filename = "${var.name_prefix}-ssh-key.pem"
}

resource "tls_private_key" "fe_keypair" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "fe_keypair" {
  key_name   = local.fe_private_key_filename
  public_key = tls_private_key.fe_keypair.public_key_openssh
}

output "fe_private_key" {
  value     = tls_private_key.fe_keypair.private_key_openssh
  sensitive = true
}

## To Download the private key, run the following command in Laptop/PC terminal:
## terraform output -raw fe_private_key > fe-sgp-ssh-key.key
## chmod 400 fe-sgp-ssh-key.key



