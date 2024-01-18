
# Output vpc ids
output "vpc_id" {
  value = aws_vpc.vpc.id
}

################################################################################################################
###############################################################################################################

# Output public subnets ids
output "public_subnet_id-a" {
    value = aws_subnet.public-subnet-a.id
}


output "public_subnet_id-b" {
    value = aws_subnet.public-subnet-b.id
}


output "public_subnet_id-c" {
    value = aws_subnet.public-subnet-c.id
}


##################################################################################################################
################################################################################################################

# Output vpc name

output "vpc_name" {
  value = var.vpc_name
}


###################################################################################################################
##################################################################################################################

# Output available zones

output "available-zones" {
  value = data.aws_availability_zones.available-zones.names

}