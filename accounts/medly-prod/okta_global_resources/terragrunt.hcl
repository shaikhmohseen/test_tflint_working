terraform {
  source = "../../../modules//global/okta"
}

include {
  path = find_in_parent_folders()
}
