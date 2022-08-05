locals {
  bastion_rules = [{
    description = var.ssh_description,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = ["${var.personal_cidr_block}"],
    }, {
    description = var.ssh_description,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = ["${var.zscaler1_cidr_block}"],
    }, {
    description = var.ssh_description,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = ["${var.zscaler2_cidr_block}"],
    }, {
    description = var.ssh_description,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = ["${var.zscaler3_cidr_block}"],
    }, {
    description = var.ssh_description,
    port        = var.ssh_port,
    protocol    = var.protocol,
    cidr_blocks = ["${var.zscaler4_cidr_block}"],
  }]
  lb_rules = [{
    description = var.http_description,
    port        = var.http_port,
    protocol    = var.protocol,
    cidr_blocks = ["${var.all_cidr_block}"],
  }]
}

resource "aws_security_group" "kien-bastion-sg" {
  name        = "${var.name}-bastion-sg"
  description = "${var.name}-bastion-sg"
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
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.all_cidr_block}"]
  }
}

resource "aws_security_group" "kien-lb-sg" {
  name        = "${var.name}-lb-sg"
  description = "${var.name}-lb-sg"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.lb_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}