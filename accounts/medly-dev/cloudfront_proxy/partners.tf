module "proxy_partners" {
  source                     = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-cloudfront-proxy/v1.1.1.zip"
  cname                      = var.subdomain_partners
  domain_name                = var.domain_name
  cloudfront_log_bucket      = var.cloudfront_log_bucket
  cloudfront_log_prefix      = var.cloudfront_log_prefix
  default_service_api_gw_url = var.partners_service_api_gateway_base_url
  tags                       = var.tags

  origins = [
    {
      api_gw_url : var.partners_service_api_gateway_base_url
      service_name : "partners"
      custom_headers : []
    }
  ]
  behaviours = [
    {
      service_name : "partners"
      path_pattern : "partners*"
    }
  ]
}
