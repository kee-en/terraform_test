resource "aws_route_table_association" "kien-public-rta-1" {
  subnet_id      = var.public_subnet_1
  route_table_id = var.public_rt
}

resource "aws_route_table_association" "kien-public-rta-2" {
  subnet_id      = var.public_subnet_2
  route_table_id = var.public_rt
}

resource "aws_route_table_association" "kien-private-rta-1" {
  subnet_id      = var.private_subnet_1
  route_table_id = var.private_rt
}

resource "aws_route_table_association" "kien-private-rta-2" {
  subnet_id      = var.private_subnet_2
  route_table_id = var.private_rt
}

resource "aws_route_table_association" "kien-db-rta-1" {
  subnet_id      = var.db_subnet_1
  route_table_id = var.db_rt
}

resource "aws_route_table_association" "kien-db-rta-2" {
  subnet_id      = var.db_subnet_2
  route_table_id = var.db_rt
}
