output "bastion_sg_id" {
  value = aws_security_group.kien-bastion-sg.id
}

output "key_pair_id" {
  value = aws_key_pair.kien-key.id
}

output "lb_sg_id" {
  value = aws_security_group.kien-lb-sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.kien-ecs-sg.id
}

output "iam_role_id" {
  value = aws_iam_role.kien-iam-role.id
}

output "iam_role_arn" {
  value = aws_iam_role.kien-iam-role.arn
}

output "iam_role_exec_id" {
  value = aws_iam_role.kien-iam-role-exec.id
}

output "iam_role_exec_arn" {
  value = aws_iam_role.kien-iam-role-exec.arn
}
