output "access_key_id" {
  value = aws_iam_access_key.s3_user_access_key.id
}

output "access_key_secret" {
  value = aws_iam_access_key.s3_user_access_key.secret
}