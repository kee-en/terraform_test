output "bastion_sg_id" {
  value = aws_security_group.kien-bastion-sg.id
}

output "key_pair_id" {
  value = aws_key_pair.kien-key.id
}
