provider "aws" {
  alias = "third"
  region = "ap-southeast-2"
}

resource "aws_instance" "new_servers" {
  
  for_each = toset(["web", "app", "db"])
  ami           = "ami-007e5a061b93ceb2f"
  instance_type = "t3.micro"
  tags = {
    Name = "${each.key}_server"
  }
  
}