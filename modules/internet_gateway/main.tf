resource "aws_internet_gateway" "kien-igw" {
  vpc_id = var.vpc_id
  tags   = var.tags
}
