resource "aws_vpc" "Default_VPC" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "Default_VPC"
  }
}

resource "aws_internet_gateway" "Internet-gateway-1" {
  vpc_id = aws_vpc.Default_VPC.id

  tags = {
    Name = "Internet-gateway-1"
  }
}