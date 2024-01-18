# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.vpc_name}- ${var.environment}"
  }
}

#####################################################################################################################################
#####################################################################################################################################

# Create public and private subnet
# public subnet
resource "aws_subnet" "public-subnet-a" {
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = cidrsubnet(var.cidr_block, 8, 1)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available-zones.names[0]


  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = cidrsubnet(var.cidr_block, 8, 15)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available-zones.names[1]


  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "public-subnet-c" {
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = cidrsubnet(var.cidr_block, 8, 25)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available-zones.names[2]


  tags = {
    Name = "public-subnet-c"
  }
}

######################################################################################################################################
######################################################################################################################################

# Create internet gateway
resource "aws_internet_gateway" "vpc-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "my-internet-gateway"
  }
}

########################################################################################################################################
########################################################################################################################################

# Create route table
resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "my-rt"
  }
}

#########################################################################################################################################
#########################################################################################################################################


# Create route table associations
resource "aws_route_table_association" "main-rt-association"{
  count = 3
  subnet_id      = [aws_subnet.public-subnet-a.id, aws_subnet.public-subnet-b.id, aws_subnet.public-subnet-c.id][count.index]
  route_table_id = aws_route_table.main-rt.id
}

##########################################################################################################################################
##########################################################################################################################################

# Edits the routes of the three subnets
resource "aws_route" "rt" {
  route_table_id              = aws_route_table.main-rt.id
  destination_cidr_block      = "0.0.0.0/0"
  gateway_id                  = aws_internet_gateway.vpc-gateway.id
}



