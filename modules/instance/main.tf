resource "aws_instance" "kien-bastion" {
  ami = var.ami_data
  instance_type = var.instance_type
  tags = var.bastion_tags
}