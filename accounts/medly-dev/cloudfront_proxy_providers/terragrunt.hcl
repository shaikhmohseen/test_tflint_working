terraform {
  source = "../../..//accounts/medly-dev/cloudfront_proxy_providers"
}

include {
  path = find_in_parent_folders()
}
