terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "./modules/vpc"

  name                = var.name
  vpc_cidr_block      = var.vpc_cidr_block
  pubsub_a_cidr_block = var.pubsub_a_cidr_block
  pubsub_c_cidr_block = var.pubsub_c_cidr_block
  prisub_a_cidr_block = var.prisub_a_cidr_block
  prisub_c_cidr_block = var.prisub_c_cidr_block
  dbsub_a_cidr_block  = var.dbsub_a_cidr_block
  dbsub_c_cidr_block  = var.dbsub_c_cidr_block
  all_cidr_block      = var.all_cidr_block
  availability_zone1  = var.availability_zone1
  availability_zone2  = var.availability_zone2

  GBL_CLASS_0 = var.GBL_CLASS_0
  GBL_CLASS_1 = var.GBL_CLASS_1
}

module "security" {
  source = "./modules/security"

  name                = var.name
  vpc_id              = module.vpc.vpc_id
  ssh_port            = var.ssh_port
  ssh_description     = var.ssh_description
  http_port           = var.http_port
  http_description    = var.http_description
  protocol            = var.protocol
  all_cidr_block      = var.all_cidr_block
  personal_cidr_block = var.personal_cidr_block
  zscaler1_cidr_block = var.zscaler1_cidr_block
  zscaler2_cidr_block = var.zscaler2_cidr_block
  zscaler3_cidr_block = var.zscaler3_cidr_block
  zscaler4_cidr_block = var.zscaler4_cidr_block

  GBL_CLASS_0 = var.GBL_CLASS_0
  GBL_CLASS_1 = var.GBL_CLASS_1
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "kien-bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.security.bastion_sg_id]
  user_data                   = file("userdata/bastion.sh")
  subnet_id                   = module.vpc.pubsub_a_id
  key_name                    = module.security.key_pair_id

  tags = {
    Name        = "${var.name}-bastion"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}
