# creat vpc #
resource "aws_vpc" "mdev" {
cidr_block = "10.0.0.0/16"
tags = {
  Name = "dev"
}
  
}
# creat ig & attach to vpc #
resource "aws_internet_gateway" "dev4" {
  vpc_id = aws_vpc.mdev.id
  
}
# creat subnet #
resource "aws_subnet" "dev" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.mdev.id
  
}
# creat pvt subnet #
resource "aws_subnet" "dev1" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.mdev.id
  
}
# creat ip #
resource "aws_eip" "devip" {
  tags = {
    Name = "eip"
  }
  
}
# creat routes & edit routes #
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.mdev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev4.id
  }
  
}
# subnet association #
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.dev.id
  subnet_id = aws_subnet.dev.id
  
}
# creat natgateway #
resource "aws_nat_gateway" "ng2" {
  subnet_id = aws_subnet.dev.id
  allocation_id = aws_eip.devip.id
  tags = {
    Name ="natgateway"
  }
  
}
# creat route table & attach natgateway #
resource "aws_route_table" "dev1" {
  vpc_id = aws_vpc.mdev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ng2.id
  }
  tags = {
    Name = "dev1"
  }
  
}
# subnet association pvt #
resource "aws_route_table_association" "dev1" {
  route_table_id = aws_route_table.dev.id
  subnet_id = aws_subnet.dev1.id
  
}
# creat securitygroups #
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.mdev.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }