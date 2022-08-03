output "bastion_sg_id" {
  value = aws_security_group.kien-bastion-sg.id
}

output "lb_sg_id" {
  value = aws_security_group.kien-lb-sg.id
}

output "instance_sg_id" {
  value = aws_security_group.kien-instance-sg.id
}

output "key_pair_id" {
  value = aws_key_pair.kien-key.id
}

output "iam_role_id" {
  value = aws_iam_role.kien-iam-role.id
}