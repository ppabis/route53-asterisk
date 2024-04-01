data "aws_route53_zone" "domain" {
  name         = var.DomainName
  private_zone = false
  provider     = aws.us-east-1
}

resource "aws_route53_record" "asterisk" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "*.asterisk.${var.DomainName}"
  type    = "A"
  alias {
    name                   = aws_alb.ALB.dns_name
    zone_id                = aws_alb.ALB.zone_id
    evaluate_target_health = false
  }
  provider = aws.us-east-1
}
