terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block = var.vpc_cidr_block
  tags = {
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
    Name        = "kien-vpc"
  }
}

module "eip" {
  source = "./modules/eip"

  eip_ngw_tags = {
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
    Name        = "kien-eip-ngw"
  }
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id = module.vpc.id

  public_subnet_1_cidr_block  = var.pub_sub_1_cidr_block
  public_subnet_2_cidr_block  = var.pub_sub_2_cidr_block
  private_subnet_1_cidr_block = var.pri_sub_1_cidr_block
  private_subnet_2_cidr_block = var.pri_sub_2_cidr_block
  db_subnet_1_cidr_block      = var.db_sub_1_cidr_block
  db_subnet_2_cidr_block      = var.db_sub_2_cidr_block

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  public_subnet_1_tags = {
    Name        = "kien-pub-sub-1"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  public_subnet_2_tags = {
    Name        = "kien-pub-sub-2"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  private_subnet_1_tags = {
    Name        = "kien-pri-sub-1"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  private_subnet_2_tags = {
    Name        = "kien-pri-sub-2"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  db_subnet_1_tags = {
    Name        = "kien-db-sub-1"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  db_subnet_2_tags = {
    Name        = "kien-db-sub-2"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.id

  tags = {
    Name        = "kien-igw"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  public_subnet = module.subnets.public_subnet_1_id
  eip           = module.eip.eip_ngw
  tags = {
    Name        = "kien-ngw"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

module "route_tables" {
  source = "./modules/route_tables"

  vpc_id = module.vpc.id
  igw_id = module.internet_gateway.id
  ngw_id = module.nat_gateway.id

  public_rt_cidr_block  = var.all_sub_cidr_block
  private_rt_cidr_block = var.all_sub_cidr_block

  public_rt_tags = {
    Name        = "kien-rt-public"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  private_rt_tags = {
    Name        = "kien-rt-private"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }

  db_rt_tags = {
    Name        = "kien-rt-db"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

module "route_table_association" {
  source = "./modules/route_table_association"

  public_subnet_1  = module.subnets.public_subnet_1_id
  public_subnet_2  = module.subnets.public_subnet_2_id
  private_subnet_1 = module.subnets.private_subnet_1_id
  private_subnet_2 = module.subnets.private_subnet_2_id
  db_subnet_1      = module.subnets.db_subnet_1_id
  db_subnet_2      = module.subnets.db_subnet_2_id

  public_rt  = module.route_tables.public_rt_id
  private_rt = module.route_tables.private_rt_id
  db_rt      = module.route_tables.db_rt_id
}

module "network_interface" {
  source = "./modules/network_interface"

  public_subnet = module.subnets.public_subnet_1_id

  tags = {
    Name        = "kien-bastion-ni"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

module "ami" {
  source = "./modules/ami"
}

module "security_groups" {
  sources = "./modules/security_groups"
}

module "instance" {
  source = "./modules/instance"

  ami_data = module.ami.ubuntu_ami_id
  instance_type = var.instance_type
  bastion_tags = {
    Name        = "kien-bastion"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}
