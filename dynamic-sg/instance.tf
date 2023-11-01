resource "aws_instance" "second-instance-tf" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "first-key"
  security_groups = ["first-sg_2"]
  tags = {
    Name = "second_ec2_tf"
  }
}
