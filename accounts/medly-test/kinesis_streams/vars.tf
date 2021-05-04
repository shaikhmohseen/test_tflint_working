variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "kinesis_stream_backups_bucket_name" {
  description = "S3 Bucket name of kinesis backups"
  type        = string
}
