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
  all_cidr_block      = var.all_cidr_block
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

module "alb" {
  source = "./modules/alb"

  name       = var.name
  lb_sg_id   = module.security.lb_sg_id
  vpc_id     = module.vpc.vpc_id
  pubsub1_id = module.vpc.pubsub_a_id
  pubsub2_id = module.vpc.pubsub_c_id
  http_port  = var.http_port

  GBL_CLASS_0 = var.GBL_CLASS_0
  GBL_CLASS_1 = var.GBL_CLASS_1
}

module "asg" {
  source = "./modules/asg"

  name                 = var.name
  iam_instance_profile = module.security.iam_instance_profile_id
  instance_sg_id       = module.security.instance_sg_id
  key_pair_id          = module.security.key_pair_id
  prisub1_id           = module.vpc.prisub_a_id
  prisub2_id           = module.vpc.prisub_c_id
  lb_target_group_arn  = module.alb.target_group_arn
  instance_type        = var.instance_type

  GBL_CLASS_0 = var.GBL_CLASS_0
  GBL_CLASS_1 = var.GBL_CLASS_1
}

resource "aws_s3_bucket" "kien-bucket" {
  bucket = "${var.name}-bucket"

  tags = {
    Name              = "${var.name}-bucket"
    GBL_CLASS_0       = var.GBL_CLASS_0
    GBL_CLASS_1       = var.GBL_CLASS_1
    SEC_ASSETS_PUBLIC = var.SEC_ASSETS_PUBLIC
    SEC_ASSETS_PII    = var.SEC_ASSETS_PII
  }
}

resource "aws_s3_bucket_versioning" "kien-bucket-versioning" {
  bucket = aws_s3_bucket.kien-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "kien-bucket-acl" {
  bucket = aws_s3_bucket.kien-bucket.id
  acl    = "private"
}

resource "aws_s3_object" "kien-object" {
  bucket = aws_s3_bucket.kien-bucket.id
  key    = "index.html"
  source = "index.html"
  etag   = filemd5("index.html")
}

resource "aws_s3_bucket_public_access_block" "kien-bucket-public-access-block" {
  bucket = aws_s3_bucket.kien-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
