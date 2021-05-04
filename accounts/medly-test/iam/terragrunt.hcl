terraform {
  source = "../../..//accounts/medly-test/iam"
}

include {
  path = find_in_parent_folders()
}