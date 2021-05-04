output "api_gateway_eips" {
  value = aws_eip.eips.*.public_ip
}

output "jumphost_eip" {
  value = aws_eip.jumphost_eip.public_ip
}
