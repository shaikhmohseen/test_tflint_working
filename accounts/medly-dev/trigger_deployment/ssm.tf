resource "aws_ssm_parameter" "deployment_rest_api_id" {
  name        = "/${var.env}/${var.service_name}RestApiId"
  description = "The Trigger Deployment Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "deployment_rest_api_root_resource_id" {
  name        = "/${var.env}/${var.service_name}RestApiRootResourceId"
  description = "The Trigger Deploymemnt Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "build_artifact_bucket" {
  name        = "/${var.env}/buildArtifactBucketName"
  description = "The build artifact bucket name"
  type        = "String"
  value       = module.trigger_deployment_lambda_cross_account_roles.build_artifacts_bucket_name
}