resource "aws_security_group" "HTTP" {
  name        = "HTTP"
  description = "Allow HTTP inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_alb" "ALB" {
  name            = "MyALB"
  subnets         = slice(data.aws_subnets.default.ids, 0, 2)
  security_groups = [aws_security_group.HTTP.id]
}



resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.ALB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<html><body><h1>Fall through!</h1></body></html>"
      status_code  = "200"
    }
  }
}
