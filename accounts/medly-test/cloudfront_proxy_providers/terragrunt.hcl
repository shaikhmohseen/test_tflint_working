terraform {
  source = "../../..//accounts/medly-test/cloudfront_proxy_providers"
}

include {
  path = find_in_parent_folders()
}
