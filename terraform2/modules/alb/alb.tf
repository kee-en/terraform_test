resource "aws_lb" "kien-alb" {
  name                       = "${var.name}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.lb_sg_id]
  subnets                    = [var.pubsub1_id, var.pubsub2_id]
  enable_deletion_protection = false

  tags = {
    Name        = "${var.name}-alb"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}

resource "aws_lb_listener" "kien-alb-listener" {
  load_balancer_arn = aws_lb.kien-alb.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kien-lb-tg.arn
  }
}
