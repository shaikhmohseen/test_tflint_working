terraform {
  source = "../../../modules//global/ssm"
}

inputs = {
  okta_auth_url = "https://medly.oktapreview.com/oauth2/default/v1/keys"
  okta_base_url = "https://medly.oktapreview.com"
}

include {
  path = find_in_parent_folders()
}
