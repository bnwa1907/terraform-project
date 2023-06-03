#Associate public subnets with routing table
resource "aws_route_table_association" "Public_sub1a_Route_Association" {
  subnet_id      = aws_subnet.web_sub1a.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "Public_sub1b_Route_Association" {
  subnet_id      = aws_subnet.web_sub1b.id
  route_table_id = aws_route_table.RT.id
}