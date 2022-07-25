output "public_subnet_1_id" {
  value = aws_subnet.kien-pub-sub-1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.kien-pub-sub-2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.kien-pri-sub-1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.kien-pri-sub-2.id
}

output "db_subnet_1_id" {
  value = aws_subnet.kien-db-sub-1.id
}

output "db_subnet_2_id" {
  value = aws_subnet.kien-db-sub-2.id
}
