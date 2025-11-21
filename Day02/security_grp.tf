/*
provider "aws" {
    alias = "fourth"
    region = "ap-southeast-2"
}   

resource "aws_instance" "web" {
    ami = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    key_name = "3tier"
    vpc_security_group_ids = ["sg-0333bfc6ddecbdcb7"]
    tags = {
        Name = "mywebserver"
    }
}
*/