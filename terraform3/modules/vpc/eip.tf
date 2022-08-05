resource "aws_eip" "kien-eip" {
  tags = {
    Name        = "${var.name}-eip"
    GBL_CLASS_0 = var.GBL_CLASS_0
    GBL_CLASS_1 = var.GBL_CLASS_1
  }
}
