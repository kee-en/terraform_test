resource "aws_subnet" "kien-pub-sub-1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = var.public_subnet_1_tags
}

resource "aws_subnet" "kien-pub-sub-2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = var.public_subnet_2_tags
}

resource "aws_subnet" "kien-pri-sub-1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = var.private_subnet_1_tags
}

resource "aws_subnet" "kien-pri-sub-2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = var.private_subnet_2_tags
}

resource "aws_subnet" "kien-db-sub-1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = var.db_subnet_1_tags
}

resource "aws_subnet" "kien-db-sub-2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = var.db_subnet_2_tags
}
