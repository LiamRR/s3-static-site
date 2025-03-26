# Create S3 bucket for website.
module "s3" {
  source = "./modules/s3"

  # Needs to match domain name for R53
  bucket_name    = var.bucket_name
  cloudfront_arn = module.cloudfront.cloudfront_arn
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Create ACM certificate for domain.
module "acm" {
  source = "./modules/acm"

  providers = {
    aws = aws.us_east_1 # Make sure this is defined and points to us-east-1
  }

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
}

# Create CloudFront distribution.
module "cloudfront" {
  source = "./modules/cloudfront"

  s3_website_endpoint = module.s3.bucket_regional_domain_name
  acm_certificate_arn = module.acm.certificate_arn
  origin_id           = var.origin_id
  domain_name         = var.domain_name
  sub_domain          = var.sub_domain
  
  depends_on          = [module.acm.certificate_validation]
}

# Create record to point toward CDN, not bucket url.
module "site_record" {
  source = "./modules/route53"

  domain_name_simple        = var.domain_name
  record_type               = var.record_type
  cloudfront_domain_name    = module.cloudfront.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cloudfront.cloudfront_zone_id
}
