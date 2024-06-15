resource "aws_instance" "my_instance" {
  ami = "ami-0edc5427d49d09d2a"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.Default-SG.id ]
  subnet_id = aws_subnet.subnet-01.id
  tags = {
    Name = "instance-01"
  }
}

resource "aws_security_group" "Default-SG" {
  name = "Default-SG"
  description = "allow 20, 80"
  vpc_id = aws_vpc.Default_VPC.id
}

resource "aws_security_group_rule" "Default-SG_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.Default-SG.id
    description = "ssh"
}

resource "aws_security_group_rule" "Default-SG_http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.Default-SG.id
    description = "http"
}

resource "aws_security_group_rule" "Default-SG_outbound" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_group_id = aws_security_group.Default-SG.id
    description = "outbound"
}