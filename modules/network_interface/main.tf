resource "aws_network_interface" "kien-bastion-ni" {
  subnet_id = var.public_subnet
  tags      = var.tags
}
