terraform {
  source = "."
}

dependency "kinesis_streams" {
  config_path = "../kinesis_streams"
}

inputs = {
  source_stream_arn_list = [
    dependency.kinesis_streams.outputs.mms_prescription_stream_arn,
    dependency.kinesis_streams.outputs.mms_patient_stream_arn
  ]
}

include {
  path = find_in_parent_folders()
}
