provider "aws" {
    region = "ap-southeast-2"
  
}

resource "aws_instance" "web1" {
    ami = "ami-007e5a061b93ceb2f"
    key_name = "3tier"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my-sg.id]
    tags = {
        Name = "mywebserver2"
    }
}

resource "aws_security_group" "my-sg" {
    name        = "my-security-group"
    description = "Security group for my web server"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

}