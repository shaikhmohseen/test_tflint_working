module "cloudfront-s3-website" {
  source                 = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-cloudfront-s3-website/v1.2.2.zip"
  hosted_zone            = "dev-medly.io"
  domain_name            = "developers.dev-medly.io"
  acm_certificate_domain = "*.dev-medly.io"
  upload_sample_file     = false
}
