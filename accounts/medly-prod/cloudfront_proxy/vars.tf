variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "cloudfront_log_bucket" {
  type        = string
  description = "Bucket for cloudfront logs"
}

variable "cloudfront_log_prefix" {
  type        = string
  description = "Cloudfront log prefix"
}

variable "subdomain_internal" {
  type        = string
  description = "subdomain for the internal cloudfront distribution"
}

variable "subdomain_partners" {
  type        = string
  description = "subdomain for the partners cloudfront distribution"
}

variable "prescription_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for prescription_service"
}

variable "patient_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for patient_service"
}

variable "facility_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for facility_service"
}

variable "mms_ingest_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for mms_ingest_service"
}

variable "ibd_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for ibd_service"
}

variable "satellite_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for satellite_service"
}

variable "particle_health_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for particle_health_service"
}

variable "onfleet_hospitals_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for onfleet_hospitals_service"
}

variable "delivery_hospitals_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for delivery_hospitals_service"
}

variable "watchtower_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for watchtower_service"
}

variable "rx_task_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for rx_task_service"
}

variable "rx_ingestion_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for rx_ingestion_service"
}

variable "payment_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for payment_service"
}

variable "scheduling_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for scheduling_service"
}

variable "onfleet_internal_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for onfleet_internal_service"
}

variable "delivery_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for delivery_service"
}

variable "insurance_service_api_gateway_base_url" {
  type        = string
  description = "api gateway base url for insurance_service"
}

variable "consumer_profile_service_api_gateway_base_url" {
  type        = string
  description = "API gateway base URL for Consumer Profile Service"
}

variable "partners_service_api_gateway_base_url" {
  type        = string
  description = "API gateway base URL for Partners Service"
}

variable "shipment_service_api_gateway_base_url" {
  type        = string
  description = "API gateway base URL for Shipment Service"
}
