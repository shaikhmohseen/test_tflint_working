terraform {
  source = "../../..//accounts/medly-dev/eb_atlantis"
}

include {
  path = find_in_parent_folders()
}