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

output "igw_id" {
  value = aws_internet_gateway.kien-igw.id
}

output "ngw_id" {
  value = aws_nat_gateway.kien-ngw.id
}

output "pub_rt_id" {
  value = aws_route_table.kien-pub-rt.id
}

output "pri_rt_id" {
  value = aws_route_table.kien-pri-rt.id
}

output "db_rt_id" {
  value = aws_route_table.kien-db-rt.id
}
