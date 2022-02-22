resource "aws_iam_policy" "cloud_trail_acess_policy" {
  name = "ciem-cloudtrail-${var.tenant_id}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.cloudtrail_bucket_name}*",
          "arn:aws:s3:::${var.cloudtrail_bucket_name}*/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "ciem_cloudtrail_role" {
  name = var.ciem_cloudtrail_account_role_name

  assume_role_policy = templatefile("${path.module}/template/oidc_assume_role_policy.json", {
    ACCOUNT_ID = var.oidc_provider_account_id,
    ROLE_NAME  = var.ciem_oidc_provider_role_name
  })

  managed_policy_arns = [
    aws_iam_policy.cloud_trail_acess_policy.arn
  ]

  tags = {}
}
