# Custom domain name for the S3 bucket
data "aws_route53_zone" "nuunya_business" {
  name         = var.zone_name
  private_zone = var.private_zone
}

# Create a CNAME to the S3 bucket.
# resource "aws_route53_record" "cname_record" {
#   zone_id = data.aws_route53_zone.nuunya_business.zone_id
#   name    = var.record_name
#   type    = var.record_type
#   ttl     = var.ttl
#   records = var.records
# }

resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.nuunya_business.zone_id
  name    = "its.${var.domain_name_simple}"
  type    = var.record_type

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}
