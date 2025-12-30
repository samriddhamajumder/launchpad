resource "aws_iam_role_policy" "github_actions_read_only" {
  role = aws_iam_role.github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "iam:GetRole",
          "iam:ListRolePolicies",
          "iam:GetOpenIDConnectProvider",
          "iam:ListOpenIDConnectProviders",
          "ecr:DescribeRepositories",
          "ecr:ListTagsForResource",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = "*"
      }
    ]
  })
}
