terraform {
  source = "../../..//accounts/medly-dev/tfstate"
}

include {
  path = find_in_parent_folders()
}
