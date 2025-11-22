terraform {
  backend "s3" {
    bucket = "terraformbucketforstate1"
    key = "terraform.tfstate"
    region = "ap-southeast-2"
    
  }
}