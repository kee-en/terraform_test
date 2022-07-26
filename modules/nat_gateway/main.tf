resource "aws_nat_gateway" "kien-ngw" {
  allocation_id = var.eip
  subnet_id     = var.public_subnet
  tags          = var.tags
}
