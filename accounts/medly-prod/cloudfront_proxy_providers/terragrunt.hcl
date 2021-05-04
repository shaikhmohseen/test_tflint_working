terraform {
  source = "../../..//accounts/medly-prod/cloudfront_proxy"
}

include {
  path = find_in_parent_folders()
}