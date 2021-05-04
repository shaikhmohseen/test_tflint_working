
output "public_assets_bucket_name" {
  value = aws_s3_bucket.public_assets.bucket
}
output "kinesis_stream_backups_bucket_name" {
  value = aws_s3_bucket.kinesis_stream_backups.bucket
}

output "ibd_build_assets_bucket_arn" {
  value = aws_s3_bucket.ibd_build_assets.arn
}

output "ibd_build_assets_bucket_name" {
  value = aws_s3_bucket.ibd_build_assets.bucket
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

output "ins_uploads_s3_bucket_arn" {
  value = aws_s3_bucket.ins_uploads.arn
}

output "ins_uploads_s3_bucket_name" {
  value = aws_s3_bucket.ins_uploads.bucket
}

output "dph_uploads_s3_bucket_arn" {
  value = aws_s3_bucket.dph_uploads.arn
}

output "dph_uploads_s3_bucket_name" {
  value = aws_s3_bucket.dph_uploads.bucket
}

output "scripts_bucket_arn" {
  value = aws_s3_bucket.scripts.arn
}

output "scripts_bucket_name" {
  value = aws_s3_bucket.scripts.bucket
}

output "bastion_public_keys_bucket_arn" {
  value = aws_s3_bucket.bastion_public_keys.arn
}

output "bastion_public_keys_bucket_name" {
  value = aws_s3_bucket.bastion_public_keys.bucket
}

output "dp_uploads_s3_bucket_arn" {
  value = aws_s3_bucket.dp_uploads.arn
}

output "dp_uploads_s3_bucket_name" {
  value = aws_s3_bucket.dp_uploads.bucket
}

output "fs_uploads_s3_bucket_arn" {
  value = aws_s3_bucket.fs_uploads.arn
}

output "fs_uploads_s3_bucket_name" {
  value = aws_s3_bucket.fs_uploads.bucket
}

output "rms_gsdd_s3_bucket_name" {
  value = aws_s3_bucket.refill_management_gsdd_uploads.bucket
}

output "rms_gsdd_s3_bucket_arn" {
  value = aws_s3_bucket.refill_management_gsdd_uploads.arn
}
