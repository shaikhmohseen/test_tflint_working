output "amplify_release_codebuild_project_name" {
  value = var.amplify_github_enabled ? null : module.deploy_app.amplify_release_codebuild_project_name
}