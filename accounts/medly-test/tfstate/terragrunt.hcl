terraform {
  source = "../../..//accounts/medly-test/tfstate"
}

include {
  path = find_in_parent_folders()
}
