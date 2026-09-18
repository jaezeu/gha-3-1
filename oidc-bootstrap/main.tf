data "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
}

module "github_oidc" {
  source  = "terraform-module/github-oidc-provider/aws"
  version = "~> 2.2.1"

  create_oidc_provider = false
  oidc_provider_arn    = data.aws_iam_openid_connect_provider.github.arn
  create_oidc_role     = true
  role_name = "jaz-31-oidc-role"
  repositories              = ["jaezeu/gha-3-1"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}

output "oidc_role_arn" {
  description = "GitHub role ARN"
  value       = module.github_oidc.oidc_role
}