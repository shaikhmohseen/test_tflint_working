output "s3" {
  value = var.kinesis_stream_backups_bucket_name
}

output "mms_prescription_stream_arn" {
  value = module.mms_prescription_stream.kinesis_data_stream_arn
}

output "mms_patient_stream_arn" {
  value = module.mms_patient_stream.kinesis_data_stream_arn
}
