locals {
  bastion_rules = [{
    description = "${var.description_ssh}",
    port        = "${var.port_ssh}",
    protocol    = "${var.protocol_type}",
    cidr_blocks = ["${var.personal_cidr_block}"],
    }, {
    description = "${var.description_ssh}",
    port        = "${var.port_ssh}",
    protocol    = "${var.protocol_type}",
    cidr_blocks = ["${var.zscaler1_cidr_block}"],
    }, {
    description = "${var.description_ssh}",
    port        = "${var.port_ssh}",
    protocol    = "${var.protocol_type}",
    cidr_blocks = ["${var.zscaler2_cidr_block}"],
    }, {
    description = "${var.description_ssh}",
    port        = "${var.port_ssh}",
    protocol    = "${var.protocol_type}",
    cidr_blocks = ["${var.zscaler3_cidr_block}"],
    }, {
    description = "${var.description_ssh}",
    port        = "${var.port_ssh}",
    protocol    = "${var.protocol_type}",
    cidr_blocks = ["${var.zscaler4_cidr_block}"],
  }]
  lb_rules = [{
    description = "${var.description_http}",
    port        = "${var.port_http}",
    protocol    = "${var.protocol_type}",
    cidr_blocks = ["${var.all_sub_cidr_block}"],
  }]
  instance_rules = [{
    description     = "${var.description_http}",
    port            = "${var.port_http}",
    protocol        = "${var.protocol_type}",
    security_groups = [aws_security_group.kien-lb-sg.id],
    }, {
    description     = "${var.description_ssh}",
    port            = "${var.port_ssh}",
    protocol        = "${var.protocol_type}",
    security_groups = [aws_security_group.kien-bastion-sg.id],
  }]
}

resource "aws_security_group" "kien-bastion-sg" {
  name        = "${var.name}-bastion-sg"
  description = "${var.name}-bastion-sg"
  vpc_id      = aws_vpc.kien-vpc.id

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
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["${var.all_sub_cidr_block}"]
  }
}

resource "aws_security_group" "kien-lb-sg" {
  name        = "${var.name}-lb-sg"
  description = "${var.name}-lb-sg"
  vpc_id      = aws_vpc.kien-vpc.id

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

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["${var.all_sub_cidr_block}"]
  }
}

resource "aws_security_group" "kien-instance-sg" {
  name        = "${var.name}-instance-sg"
  description = "${var.name}-instance-sg"
  vpc_id      = aws_vpc.kien-vpc.id

  dynamic "ingress" {
    for_each = local.instance_rules
    content {
      description     = ingress.value.description
      from_port       = ingress.value.port
      to_port         = ingress.value.port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["${var.all_sub_cidr_block}"]
  }
}
