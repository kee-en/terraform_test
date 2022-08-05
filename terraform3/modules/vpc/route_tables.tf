resource "aws_route_table" "kien-pub-rt" {
  vpc_id = aws_vpc.kien-vpc.id

  route {
    cidr_block = var.all_cidr_block
    gateway_id = aws_internet_gateway.kien-igw.id
  }

  tags = {
    Name        = "${var.name}-pub-rt"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_route_table" "kien-pri-rt" {
  vpc_id = aws_vpc.kien-vpc.id

  route {
    cidr_block     = var.all_cidr_block
    nat_gateway_id = aws_nat_gateway.kien-ngw.id
  }

  tags = {
    Name        = "${var.name}-pri-rt"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_route_table" "kien-db-rt" {
  vpc_id = aws_vpc.kien-vpc.id

  tags = {
    Name        = "${var.name}-db-rt"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}
