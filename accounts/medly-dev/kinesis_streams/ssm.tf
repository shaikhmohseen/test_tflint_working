resource "aws_ssm_parameter" "patient_stream" {
  name        = "/${var.env}/patientStreamARN"
  description = "The ARN of the Patient Stream"
  type        = "String"
  value       = module.patient_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "prescription_stream" {
  name        = "/${var.env}/prescriptionStreamARN"
  description = "The ARN of the Presctiption Stream"
  type        = "String"
  value       = module.prescription_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "mms_patient_stream" {
  name        = "/${var.env}/mmsPatientStreamARN"
  description = "The ARN of the MMS Patient Stream"
  type        = "String"
  value       = module.mms_patient_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "mms_prescription_stream" {
  name        = "/${var.env}/mmsPrescriptionStreamARN"
  description = "The ARN of the MMS prescription Stream"
  type        = "String"
  value       = module.mms_prescription_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "onfleet_hospitals_stream" {
  name        = "/${var.env}/onfleetHospitalsStreamARN"
  description = "The ARN of the Onfleet Hospitals Stream"
  type        = "String"
  value       = module.onfleet_hospitals_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "onfleet_internal_stream" {
  name        = "/${var.env}/onfleetInternalStreamARN"
  description = "The ARN of the Onfleet Internal Stream"
  type        = "String"
  value       = module.onfleet_internal_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "dph_mms_patient_stream" {
  name        = "/${var.env}/dph-mms-patient-stream-arn"
  description = "The ARN of the DPH MMS Patient Stream"
  type        = "String"
  value       = module.dph_mms_patient_stream.kinesis_data_stream_arn
}

resource "aws_ssm_parameter" "dph_mms_prescription_stream" {
  name        = "/${var.env}/dph-mms-prescription-stream-arn"
  description = "The ARN of the DPH MMS prescription Stream"
  type        = "String"
  value       = module.dph_mms_prescription_stream.kinesis_data_stream_arn
}
