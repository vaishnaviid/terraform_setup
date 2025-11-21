provider "aws" {
    region = "ap-southeast-2"
  
}

resource "aws_instance" "my-web" {
  # refers to variables defined in variables.tf
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  availability_zone = var.az[0]
  vpc_security_group_ids = var.sec_grp
  #heredoc -> EOF
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo "<h1> Deployed via Terraform </h1>" > /var/www/html/index.html
              EOF
  tags = {
    Name = "web-server"
  }
}