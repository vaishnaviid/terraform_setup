provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "web_server" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "webkey"
  provisioner "file" {
    content = "Hello World"
    destination = "/tmp/hello.txt"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.web_server.public_ip
    private_key = file("downloads/webkey.pem")
  }
}