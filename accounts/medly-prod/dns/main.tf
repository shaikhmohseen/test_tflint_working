data "aws_route53_zone" "medly_com" {
  name = "${local.domain_name}."
}

resource "aws_route53_record" "go" {
  zone_id = data.aws_route53_zone.medly_com.id
  name    = "go"
  type    = "CNAME"
  records = ["cname.bitly.com"]
  ttl     = "300"
}
