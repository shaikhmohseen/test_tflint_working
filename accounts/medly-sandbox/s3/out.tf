output "kinesis_stream_backups_bucket_name" {
  value = aws_s3_bucket.kinesis_stream_backups.bucket
}

output "ibd_build_assets_bucket_arn" {
  value = aws_s3_bucket.ibd_build_assets.arn
}

output "ibd_build_assets_bucket_name" {
  value = aws_s3_bucket.ibd_build_assets.bucket
}

output "ibd_app_s3_bucket_name" {
  value = aws_s3_bucket.ibd_app.bucket
}

output "ibd_uploads_s3_bucket_arn" {
  value = aws_s3_bucket.ibd_uploads.arn
}

output "build_artifacts_bucket_name" {
  value = aws_s3_bucket.build_artifacts.bucket
}

output "build_artifacts_bucket_arn" {
  value = aws_s3_bucket.build_artifacts.arn
}

output "canonical_user_id" {
  value = data.aws_canonical_user_id.current.id
}