terraform {
  source = "."
}

inputs = {
  aws_account_ids            = []
  allow_cross_account_access = false
}

include {
  path = find_in_parent_folders()
}
