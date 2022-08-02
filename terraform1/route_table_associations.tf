resource "aws_route_table_association" "kien-public-rta-1" {
  subnet_id      = aws_subnet.kien-pub-sub-1.id
  route_table_id = aws_route_table.kien-rt-public.id
}

resource "aws_route_table_association" "kien-public-rta-2" {
  subnet_id      = aws_subnet.kien-pub-sub-2.id
  route_table_id = aws_route_table.kien-rt-public.id
}

resource "aws_route_table_association" "kien-private-rta-1" {
  subnet_id      = aws_subnet.kien-pri-sub-1.id
  route_table_id = aws_route_table.kien-rt-private.id
}

resource "aws_route_table_association" "kien-private-rta-2" {
  subnet_id      = aws_subnet.kien-pri-sub-2.id
  route_table_id = aws_route_table.kien-rt-private.id
}

resource "aws_route_table_association" "kien-db-rta-1" {
  subnet_id      = aws_subnet.kien-db-sub-1.id
  route_table_id = aws_route_table.kien-rt-db.id
}

resource "aws_route_table_association" "kien-db-rta-2" {
  subnet_id      = aws_subnet.kien-db-sub-2.id
  route_table_id = aws_route_table.kien-rt-db.id
}
