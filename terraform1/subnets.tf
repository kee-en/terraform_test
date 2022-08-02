resource "aws_subnet" "kien-pub-sub-1" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.pub_sub_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name        = "${var.name}-pub-sub-1"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_subnet" "kien-pub-sub-2" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.pub_sub_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name        = "${var.name}-pub-sub-2"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_subnet" "kien-pri-sub-1" {
  vpc_id                  = aws_vpc.kien-vpc.id
  cidr_block              = var.pri_sub_1_cidr_block
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-pri-sub-1"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_subnet" "kien-pri-sub-2" {
  vpc_id                  = aws_vpc.kien-vpc.id
  cidr_block              = var.pri_sub_2_cidr_block
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-pri-sub-2"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}
resource "aws_subnet" "kien-db-sub-1" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.db_sub_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name        = "${var.name}-db-sub-1"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_subnet" "kien-db-sub-2" {
  vpc_id            = aws_vpc.kien-vpc.id
  cidr_block        = var.db_sub_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name        = "${var.name}-db-sub-2"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}
