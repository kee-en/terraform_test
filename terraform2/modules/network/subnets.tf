resource "aws_subnet" "kien-pubsub-a" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.pubsub_a_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name        = "${var.name}-pubsub-a"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-pubsub-c" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.pubsub_c_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name        = "${var.name}-pubsub-c"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-prisub-a" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.prisub_a_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name        = "${var.name}-prisub-a"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-prisub-c" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.prisub_c_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name        = "${var.name}-prisub-c"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-dbsub-a" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.dbsub_a_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name        = "${var.name}-dbsub-a"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_subnet" "kien-dbsub-c" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.dbsub_c_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name        = "${var.name}-dbsub-c"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}
