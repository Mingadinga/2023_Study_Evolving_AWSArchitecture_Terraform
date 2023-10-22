resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [ aws_security_group.my-alb-sg.id ]
  subnets            = [ aws_subnet.my-public-web-subnet-1.id, aws_subnet.my-public-web-subnet-2.id ]

  tags = {
    Name = "my-alb"
  }
}

resource "aws_lb_target_group" "my-alb-php-tg" {
//   name     = "my-alb-php-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-alb-php-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "php-app-server-1-attachment" {
  target_group_arn = aws_lb_target_group.my-alb-php-tg.arn
  target_id        = aws_instance.my-php-app-server-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "php-app-server-2-attachment" {
  target_group_arn = aws_lb_target_group.my-alb-php-tg.arn
  target_id        = aws_instance.my-php-app-server-2.id
  port             = 80
}