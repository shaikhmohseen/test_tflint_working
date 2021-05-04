terraform {
  source = "../../..//accounts/medly-uat/iam"
}

include {
  path = find_in_parent_folders()
}