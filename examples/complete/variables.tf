variable "cloudtrail_bucket_name" {
  description = "s3 bucket name where cloudtrail logs are stored"
  type        = string
}

variable "ciem_cloudtrail_account_role_name" {
  description = "name of the iam role to access cloudtrail bucket"
  type        = string
}

variable "ciem_oidc_provider_role_name" {
  description = "name of the iam role oidc provider can assume role into"
  type        = string
}

variable "oidc_provider_account_id" {
  description = "account id where oidc provider is created"
  type        = string
}

variable "tenant_id" {
  description = "id of the tenant where the application is created"
  type        = string
}
