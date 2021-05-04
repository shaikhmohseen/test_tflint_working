terraform {
  source = "../../..//accounts/medly-prod/iam_system_users"
}

include {
  path = find_in_parent_folders()
}