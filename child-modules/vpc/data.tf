

# Query AWS to get the available zones
data "aws_availability_zones" "available-zones" {
  state = var.state
}

 

 