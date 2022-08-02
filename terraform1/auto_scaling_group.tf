resource "aws_autoscaling_group" "kien-asg" {
  name                      = "${var.name}-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_configuration      = aws_launch_configuration.kien-lc.id
  vpc_zone_identifier       = [aws_subnet.kien-pri-sub-1.id, aws_subnet.kien-pri-sub-2.id]
  target_group_arns         = [aws_lb_target_group.kien-lb-target-group.arn]

  tag {
    key                 = "Name"
    value               = "${var.name}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "GBL_CLASS_0"
    value               = var.GBL_CLASS_0
    propagate_at_launch = true
  }

  tag {
    key                 = "GBL_CLASS_1"
    value               = var.GBL_CLASS_1
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "kien-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.kien-asg.id
  lb_target_group_arn    = aws_lb_target_group.kien-lb-target-group.arn
}
