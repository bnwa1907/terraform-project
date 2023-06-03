#Create Internet gateway
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.my_vpc.id


}

#Create Route Table for Public Subnets
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }

}