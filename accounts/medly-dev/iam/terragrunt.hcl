terraform {
  source = "../../..//accounts/medly-dev/iam"
}

include {
  path = find_in_parent_folders()
}