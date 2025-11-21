/*
provider "aws" {
    region = "ap-southeast-2"
  
}

resource "aws_instance" "appserver" {
  # refers to variables defined in variables.tf
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.sec_grp
  tags = {
    Name = "appserver"
  }
}
*/