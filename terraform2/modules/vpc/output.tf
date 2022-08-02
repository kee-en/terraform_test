output "vpc_id" {
  value = aws_vpc.kien-vpc.id
}

output "pubsub_a_id" {
  value = aws_subnet.kien-pubsub-a.id
}

output "pubsub_c_id" {
  value = aws_subnet.kien-pubsub-c.id
}

output "prisub_a_id" {
  value = aws_subnet.kien-prisub-a.id
}

output "prisub_c_id" {
  value = aws_subnet.kien-prisub-c.id
}

output "dbsub_a_id" {
  value = aws_subnet.kien-dbsub-a.id
}

output "dbsub_c_id" {
  value = aws_subnet.kien-dbsub-c.id
}

output "eip_id" {
  value = aws_eip.kien-eip.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.kien-igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.kien-ngw.id
}

output "pub-rt-id" {
  value = aws_route_table.kien-pub-rt.id
}

output "pri-rt-id" {
  value = aws_route_table.kien-pri-rt.id
}

output "db-rt-id" {
  value = aws_route_table.kien-db-rt.id
}

output "pubrta-a-id" {
  value = aws_route_table_association.kien-pub-a-rta.id
}

output "pubrta-c-id" {
  value = aws_route_table_association.kien-pub-c-rta.id
}

output "prirta-a-id" {
  value = aws_route_table_association.kien-pri-a-rta.id
}

output "prirta-c-id" {
  value = aws_route_table_association.kien-pri-c-rta.id
}

output "dbrta-a-id" {
  value = aws_route_table_association.kien-db-a-rta.id
}

output "dbrta-c-id" {
  value = aws_route_table_association.kien-db-c-rta.id
}
