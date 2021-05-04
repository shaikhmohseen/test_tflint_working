terraform {
  source = "../../..//accounts/medly-test/cloudfront_proxy"
}

dependency "partners_service" {
  config_path = "../partners_service"
}

dependency "consumer_profile_service" {
  config_path = "../consumer_profile_service"
}

inputs = {
  partners_service_api_gateway_base_url         = dependency.partners_service.outputs.api_gateway_base_url
  consumer_profile_service_api_gateway_base_url = dependency.consumer_profile_service.outputs.api_gateway_base_url
}

include {
  path = find_in_parent_folders()
}
