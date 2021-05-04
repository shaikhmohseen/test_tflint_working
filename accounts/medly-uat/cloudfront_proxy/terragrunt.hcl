terraform {
  source = "../../..//accounts/medly-uat/cloudfront_proxy"
}

dependency "consumer_profile_service" {
  config_path = "../consumer_profile_service"
}

dependency "partners_service" {
  config_path = "../partners_service"
}

inputs = {
  consumer_profile_service_api_gateway_base_url = dependency.consumer_profile_service.outputs.api_gateway_base_url
  partners_service_api_gateway_base_url         = dependency.partners_service.outputs.api_gateway_base_url
}

include {
  path = find_in_parent_folders()
}
