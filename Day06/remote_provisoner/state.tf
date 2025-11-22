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

resource "aws_instance" "appserver" {
  # refers to variables defined in variables.tf
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.sec_grp
  tags = {
    Name = "appserver"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "echo '<h1> Deployed via Terraform </h1>' | sudo tee /usr/share/nginx/html/index.html"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/home/ec2-user/3tier.pem")
      host        = self.public_ip
    }
    
  }
}