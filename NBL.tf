#Create an NLB target group
resource "aws_lb_target_group" "nlb-TG" {
  name     = "nlb-TG"
  port     = "80"
  protocol = "TCP"
  vpc_id   = aws_vpc.my_vpc.id
}

#Create Load balancer
resource "aws_lb" "nlb" {
  name               = "nlb"
  internal           = false
  load_balancer_type = "network"
  
  subnets            = [aws_subnet.web_sub1a.id, aws_subnet.web_sub1b.id]
}

# Create Load balancer listner rule
resource "aws_lb_listener" "nlb_lst" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb-TG.arn
  }
}

#Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-aws-nlb" {
  target_group_arn = aws_lb_target_group.nlb-TG.arn
  target_id        = aws_instance.web-1a_ec2.id
  port             = 80
}

#Load balancer-Target group attachment
resource "aws_lb_target_group_attachment" "my-aws-nlb2" {
  target_group_arn = aws_lb_target_group.nlb-TG.arn
  target_id        = aws_instance.web-1b_ec2.id
  port             = 80
}
