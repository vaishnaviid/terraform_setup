variable "region" {
    description = "AWS region"
    default     = "ap-southeast-2"
  
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_cidr" {
    default = "10.0.0.0/20"
  
}

variable "az" {
    default = "ap-southeast-2a"
  
}
variable "az1" {
    default = "ap-southeast-2b"
  
}

variable "private_cidr" {
    default = "10.0.16.0/20"
}
variable "project_name" {
    default = "MycustomProject"
}
variable "ami" {
    default = "ami-007e5a061b93ceb2f"
  
}
variable "instance_type" {
    default = "t3.micro"
  
}
variable "key_name" {
  default = "3tier"
}