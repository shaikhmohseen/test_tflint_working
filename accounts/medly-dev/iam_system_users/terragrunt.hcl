terraform {
  source = "../../..//accounts/medly-dev/iam-system-users"
}

include {
  path = find_in_parent_folders()
}