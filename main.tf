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
