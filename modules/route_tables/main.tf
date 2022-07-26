resource "aws_route_table" "kien-rt-public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.public_rt_cidr_block
    gateway_id = var.igw_id
  }
  tags = var.public_rt_tags
}

resource "aws_route_table" "kien-rt-private" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = var.private_rt_cidr_block
    nat_gateway_id = var.ngw_id
  }
  tags = var.private_rt_tags
}

resource "aws_route_table" "kien-rt-db" {
  vpc_id = var.vpc_id
  tags   = var.db_rt_tags
}
