#output block is used to display the output of the terraform code after execution. 
#It is used to display the value of a resource or a variable after the terraform code is executed. 
#In this case, we are displaying the public IP address of the EC2 instance that we have created.
output "public_ip" {
    value = aws_instance.my-web.public_ip
  
}
