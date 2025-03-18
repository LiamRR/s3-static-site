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

module "route53" {
  source = "./modules/route53"

  website_endpoint  = module.s3.website_endpoint
  record_name       = "its"
  record_type       = "CNAME"
  records           = [module.s3.website_endpoint]
  ttl               = 300
  s3_hosted_zone_id = module.s3.hosted_zone_id
}


# module "cloudfront" {
#   source = "./modules/cloudfront"

#   bucket_name                 = module.s3.bucket_regional_domain_name
#   bucket_regional_domain_name = module.s3.bucket_regional_domain_name
#   acm_certificate_arn         = module.acm.certificate_arn
#   domain_name                 = module.s3.bucket_name
#   subject_alternative_names   = ["its.nuunya.business"]


# }