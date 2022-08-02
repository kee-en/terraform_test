resource "aws_nat_gateway" "kien-ngw" {
  allocation_id = aws_eip.kien-eip.id
  subnet_id     = aws_subnet.kien-pubsub-a.id

  tags = {
    Name        = "${var.name}-ngw"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}
