/*
terraform {
    backend "s3" {
        bucket = "terraformbucketforstate1"
        key = "myfile.tfstate"
        region = "ap-southeast-2"
        
    }
  
}
provider "aws" {
    region = "ap-southeast-2"
  
}

resource "aws_instance" "app-server" {
  # refers to variables defined in variables.tf
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.sec_grp
  tags = {
    Name = "app-server"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip_address.txt"
    
  }
}
*/