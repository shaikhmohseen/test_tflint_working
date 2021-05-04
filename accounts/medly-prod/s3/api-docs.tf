module "cloudfront-s3-website" {
  source                 = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-cloudfront-s3-website/v1.2.3.zip"
  aws_profile            = var.aws_profile # The certificate "*.medly.io" was not being fetched without profile being present in the "provider" block in the module.
  hosted_zone            = "medly.io"
  domain_name            = "developers.medly.io"
  acm_certificate_domain = "*.medly.io"
  upload_sample_file     = false
}
