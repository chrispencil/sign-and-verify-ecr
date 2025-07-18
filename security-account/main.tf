data "aws_caller_identity" "current" {}


# AWS Signer profile for container image signing
resource "aws_signer_signing_profile" "ecr_signing" {
  name        = "approvedbasesign"
  platform_id = "Notation-OCI-SHA384-ECDSA"
}

# Optional: Allow app account to pull signed images
resource "aws_ecr_repository_policy" "signed_base_images_policy" {
  for_each = aws_ecr_repository.signed_base_images

  repository = each.value.name
  policy     = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid = "CrossAccountPull"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::{app-accountid}:root"  #app account
        }
        Action = [
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
          "ecr:CreateRepository",
          "ecr:DescribeRepositories",
          "ecr:GetDownloadUrlForLayer"
        ]
      }
    ]
  })
}


