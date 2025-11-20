provider "aws" {
    alias  = "second"
    region = "ap-southeast-2"
}   


resource "aws_instance" "create_instance3" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    count = 3
    tags = {
        Name = "webserver${count.index + 1}"
    }
}


  
