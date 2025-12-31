resource "aws_iam_role_policy" "github_actions_terraform_backend" {
  role = aws_iam_role.github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # S3 backend access
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::launchpad-s3-bucket-99",
          "arn:aws:s3:::launchpad-s3-bucket-99/*"
        ]
      },

      # DynamoDB state lock
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem",
          "dynamodb:DescribeTable"
        ]
        Resource = "arn:aws:dynamodb:us-east-1:603196661191:table/launchpad-table-dynamodb"
      },

      # 🔴 Adding this block
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeRouteTables",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeSecurityGroups",
          "iam:GetRole",
          "iam:GetOpenIDConnectProvider",
          "iam:ListRoles",
          "ecr:DescribeRepositories",
          "ecr:ListTagsForResource"
        ]
        Resource = "*"
      }
    ]
  })
}
