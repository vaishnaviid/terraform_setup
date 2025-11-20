provider "aws" {
    alias = "fourth"
    region = "ap-southeast-2"
}   

resource "aws_instance" "web" {
    ami = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    key_name = "3ter"
    vpc_security_group_ids = "sgr-0c3c97ba54408deed"
    tags = {
        Name = "mywebserver"
    }
}