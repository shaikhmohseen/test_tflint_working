terraform {
  source = "..//restricted_bucket"
}

include {
  path = find_in_parent_folders()
}
