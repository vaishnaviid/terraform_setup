# terraform taint practical
provider "aws" {
    alias  = "second"
    region = "ap-southeast-2"
}   


resource "aws_instance" "web_1" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    key_name = "webkey"
    tags = {
        Name = "webserver1"
    }
}

resource "aws_instance" "web_2" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    key_name = "webkey"
    tags = {
        Name = "webserver2"
    }
}
resource "aws_instance" "web_3" {
    ami           = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    key_name = "webkey"
    tags = {
        Name = "webserver3"
    }
}

# $ terraform init 
# $ terraform plan
# $ terraform apply --auto-approve

# suppose web_2 is not working and we want to recreate it, we can use terraform taint command to mark the resource as tainted, which will force it to be destroyed and recreated on the next apply.
# $ terraform taint aws_instance.web_2
# $ terraform apply --auto-approve

                            # OR
# $ terraform apply -replace=aws_instance.web_2 --auto-approve                     