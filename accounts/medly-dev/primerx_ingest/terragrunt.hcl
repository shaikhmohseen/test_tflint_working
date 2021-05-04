terraform {
  source = "../../..//accounts/medly-dev/primerx_ingest"
}

dependency "s3" {
  config_path = "../s3"
}

include {
  path = find_in_parent_folders()
}