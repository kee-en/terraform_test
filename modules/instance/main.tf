resource "aws_instance" "kien-bastion" {
  ami = var.ami_data
  instance_type = var.instance_type

  network_interface {
    network_interface_id = var.network_interface_bastion
    device_index = 0
  }

  tags = var.bastion_tags
}