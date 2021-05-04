terraform {
  source = "../../..//accounts/medly-prod/cloudfront_proxy"
}

dependency "ibd_service" {
  config_path = "../ibd_service"
}

dependency "patient_service" {
  config_path = "../patient_service"
}

dependency "prescription_service" {
  config_path = "../prescription_service"
}

dependency "facility_service" {
  config_path = "../facility_service"
}

dependency "satellite_service" {
  config_path = "../satellite_service"
}

dependency "mms_ingest_service" {
  config_path = "../mms_ingest_service"
}

dependency "particle_health_service" {
  config_path = "../particle_health_service"
}

dependency "onfleet_hospitals_service" {
  config_path = "../onfleet_hospitals_service"
}

dependency "delivery_hospitals_service" {
  config_path = "../delivery_hospitals_service"
}

dependency "delivery_service" {
  config_path = "../delivery_service"
}

dependency "insurance_service" {
  config_path = "../insurance_service"
}

dependency "watchtower_service" {
  config_path = "../watchtower_service"
}

dependency "rx_task_service" {
  config_path = "../rx_task_service"
}

dependency "rx_ingestion_service" {
  config_path = "../rx_ingestion_service"
}

dependency "payment_service" {
  config_path = "../payment_service"
}

dependency "scheduling_service" {
  config_path = "../scheduling_service"
}

dependency "onfleet_internal_service" {
  config_path = "../onfleet_internal_service"
}

dependency "consumer_profile_service" {
  config_path = "../consumer_profile_service"
}

dependency "partners_service" {
  config_path = "../partners_service"
}

dependency "shipment_service" {
  config_path = "../shipment_service"
}

inputs = {
  prescription_service_api_gateway_base_url       = dependency.prescription_service.outputs.api_gateway_base_url
  patient_service_api_gateway_base_url            = dependency.patient_service.outputs.api_gateway_base_url
  facility_service_api_gateway_base_url           = dependency.facility_service.outputs.api_gateway_base_url
  mms_ingest_service_api_gateway_base_url         = dependency.mms_ingest_service.outputs.api_gateway_base_url
  ibd_service_api_gateway_base_url                = dependency.ibd_service.outputs.api_gateway_base_url
  satellite_service_api_gateway_base_url          = dependency.satellite_service.outputs.satellite_service_api_gateway_base_url
  particle_health_service_api_gateway_base_url    = dependency.particle_health_service.outputs.api_gateway_base_url
  onfleet_hospitals_service_api_gateway_base_url  = dependency.onfleet_hospitals_service.outputs.api_gateway_base_url
  delivery_hospitals_service_api_gateway_base_url = dependency.delivery_hospitals_service.outputs.api_gateway_base_url
  watchtower_service_api_gateway_base_url         = dependency.watchtower_service.outputs.watchtower_service_api_gateway_base_url
  rx_task_service_api_gateway_base_url            = dependency.rx_task_service.outputs.rx_task_service_api_gateway_base_url
  rx_ingestion_service_api_gateway_base_url       = dependency.rx_ingestion_service.outputs.api_gateway_base_url
  payment_service_api_gateway_base_url            = dependency.payment_service.outputs.payment_service_api_gateway_base_url
  scheduling_service_api_gateway_base_url         = dependency.scheduling_service.outputs.scheduling_service_api_gateway_base_url
  onfleet_internal_service_api_gateway_base_url   = dependency.onfleet_internal_service.outputs.api_gateway_base_url
  delivery_service_api_gateway_base_url           = dependency.delivery_service.outputs.api_gateway_base_url
  insurance_service_api_gateway_base_url          = dependency.insurance_service.outputs.api_gateway_base_url
  consumer_profile_service_api_gateway_base_url   = dependency.consumer_profile_service.outputs.api_gateway_base_url
  partners_service_api_gateway_base_url           = dependency.partners_service.outputs.api_gateway_base_url
  shipment_service_api_gateway_base_url           = dependency.shipment_service.outputs.api_gateway_base_url
}

include {
  path = find_in_parent_folders()
}
