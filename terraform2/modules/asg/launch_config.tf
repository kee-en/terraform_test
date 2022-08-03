resource "aws_launch_configuration" "kien-lc" {
  name                 = "${var.name}-lc"
  image_id             = "ami-0986c991cc80c6ad9"
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  security_groups      = [var.instance_sg_id]
  key_name             = var.key_pair_id
  user_data            = file("userdata/instance.sh")

  lifecycle {
    create_before_destroy = true
  }
}
