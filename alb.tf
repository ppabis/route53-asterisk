resource "aws_alb" "ALB" {
  name            = "MyALB"
  subnets         = slice(data.aws_subnets.default.ids, 0, 2)
  security_groups = [data.aws_security_group.default.id]
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
