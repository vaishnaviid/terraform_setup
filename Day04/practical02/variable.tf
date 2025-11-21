variable "ami" {
    description = "add ami ID"
    type = string
    default = "ami-007e5a061b93ceb2f" 
  
}

variable "instance_type" {
    description = "instance type"
    default = "t3.micro"
  
}

variable "key_name" {
    description = "key-pair name"
    default = "3tier"
  
}

variable "sec_grp" {
    default = ["sg-0333bfc6ddecbdcb7"]
  
}
variable "az" {
    type = list(string)
    default = ["ap-southeast-2a", "ap-southeast-2b"]
  
}