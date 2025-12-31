resource "aws_iam_role_policy" "github_actions_read_only" {
  role = aws_iam_role.github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          # EC2 read (VPC, subnets, attributes)
          "ec2:Describe*",

          # IAM read (Terraform REQUIRED)
          "iam:GetRole",
          "iam:ListRolePolicies",
          "iam:GetRolePolicy",
          "iam:ListAttachedRolePolicies",
          "iam:GetOpenIDConnectProvider",
          "iam:ListOpenIDConnectProviders",

          # ECR read
          "ecr:DescribeRepositories",
          "ecr:ListTagsForResource",

          # S3 backend read
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = "*"
      }
    ]
  })
}
