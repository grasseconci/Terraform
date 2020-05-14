provider "aws" {
region = "us-east-1"
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_subnet.subnet1.id}"

  route {
    cidr_block = "10.0.1.0/16"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "RouteTable"
  }
}


resource "aws_subnet" "subnet1"{
vpc_id	= "${aws_vpc.vpcdemo.id}"
cidr_block = "10.0.0.0/16"

tags = {
	Name = "SubnetDemo"
  }
}



resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpcdemo.id}"

  tags = {
    Name = "main"
  }
}


resource "aws_vpc" "vpcdemo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC"
  }
}
