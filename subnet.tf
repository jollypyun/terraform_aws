resource "aws_subnet" "subnet-01" {
  vpc_id = aws_vpc.Default_VPC.id
  cidr_block = "172.31.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "subnet-01"
  }
}