resource "aws_instance" "third-instance-tf" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = "second-key"
  security_groups = ["first-sg_3"]
  tags = {
    Name = "third_ec2_tf"
  }
  user_data = file("${path.module}/script.sh")


  provisioner "file" {
    source      = "/home/ubuntu/user_data/demo"
    destination = "/home/ubuntu/demo"
      connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("${path.module}/id_rsa")
        host        = self.public_ip
      }
  }

}
