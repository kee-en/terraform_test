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

  tags = {
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
    Name        = "kien-vpc"
  }
}
