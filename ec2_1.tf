provider "aws" {
    region = "ap-southeast-2"
}   


resource "aws_instance" "create_instance3" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    count = 2
    tags = {
        Name = "FirstInstance"
    }
}

resource "aws_instance" "create_instance2" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    count = 2
    tags = {
        Name = "secondInstance"
    }
}

resource "aws_instance" "create_instance1" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    count = 2
    tags = {
        Name = "ThirdInstance"
    }
} 
  
