resource "aws_key_pair" "key-tf" {
  key_name   = "first-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCB/C6kgc2dnvZNigClCBcDwms2LaxEPD7Vk0dnMShotW57ZTL2pE3II6n55UU/HrLTX/7vSsaxqNts5b5PE8VEwpv8VLZe5TkMVNLz+Sl2e+7HbRbR0B5ZRDIHQ2Lj1W4aKrWARTYhpHxI+BfLztDKdkX4EaftKBitqgHbgc7mAvip2HSXwUF1iyqCTFr8ug5y7aM+ERnOPaPcDji0SMseZroPQ/VqRU/4uGoyvO23Vl4vG/PmsN8ZFUMY9O5ifuquVRSzABPLYKJI3cDQMeOr3NiAy+nMWBa17WagPbnWnBskBeTx1dGsTPHFvkWqjCzx2lLLXZV4OjOTN/kBPSTVLND/wUGPw67gzn2oBHnCR3nkkD45NL2nLJK+uBwXXjOoIHuHMxXzeW8Q7Me27voMr1UgnG9L490rp3xkvUxaQqJLy7Z9pGkMQPjbRKWNdbPhuH7gCXwAGr8u0u+ese5zQdC9Ne21RoHd3fVyN8DaMnm2tdsIrEH9DsjuV1Ee/kU= ubuntu@ip-172-31-27-113"
}



resource "aws_instance" "first-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "first-key"
  security_groups = ["first-sg-tf"]
  tags = {
    Name = "first_ec2_tf"
  }
}

resource "aws_security_group" "sg-tf" {
  name        = "first-sg-tf"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF-sg"
  }
}
