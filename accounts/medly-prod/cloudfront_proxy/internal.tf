module "proxy" {
  source                     = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-cloudfront-proxy/v1.1.0.zip"
  domain_name                = var.domain_name
  cname                      = var.subdomain_internal
  cloudfront_log_bucket      = var.cloudfront_log_bucket
  cloudfront_log_prefix      = var.cloudfront_log_prefix
  default_service_api_gw_url = var.ibd_service_api_gateway_base_url
  origins = [
    {
      api_gw_url : var.prescription_service_api_gateway_base_url
      service_name : "prescription"
      custom_headers : []
    },
    {
      api_gw_url : var.patient_service_api_gateway_base_url
      service_name : "patient"
      custom_headers : []
    },
    {
      api_gw_url : var.facility_service_api_gateway_base_url
      service_name : "facility"
      custom_headers : []
    },
    {
      api_gw_url : var.mms_ingest_service_api_gateway_base_url
      service_name : "mms-ingest"
      custom_headers : []
    },
    {
      api_gw_url : var.ibd_service_api_gateway_base_url
      service_name : "ibd"
      custom_headers : []
    },
    {
      api_gw_url : var.satellite_service_api_gateway_base_url
      service_name : "satellite"
      custom_headers : []
    },
    {
      api_gw_url : var.particle_health_service_api_gateway_base_url
      service_name : "particle-health"
      custom_headers : []
    },
    {
      api_gw_url : var.onfleet_hospitals_service_api_gateway_base_url
      service_name : "onfleet-hospitals"
      custom_headers : []
    },
    {
      api_gw_url : var.delivery_hospitals_service_api_gateway_base_url
      service_name : "delivery-hospitals"
      custom_headers : []
    },
    {
      api_gw_url : var.watchtower_service_api_gateway_base_url
      service_name : "watchtower"
      custom_headers : []
    },
    {
      api_gw_url : var.rx_task_service_api_gateway_base_url
      service_name : "rx-task"
      custom_headers : []
    },
    {
      api_gw_url : var.rx_ingestion_service_api_gateway_base_url
      service_name : "rx-ingestion"
      custom_headers : []
    },
    {
      api_gw_url : var.payment_service_api_gateway_base_url
      service_name : "payment"
      custom_headers : []
    },
    {
      api_gw_url : var.scheduling_service_api_gateway_base_url
      service_name : "scheduling"
      custom_headers : []
    },
    {
      api_gw_url : var.onfleet_internal_service_api_gateway_base_url
      service_name : "onfleet-internal"
      custom_headers : []
    },
    {
      api_gw_url : var.delivery_service_api_gateway_base_url
      service_name : "delivery"
      custom_headers : []
    },
    {
      api_gw_url : var.insurance_service_api_gateway_base_url
      service_name : "insurance"
      custom_headers : []
    },
    {
      api_gw_url : var.consumer_profile_service_api_gateway_base_url
      service_name : "consumer-profile"
      custom_headers : []
    },
    {
      api_gw_url : var.shipment_service_api_gateway_base_url
      service_name : "shipment",
      custom_headers : []
    },
    {
      api_gw_url : "https://pjkb94igvi.execute-api.us-east-1.amazonaws.com/prod"
      service_name : "noapp-task-service",
      custom_headers : []
    },
    {
      api_gw_url : "https://cbas43hbt0.execute-api.us-east-1.amazonaws.com/prod"
      service_name : "seaport-graphql-service",
      custom_headers : []
    },
  ]
  behaviours = [
    {
      service_name : "rx-task",
      path_pattern : "api/rx-task*"
    },
    {
      service_name : "rx-ingestion",
      path_pattern : "api/rx-ingest*"
    },
    {
      service_name : "prescription",
      path_pattern : "api/rx*"
    },
    {
      service_name : "patient",
      path_pattern : "api/ps*"
    },
    {
      service_name : "facility",
      path_pattern : "api/fs*"
    },
    {
      service_name : "mms-ingest",
      path_pattern : "api/mms-ingest*"
    },
    {
      service_name : "ibd",
      path_pattern : "api/ibd*"
    },
    {
      service_name : "satellite",
      path_pattern : "api/satellite*"
    },
    {
      service_name : "particle-health",
      path_pattern : "api/phs*"
    },
    {
      service_name : "onfleet-hospitals",
      path_pattern : "api/onfleet/hospitals*"
    },
    {
      service_name : "delivery-hospitals",
      path_pattern : "api/hospital*"
    },
    {
      service_name : "watchtower",
      path_pattern : "api/watch*"
    },
    {
      service_name : "payment",
      path_pattern : "api/paym*"
    },
    {
      service_name : "scheduling",
      path_pattern : "api/sch*"
    },
    {
      service_name : "onfleet-internal",
      path_pattern : "api/onfleet/internal*"
    },
    {
      service_name : "insurance",
      path_pattern : "api/ins*"
    },
    {
      service_name : "delivery",
      path_pattern : "api/dp*"
    },
    {
      service_name : "consumer-profile",
      path_pattern : "api/consumer*"
    },
    {
      service_name : "shipment",
      path_pattern : "api/ss*"
    },
    {
      service_name : "noapp-task-service",
      path_pattern : "api/noapp-task*"
    },
    {
      service_name : "seaport-graphql-service",
      path_pattern : "api/graphql*"
    },
  ]
}
