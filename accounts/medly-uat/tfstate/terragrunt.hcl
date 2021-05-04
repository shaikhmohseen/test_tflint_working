terraform {
  source = "../../..//accounts/medly-uat/tfstate"
}

include {
  path = find_in_parent_folders()
}