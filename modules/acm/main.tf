data "aws_route53_zone" "this" {
  name         = var.zone_name
  private_zone = var.private_zone
}

# Create an ACM Certificate
# NOTE: The certificate must be in the US East (N. Virginia) Region (us-east-1) for CloudFront
resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  lifecycle {
    create_before_destroy = true
  }
}

# Create CNAMES for ACM Certificate validation.
resource "aws_route53_record" "this" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.this.zone_id
}

# Wait for the certificate to be issued.
resource "aws_acm_certificate_validation" "this" {
  timeouts {
    create = "5m"
  }
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.this : record.fqdn]
}
