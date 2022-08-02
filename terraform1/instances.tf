resource "aws_instance" "kien-bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kien-bastion-sg.id]
  user_data                   = file("userdata/bastion.sh")
  subnet_id                   = aws_subnet.kien-pub-sub-1.id
  key_name                    = aws_key_pair.kien-key.id

  tags = {
    Name        = "${var.name}-bastion"
    GBL_CLASS_0 = "${var.GBL_CLASS_0}"
    GBL_CLASS_1 = "${var.GBL_CLASS_1}"
  }
}
