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

module "network" {
  source = "./modules/network"

  name                = var.name
  vpc_cidr_block      = var.vpc_cidr_block
  pubsub_a_cidr_block = var.pubsub_a_cidr_block
  pubsub_c_cidr_block = var.pubsub_c_cidr_block
  prisub_a_cidr_block = var.prisub_a_cidr_block
  prisub_c_cidr_block = var.prisub_c_cidr_block
  dbsub_a_cidr_block  = var.dbsub_a_cidr_block
  dbsub_c_cidr_block  = var.dbsub_c_cidr_block
  availability_zone_1 = var.availability_zone1
  availability_zone_2 = var.availability_zone2

  GBL_CLASS_0 = var.GBL_CLASS_0
  GBL_CLASS_1 = var.GBL_CLASS_1
}
