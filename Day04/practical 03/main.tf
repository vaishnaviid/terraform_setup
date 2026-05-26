provider "aws" {
    region = "ap-southeast-2"
  
}

# aws instance created on console is being imported to terraform state file using the import command.
resource "aws_instance" "server" {
    ami = "ami-007e5a061b93ceb2f"
    instance_type = "t3.micro"
    vpc_security_group_ids = "sg-0333bfc6ddecbdcb7" /*existing security group id*/
    key_name = "3tierserver" /*existing key pair name*/
  
}
# on shell use the command "terraform import aws_instance.server i-0c9b8e5f1a2b3c4d5" to import the existing EC2 instance to terraform state file.
resource "aws_security_group" "server_sg" {
  description = "Security group for my web server"
  name        = "server-sg"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     
    }
    egress ={
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    lifecycle {
  create_before_destroy = true
}
}

# on shell use the command "terraform import aws_security_group.server_sg sg-0333bfc6ddecbdcb7" to import the existing security group to terraform state file.
# then use the command "terraform import aws_instance.server_sg sg-0333bfc6ddecbdcb7" to associate the security group with the EC2 instance in terraform state file.
# and terraform plan and apply to see the changes in the terraform state file.