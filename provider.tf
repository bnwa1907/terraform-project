terraform {
  backend "s3" {
    encrypt = true    
    bucket = "iti-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
