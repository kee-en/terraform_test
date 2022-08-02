resource "aws_launch_configuration" "kien-lc" {
  name                 = "${var.name}-lc"
  image_id             = "ami-0986c991cc80c6ad9"
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.kien-iam-instance-profile.id
  security_groups      = [aws_security_group.kien-instance-sg.id]
  key_name             = aws_key_pair.kien-key.id
  user_data            = file("userdata/instance.sh")
  lifecycle {
    create_before_destroy = true
  }
}
