resource "aws_iam_role" "mysql" {
  name = "${local.common_name}-mysql"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    {
        Name = "${local.common_name}-mysql"
    },
    local.common_tags
  )
}


resource "aws_iam_policy" "mysql" {
  name        = "${local.common_name}"
  path        = "/"
  description = "Attached to MySQl insatnce"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("mysql-iam-policy.json")
}


# Attach a policy to a role
resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.mysql.name
  policy_arn = aws_iam_policy.mysql.arn
}

resource "aws_iam_instance_profile" "mysql_profile" {
  name = "${local.common_name}-mysql"
  role = aws_iam_role.mysql.name
}
