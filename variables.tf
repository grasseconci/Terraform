variable "vpc_cidr_block"{
default = "10.0.0.0/16"

}

variable "public_subnet_cidr"{
default = "10.0.1.0/24"

}

variable "route_cidr_block"{
default = "0.0.0.0/0"

}

variable "instance_user"{
default = " "

}