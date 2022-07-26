resource "aws_eip" "kien-eip-ngw" {
  tags = var.eip_ngw_tags
}