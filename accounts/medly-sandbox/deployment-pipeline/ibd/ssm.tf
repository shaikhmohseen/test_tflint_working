resource "aws_ssm_parameter" "service_file_metadata" {
  name        = local.ssm_parameter_name
  description = "The Json Metadata of the deployable Dist file including the path of the file, and any other metadata that needs to be logged"
  type        = "String"
  value       = "{}"
}
