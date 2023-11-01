resource "aws_security_group" "sg-tf_2" {
  name        = "first-sg_2"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [22,80,443,8080,]
      iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = [22,80,443,8080,]
      iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "TF-sg_2"
  }
}
