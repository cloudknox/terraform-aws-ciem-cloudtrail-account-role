module "example" {
  source                            = "../.."
  cloudtrail_bucket_name            = var.cloudtrail_bucket_name
  ciem_oidc_provider_role_name      = var.ciem_oidc_provider_role_name
  ciem_cloudtrail_account_role_name = var.ciem_cloudtrail_account_role_name
  oidc_provider_account_id          = var.oidc_provider_account_id
  tenant_id                         = var.tenant_id
}
