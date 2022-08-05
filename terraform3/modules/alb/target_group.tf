resource "aws_lb_target_group" "kien-lb-tg" {
  name        = "${var.name}-lb-tg"
  port        = var.http_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    matcher             = 200
  }
}
