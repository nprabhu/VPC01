resource "aws_vpc" "npd_vpc2" {
  cidr_block           = var.cidr_block_range
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "npd_vpc2"
  }
}

resource "aws_internet_gateway" "npd_IGW" {
  vpc_id = aws_vpc.npd_vpc2.id
}

resource "aws_subnet" "Public_Subnet" {
  count             = 5
  vpc_id            = aws_vpc.npd_vpc2.id
  availability_zone = local.azs[count.index % length(local.azs)]
  cidr_block        = cidrsubnet(var.cidr_block_range, 9, count.index)

  tags = local.Publicsubnets_tags[count.index]
}

resource "aws_subnet" "Private_Subnets" {
  count             = 5
  vpc_id            = aws_vpc.npd_vpc2.id
  availability_zone = local.azs[count.index % length(local.azs)]
  cidr_block        = cidrsubnet(var.cidr_block_range, 9, count.index + 5)

  tags = local.Privatesubnets_tags[count.index]
}

resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.npd_vpc2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.npd_IGW.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = aws_vpc.npd_vpc2.id

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "Public_RTA" {
  count          = length(aws_subnet.Public_Subnet)
  route_table_id = aws_route_table.PublicRT.id
  subnet_id      = aws_subnet.Public_Subnet[count.index].id
}

resource "aws_route_table_association" "Private_RTA" {
  count          = length(aws_subnet.Private_Subnets)
  route_table_id = aws_route_table.PrivateRouteTable.id
  subnet_id      = aws_subnet.Private_Subnets[count.index].id
}
