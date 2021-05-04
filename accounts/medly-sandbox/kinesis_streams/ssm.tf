resource "aws_ssm_parameter" "prescription_stream" {
  name        = "/${var.env}/prescriptionStreamARN"
  description = "The ARN of the Presctiption Stream"
  type        = "String"
  value       = module.prescription_stream.kinesis_data_stream_arn
}



