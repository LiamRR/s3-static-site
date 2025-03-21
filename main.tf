# Create S3 bucket for website.
module "s3" {
  source = "./modules/s3"

  # Needs to match domain name for R53
  bucket_name = "its.nuunya.business"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Create ACM certificate for domain.
module "acm" {
  source = "./modules/acm"

  providers = {
    aws = aws.us_east_1  # Make sure this is defined and points to us-east-1
  }

  domain_name               = "nuunya.business"
  subject_alternative_names = ["*.nuunya.business", "its.nuunya.business"]
  validation_method         = "DNS"
}

# Create CloudFront distribution.
module "cloudfront" {
  source = "./modules/cloudfront"

  s3_website_endpoint = module.s3.bucket_regional_domain_name
  acm_certificate_arn = module.acm.certificate_arn
  origin_id           = "s3-site"
  domain_name_simple  = "nuunya.business"
  domain_name         = "its.nuunya.business"
  depends_on = [module.acm.certificate_validation]
}

# Create record to point toward CDN, not bucket url.
module "site_record" {
  source = "./modules/route53"

  domain_name_simple        = "nuunya.business"
  record_type               = "A"
  cloudfront_domain_name    = module.cloudfront.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cloudfront.cloudfront_zone_id
}
