resource "aws_lb" "kien-lb" {
  name                       = "${var.name}-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.kien-lb-sg.id]
  subnets                    = [aws_subnet.kien-pub-sub-1.id, aws_subnet.kien-pub-sub-2.id]
  enable_deletion_protection = false

  tags = {
    Name        = "${var.name}-lb"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "aws_lb_listener" "kien-lb-listener" {
  load_balancer_arn = aws_lb.kien-lb.arn
  port              = var.port_http
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kien-lb-target-group.arn
  }
}
