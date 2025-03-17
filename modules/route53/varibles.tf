variable "zone_name" {
  description = "name of the zone"
  type        = string
  default     = "nuunya.business"
}

variable "private_zone" {
  description = "is the zone private"
  type        = bool
  default     = false
}

variable "record_name" {
  description = "name of the record"
  type        = string
}

variable "records" {
  description = "list of records"
  type        = list(string)
  default     = []
}

variable "record_type" {
  description = "type of record"
  type        = string
}

variable "ttl" {
  description = "value of the TTL"
  type        = number
  default     = 300
}

variable "target_health" {
  description = "evaluate target health"
  type        = bool
  default     = true
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website"
  default     = "*.nuunya.business"
}

variable "website_endpoint" {
  type        = string
  description = "The S3 bucket website endpoint"
}

variable "s3_hosted_zone_id" {
  type        = string
  description = "The S3 bucket hosted zone ID"
}

# variable "acm_certificate_validation_records" {
#   description = "Domain validation records for the ACM certificate"
#   type        = list(map(string))
# }

# variable "cloudfront_domain_name" {
#   description = "Domain name of the CloudFront distribution"
#   type        = string
# }

# variable "cloudfront_zone_id" {
#   description = "Hosted zone ID of the CloudFront distribution"
#   type        = string
# }

# variable "domain_validation_options" {
#   description = "Domain validation options for the ACM certificate"
#   type        = list(map(string))
#   default     = []
# }
