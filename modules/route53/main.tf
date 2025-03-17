# Custom domain name for the S3 bucket
data "aws_route53_zone" "nuunya_business" {
  name         = var.zone_name
  private_zone = var.private_zone
}

# Add CNAME for validation from the pervious step.
# resource "aws_route53_record" "nuunya_business_dns" {
#   allow_overwrite = true
#   name            = tolist(var.domain_validation_options)[0].resource_record_name
#   records         = [tolist(var.domain_validation_options)[0].resource_record_value]
#   type            = tolist(var.domain_validation_options)[0].resource_record_type
#   zone_id         = data.aws_route53_zone.nuunya_business.zone_id
#   ttl             = 60
# }

# Certificate validation records
# resource "aws_route53_record" "certificate_validation" {
#   count   = length(var.domain_validation_options)
#   zone_id = data.aws_route53_zone.nuunya_business.zone_id
#   name    = var.domain_validation_options[count.index]["resource_record_name"]
#   type    = var.domain_validation_options[count.index]["resource_record_type"]
#   records = [var.domain_validation_options[count.index]["resource_record_value"]]
#   ttl     = 60
# }

# Create a CNAME to the S3 bucket.
resource "aws_route53_record" "cname_record" {
  zone_id = data.aws_route53_zone.nuunya_business.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.ttl
  records = var.records
}



# resource "aws_route53_record" "domain" {
#   zone_id = data.aws_route53_zone.nuunya_business.zone_id
#   name    = var.domain_name
#   type    = "A"

#   alias {
#     name                   = var.cloudfront_domain_name
#     zone_id                = var.cloudfront_zone_id
#     evaluate_target_health = false
#   }
# }


####################
# ACM
####################
