resource "aws_route_table_association" "kien-pub-a-rta" {
  subnet_id      = aws_subnet.kien-pubsub-a.id
  route_table_id = aws_route_table.kien-pub-rt.id
}

resource "aws_route_table_association" "kien-pub-c-rta" {
  subnet_id      = aws_subnet.kien-pubsub-c.id
  route_table_id = aws_route_table.kien-pub-rt.id
}

resource "aws_route_table_association" "kien-pri-a-rta" {
  subnet_id      = aws_subnet.kien-prisub-a.id
  route_table_id = aws_route_table.kien-pri-rt.id
}

resource "aws_route_table_association" "kien-pri-c-rta" {
  subnet_id      = aws_subnet.kien-prisub-c.id
  route_table_id = aws_route_table.kien-pri-rt.id
}

resource "aws_route_table_association" "kien-db-a-rta" {
  subnet_id      = aws_subnet.kien-dbsub-a.id
  route_table_id = aws_route_table.kien-db-rt.id
}

resource "aws_route_table_association" "kien-db-c-rta" {
  subnet_id      = aws_subnet.kien-dbsub-c.id
  route_table_id = aws_route_table.kien-db-rt.id
}
