resource "aws_internet_gateway" "kien-igw" {
  vpc_id = aws_vpc.kien-vpc.id

  tags = {
    Name        = "${var.name}-igw"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}
