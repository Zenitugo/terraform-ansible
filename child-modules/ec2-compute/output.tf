
# Output the private key id
output "private_key" {
  value = tls_private_key.ssh_key.private_key_pem
  sensitive=true
}

#################################################################################################################
#################################################################################################################
# Output the public key id
output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
  sensitive=true
}

#################################################################################################################
#################################################################################################################
# Output security group ids
output "vpc_security_group_ids" {
  value = aws_security_group.sg-group.id
}

#################################################################################################################
#################################################################################################################

# Output the public ips

output "public_IP" {
  value = aws_instance.compute[*].public_ip
}

################################################################################################################
################################################################################################################
output "instance-id" {
  value = aws_instance.compute.*.id
}


