terraform {
  source = "../../../modules/services//awerex_service"
}

inputs = {
  availability_zones = ["us-east-1a", "us-east-1b"]
  subnet_octet       = "28"
}

include {
  path = find_in_parent_folders()
}
