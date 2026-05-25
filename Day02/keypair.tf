provider "aws" {
    region = "ap-southeast-2"
}


resource "aws_instance" "webinstance" {
  ami = "ami-007e5a061b93ceb2f"
  instance_type= "t3.micro"
  vpc_security_group_ids = [aws_security_group.websg.id]
  key_name = aws_key_pair.webkey.key_name
}

resource "aws_security_group" "websg" {
    name = "web-sg"
    description = "Security group for web server"

    ingress {
        from_port =22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle {
      create_before_destroy = true
    }
}

resource "tls_private_key" "mywebkey" {
    algorithm = "RSA"
    rsa_bits = 4096
}


resource "aws_key_pair" "webkey" {
    key_name = "webkey"
    public_key = tls_private_key.mywebkey.public_key_openssh
}

resource "local_file" "private_key" {
    content = tls_private_key.mywebkey.private_key_pem
    filename = "webkey.pem"
    file_permission = "0400"
}