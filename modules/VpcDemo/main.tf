
provider "aws" {
region = "us-east-1"
}


# Vpc

resource "aws_vpc" "vpcdemo"{
cidr_block	 = "${var.vpc_cidr_block}"
instance_tenancy = "default"

tags = {
	name = "vpcdemo"
 }
}


# Public Subnet 

resource "aws_subnet" "subnetdemo" {
	vpc_id     = "${aws_vpc.vpcdemo.id}"
 	cidr_block = "${var.public_subnet_cidr}"	

tags = {
	name = "subnetdemo"
 }
}


#Internet Gateway

resource "aws_internet_gateway" "igateway"{
	vpc_id	= "${aws_vpc.vpcdemo.id}"

tags = {
	name = "igateway" 
  }
}


#Route Table

resource "aws_route_table" "routetable1" {
  vpc_id = "${aws_vpc.vpcdemo.id}"

  route {
    cidr_block = "${var.route_cidr_block}"
    gateway_id = "${aws_internet_gateway.igateway.id}"
  }

  tags = {
    Name = "Routetable1"
  }
}


#Subnet Association

resource "aws_route_table_association" "route-asso"{
subnet_id = aws_subnet.subnetdemo.id
route_table_id = aws_route_table.routetable1.id
}
