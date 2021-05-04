variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "subnet_octet" {
  description = "The second octet value in the subnet. Others are a standard pattern."
  type        = string
}

variable "availability_zones" {
  description = "VPD availability zones. Should match the provided AWS region"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for Awerex Service"
}

variable "eip_count" {
  type        = number
  default     = 2
  description = "Number of elastic IPs to be reserved"
}
