terraform {
  source = "../../..//accounts/medly-prod/iam"
}

include {
  path = find_in_parent_folders()
}