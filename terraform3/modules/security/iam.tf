resource "aws_iam_role" "kien-iam-role" {
  name = "${var.name}-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role" "kien-iam-role-exec" {
  name = "${var.name}-iam-role-exec"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "kien-iam-role-policy-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  ])

  role       = aws_iam_role.kien-iam-role.id
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "kien-iam-role-exec-policy-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ])

  role       = aws_iam_role.kien-iam-role-exec.id
  policy_arn = each.value
}
