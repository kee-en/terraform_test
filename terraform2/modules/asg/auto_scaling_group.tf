resource "aws_autoscaling_group" "kien-asg" {
  name                      = "${var.name}-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_configuration      = aws_launch_configuration.kien-lc.id
  vpc_zone_identifier       = [var.prisub1_id, var.prisub2_id]
  target_group_arns         = [var.lb_target_group_arn]

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
