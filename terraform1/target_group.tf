resource "aws_lb_target_group" "kien-lb-target-group" {
  name     = "${var.name}-lb-target-group"
  port     = var.port_http
  protocol = "HTTP"
  vpc_id   = aws_vpc.kien-vpc.id

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
