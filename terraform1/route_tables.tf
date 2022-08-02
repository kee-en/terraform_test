resource "aws_route_table" "kien-rt-public" {
  vpc_id = aws_vpc.kien-vpc.id

  route {
    cidr_block = var.all_sub_cidr_block
    gateway_id = aws_internet_gateway.kien-igw.id
  }

  tags = {
    Name        = "${var.name}-rt-public"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_route_table" "kien-rt-private" {
  vpc_id = aws_vpc.kien-vpc.id

  route {
    cidr_block     = var.all_sub_cidr_block
    nat_gateway_id = aws_nat_gateway.kien-ngw.id
  }

  tags = {
    Name        = "${var.name}-rt-private"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_route_table" "kien-rt-db" {
  vpc_id = aws_vpc.kien-vpc.id

  tags = {
    Name        = "${var.name}-rt-db"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}
