terraform {
  backend "s3" {
    bucket = "terraformbucketforstate1"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-custom-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.public_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_cidr
  availability_zone = var.az1
  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "${var.project_name}-internet-gateway"
  }
}

resource "aws_default_route_table" "default_main_rt" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id
  tags = {
    Name = "${var.project_name}-default-main-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_default_route_table.default_main_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}

resource "aws_security_group" "my_sg" {
  name        = "${var.project_name}-web-sg"
  description = "Allow HTTP, SSH, MySQL"
  vpc_id      = aws_vpc.myvpc.id

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

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "public_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "${var.project_name}-public-instance"
  }
}

resource "aws_instance" "private_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "${var.project_name}-private-instance"
  }
}
