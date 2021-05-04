locals {
  okta_api_token_secret_key = "global/okta/secrets/terraform"
  okta_global_scopes        = ["prescription", "patient"]
  okta_global_claims = [
    {
      name : "prescription",
      scopes : "prescription"
    },
    {
      name : "patient",
      scopes : "patient"
    }
  ]
  okta_localhost_app_urls = ["http://localhost:8080", "http://localhost:8090", "http://localhost:8000", "http://localhost:8096"]
}
