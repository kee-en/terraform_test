resource "aws_vpc" "kien-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = var.tags
}
