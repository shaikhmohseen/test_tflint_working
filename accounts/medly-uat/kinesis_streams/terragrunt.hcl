terraform {
  source = "../../..//accounts/medly-uat/kinesis_streams"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  kinesis_stream_backups_bucket_name = dependency.s3.outputs.kinesis_stream_backups_bucket_name
}

include {
  path = find_in_parent_folders()
}