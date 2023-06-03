#Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "my_vpc"
  }
}
#Create Public subnet #1
resource "aws_subnet" "web_sub1a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "web_sub1a"
  }
}
#Create Public subnet #2
resource "aws_subnet" "web_sub1b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    Name = "web_sub1b"
  }
}
#Create Private subnet #1
resource "aws_subnet" "DB_sub1a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "192.168.3.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"
  tags = {
    Name = "DB_sub1a"
  }
}
#Create Private subnet #2
resource "aws_subnet" "DB_sub1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"
  tags = {
    Name = "DB_sub1b"
  }
}
