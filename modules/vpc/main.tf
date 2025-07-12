####-----VPC-----------

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_instance_tenancy
  
  tags = var.common_tags
}

#####--------SUBNETS-------------

resource "aws_subnet" "subnets" {
  count                   = length(data.aws_availability_zones.my_az.names)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.sub_cidr[count.index]
  availability_zone       = data.aws_availability_zones.my_az.names[count.index]
  map_public_ip_on_launch = var.subnets_map_public_ip_on_launch
  tags = var.common_tags
}


#######---IGW----------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = var.common_tags
}

#####-----ROUTE___TABLE-------

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.rt-route
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.common_tags
}

##########--ROUTE--TABLE--ASSOCIATION

resource "aws_route_table_association" "rt-association" {
  count = length(aws_subnet.subnets)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.my-rt.id
}

