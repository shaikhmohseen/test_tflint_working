terraform {
  source = "../../../modules/services//authoriser_service"
}

dependency "prescription_service" {
  config_path = "../prescription_service"
}

inputs = {
  build_artifacts_bucket_arn               = "arn:aws:s3:::medly-dev-build-artifacts"
  prescription_service_private_subnets_ids = dependency.prescription_service.outputs.private_subnets_ids
  prescription_service_vpc                 = dependency.prescription_service.outputs.vpc_id
}

include {
  path = find_in_parent_folders()
}
