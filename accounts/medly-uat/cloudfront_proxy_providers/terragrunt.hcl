terraform {
  source = "../../..//accounts/medly-uat/cloudfront_proxy_providers"
}

include {
  path = find_in_parent_folders()
}
