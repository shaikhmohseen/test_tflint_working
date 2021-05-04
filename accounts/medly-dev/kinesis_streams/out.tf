output "s3" {
  value = data.terraform_remote_state.s3.outputs.kinesis_stream_backups_bucket_name
}
