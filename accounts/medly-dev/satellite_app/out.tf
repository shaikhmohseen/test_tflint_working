output "satellite_app_amplify_release_codebuild_project" {
  value = var.amplify_github_enabled ? null : module.satellite_app.amplify_release_codebuild_project_name
}