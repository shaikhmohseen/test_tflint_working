terraform {
  source = "../../..//accounts/medly-sandbox/tfstate"
}

include {
  path = find_in_parent_folders()
}
