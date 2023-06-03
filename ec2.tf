#Create EC2 instances in public subnets
resource "aws_instance" "web-1a_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.web_sub1a.id
  security_groups             = [aws_security_group.web_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Code finally Worked.EC2 instance launched in us-east-1a!!!</h1>" > var/www/html/index.html
    EOF
}

resource "aws_instance" "web-1b_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.web_sub1b.id
  security_groups             = [aws_security_group.web_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Code finally Worked.EC2 instance launched in us-east-1b!!!</h1>" > var/www/html/index.html
    EOF
}

# Create a Database instance

resource "aws_instance" "db-1a_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.DB_sub1a.id
  security_groups             = [aws_security_group.db_sg.id]

}

resource "aws_instance" "db-1b_ec2" {
  ami                         = "ami-006dcf34c09e50022"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.DB_sub1b.id
  security_groups             = [aws_security_group.db_sg.id]
}

