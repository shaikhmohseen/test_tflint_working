terraform {
  source = "../../../modules/services//authoriser_service"
}

dependency "s3" {
  config_path = "../s3"
}

dependency "prescription_service" {
  config_path = "../prescription_service"
}

inputs = {
  build_artifacts_bucket_arn               = dependency.s3.outputs.build_artifacts_bucket_arn
  prescription_service_private_subnets_ids = dependency.prescription_service.outputs.prescription_service_private_subnet_ids
  prescription_service_vpc                 = dependency.prescription_service.outputs.prescription_service_vpc_id
}

include {
  path = find_in_parent_folders()
}
