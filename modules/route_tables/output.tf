output "public_rt_id" {
  value = aws_route_table.kien-rt-public.id
}

output "private_rt_id" {
  value = aws_route_table.kien-rt-private.id
}

output "db_rt_id" {
  value = aws_route_table.kien-rt-db.id
}
