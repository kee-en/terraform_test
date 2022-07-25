resource "aws_nat_gateway" "kien-ngw" {
  subnet_id = var.public_subnet
  tags = var.tags
}