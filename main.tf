module "s3" {
  source = "./modules/s3"

  # Needs to match domain name for R53
  bucket_name = "its.nuunya.business"
}

module "acm" {
  source = "./modules/acm"

  domain_name       = "*.nuunya.business"
  validation_method = "DNS"
}

# module "route53" {
#   source = "./modules/route53"

#   website_endpoint  = module.s3.website_endpoint
#   record_name       = "its"
#   record_type       = "CNAME"
#   records           = [module.s3.website_endpoint]
#   ttl               = 300
#   s3_hosted_zone_id = module.s3.hosted_zone_id
# }


module "cloudfront" {
  source = "./modules/cloudfront"

  s3_website_endpoint = module.s3.bucket_regional_domain_name
  acm_certificate_arn         = module.acm.certificate_arn
}

# # Create record to point toward CDN, not bucket
# module "route53_apex" {
#   source                   = "./modules/route53_record"
#   zone_id                  = data.aws_route53_zone.zone.id
#   domain_name              = var.domain_name_simple
#   cloudfront_domain_name   = module.aws_cloudfront_distribution.cdn_static_site.domain_name
#   cloudfront_hosted_zone_id = module.aws_cloudfront_distribution.cdn_static_site.hosted_zone_id
# }