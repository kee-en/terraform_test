resource "aws_iam_role" "kien-iam-role" {
  name = "${var.name}-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "kien-iam-instance-profile" {
  name = "${var.name}-iam-instance-profile"
  role = aws_iam_role.kien-iam-role.id
}

resource "aws_iam_role_policy_attachment" "kien-iam-role-policy-attachment" {
  role       = aws_iam_role.kien-iam-role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
