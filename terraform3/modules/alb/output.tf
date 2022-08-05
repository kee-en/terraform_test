output "alb_id" {
  value = aws_lb.kien-alb.id
}

output "alb_arn" {
  value = aws_lb.kien-alb.arn
}

output "alb_listener_id" {
  value = aws_lb_listener.kien-alb-listener.id
}

output "target_group_id" {
  value = aws_lb_target_group.kien-lb-tg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.kien-lb-tg.arn
}
