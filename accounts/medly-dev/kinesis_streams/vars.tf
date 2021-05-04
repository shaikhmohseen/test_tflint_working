variable "env" {
  description = "Deployment Environment"
}

variable "kinesis_stream_backups_bucket_name" {
  description = "S3 Bucket name of kinesis backups"
  type        = string
}
