data "terraform_remote_state" "ibd_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/ibd_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "prescription_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/prescription_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "patient_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/patient_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "delivery_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/delivery_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "mms_ingest_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/mms_ingest_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "facility_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/facility_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "satellite_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/satellite_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "particle_health_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/particle_health_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "rx_task_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/rx_task_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "scheduling_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/scheduling_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "payment_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/payment_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "rx_ingestion_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/rx_ingestion_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "watchtower_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/watchtower_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "insurance_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/insurance_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "onfleet_hospitals_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/onfleet_hospitals_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "onfleet_internal_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/onfleet_internal_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "delivery_hospitals_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/delivery_hospitals_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "sms_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "noapp/dev/sms_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "refill_management_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/refill_management_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "shipment_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/shipment_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}

data "terraform_remote_state" "rx_suggestion_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-dev-terraform-state"
    key            = "global/rx_suggestion_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-dev-state-locks"
    encrypt        = true
    profile        = "medly-dev"
  }
}


module "proxy" {
  source                     = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-cloudfront-proxy/v1.1.1.zip"
  cname                      = var.subdomain_internal
  domain_name                = var.domain_name
  cloudfront_log_bucket      = var.cloudfront_log_bucket
  cloudfront_log_prefix      = var.cloudfront_log_prefix
  default_service_api_gw_url = data.terraform_remote_state.ibd_service_s3.outputs.api_gateway_base_url
  tags                       = var.tags
  origins = [
    {
      api_gw_url : data.terraform_remote_state.prescription_service_s3.outputs.api_gateway_base_url
      service_name : "prescription",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.patient_service_s3.outputs.api_gateway_base_url,
      service_name : "patient",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.facility_service_s3.outputs.api_gateway_base_url
      service_name : "facility",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.mms_ingest_service_s3.outputs.api_gateway_base_url
      service_name : "mms-ingest",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.ibd_service_s3.outputs.api_gateway_base_url
      service_name : "ibd",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.delivery_service_s3.outputs.api_gateway_base_url
      service_name : "delivery",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.satellite_service_s3.outputs.satellite_service_api_gateway_base_url
      service_name : "satellite",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.particle_health_service_s3.outputs.api_gateway_base_url
      service_name : "particle-health",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.rx_task_service_s3.outputs.rx_task_service_api_gateway_base_url
      service_name : "rx-task",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.scheduling_service_s3.outputs.scheduling_service_api_gateway_base_url
      service_name : "scheduling",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.payment_service_s3.outputs.api_gateway_base_url
      service_name : "payment",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.rx_ingestion_service_s3.outputs.api_gateway_base_url
      service_name : "rx-ingestion",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.watchtower_service_s3.outputs.watchtower_service_api_gateway_base_url
      service_name : "watchtower",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.insurance_service_s3.outputs.api_gateway_base_url
      service_name : "insurance",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.onfleet_hospitals_service_s3.outputs.api_gateway_base_url
      service_name : "onfleet-hospitals",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.onfleet_internal_service_s3.outputs.api_gateway_base_url
      service_name : "onfleet-internal",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.delivery_hospitals_service_s3.outputs.api_gateway_base_url
      service_name : "delivery-hospitals",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.sms_service_s3.outputs.api_gateway_base_url
      service_name : "sms",
      custom_headers : []
    },
    {
      api_gw_url : var.consumer_profile_service_api_gateway_base_url
      service_name : "consumer-profile",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.refill_management_service_s3.outputs.api_gateway_base_url
      service_name : "refill-management",
      custom_headers : []
    },
    {
      api_gw_url : "https://xkvhj83uge.execute-api.us-east-1.amazonaws.com/prod"
      service_name : "seaport-graphql-service",
      custom_headers : []
    },
    {
      api_gw_url : "https://6n2r9q1bb1.execute-api.us-east-1.amazonaws.com/prod"
      service_name : "noapp-task-service",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.shipment_service_s3.outputs.api_gateway_base_url
      service_name : "shipment",
      custom_headers : []
    },
    {
      api_gw_url : data.terraform_remote_state.rx_suggestion_service_s3.outputs.api_gateway_base_url
      service_name : "rx-suggestion",
      custom_headers : []
    }
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
      service_name : "rx-suggestion",
      path_pattern : "api/rxs*"
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
      service_name : "scheduling",
      path_pattern : "api/sch*"
    },
    {
      service_name : "payment",
      path_pattern : "api/paym*"
    },
    {
      service_name : "watchtower",
      path_pattern : "api/watch*"
    },
    {
      service_name : "insurance",
      path_pattern : "api/ins*"
    },
    {
      service_name : "onfleet-hospitals",
      path_pattern : "api/onfleet/hospitals*"
    },
    {
      service_name : "onfleet-internal",
      path_pattern : "api/onfleet/internal*"
    },
    {
      service_name : "delivery-hospitals",
      path_pattern : "api/hospital*"
    },
    {
      service_name : "delivery",
      path_pattern : "api/dp*"
    },
    {
      service_name : "sms",
      path_pattern : "api/sms-service*"
    },
    {
      service_name : "consumer-profile",
      path_pattern : "api/consumer*"
    },
    {
      service_name : "noapp-task-service",
      path_pattern : "api/noapp-task*"
    },
    {
      service_name : "seaport-graphql-service",
      path_pattern : "api/graphql*"
    },
    {
      service_name : "refill-management",
      path_pattern : "api/rms*"
    },
    {
      service_name : "shipment",
      path_pattern : "api/ss*"
    },
  ]
}