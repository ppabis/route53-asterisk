resource "aws_alb_listener_rule" "hello" {
  listener_arn = aws_alb_listener.http.arn
  priority     = 100

  action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<html><body><h1>Hi there!</h1></body></html>"
      status_code  = "200"
    }
  }

  condition {
    host_header {
      values = ["hello.asterisk.${var.DomainName}"]
    }
  }
}

resource "aws_alb_listener_rule" "goodbye" {
  listener_arn = aws_alb_listener.http.arn
  priority     = 101

  action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<html><body><h1>Goodbye!</h1></body></html>"
      status_code  = "200"
    }
  }

  condition {
    host_header {
      values = ["goodbye.asterisk.${var.DomainName}"]
    }
  }
}
