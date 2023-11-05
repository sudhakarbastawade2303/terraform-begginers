provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "ec2" {
  source        = "./modules/ec2"
  image_id      = var.image_id
  instance_type = var.instance_type
  
}

module "vpc" {
  source = "./modules/vpc"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
