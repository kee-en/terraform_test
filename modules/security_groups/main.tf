locals {
  bastion_rules = [{
    description = var.description_ssh,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = [var.personal_cidr],
    }, {
    description = var.description_ssh,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = [var.zscaler1_cidr],
    }, {
    description = var.description_ssh,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = [var.zscaler2_cidr],
    }, {
    description = var.description_ssh,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = [var.zscaler3_cidr],
    }, {
    description = var.description_ssh,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = [var.zscaler4_cidr],
  }]
}

resource "aws_security_group" "kien-bastion-sg" {
  name        = "kien-bastion-sg"
  description = "kien-bastion-sg"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.bastion_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
