resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kien-key" {
  key_name   = "${var.name}-key"
  public_key = tls_private_key.pk.public_key_openssh

  tags = {
    Name        = "${var.name}-key"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kien-key.key_name}.pem"
  content  = tls_private_key.pk.private_key_pem
}
