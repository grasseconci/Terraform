resource "aws_instance" "terraform_test" {
  count                       = "${var.num_nodes}"
  ami                         = "${var.ami_id}"
  instance_type               = "t2.micro"
  security_groups             = ["${aws_security_group.allow_22.id}"]
  
  tags = {
    Name = "Test"
  }
}
resource "aws_security_group" "allow_22" {
  vpc_id      = "vpc-00e2272820918caf5"
  name        = "SecurityGroupDemo"
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysecurityg"
  }
}
