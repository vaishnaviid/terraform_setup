provider "aws" {
    region = "ap-southeast-2"
  
}
resource "aws_instance" "new-web" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [data.aws_security_group.aws-sg.id]
}

data "aws_security_group" "aws-sg" {
    name = "aws-console-sg"
    vpc_id = "vpc-09d210704b836f4dc"
}