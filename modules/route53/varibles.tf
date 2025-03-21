variable "zone_name" {
  description = "name of the zone"
  type        = string
  default     = "nuunya.business"
}

# variable "zone_id" {
#   description = "ID of the zone"
#   type        = string
# }

variable "private_zone" {
  description = "is the zone private"
  type        = bool
  default     = false
}

variable "record_name" {
  description = "name of the record"
  type        = string
  default     = ""
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

# variable "ttl" {
#   description = "value of the TTL"
#   type        = number
#   default     = 300
# }

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

variable "domain_name_simple" {
  description = "Full domain"
  type        = string
  default     = ""
}

variable "website_endpoint" {
  type        = string
  description = "The S3 bucket website endpoint"
  default     = ""
}

# variable "s3_hosted_zone_id" {
#   type        = string
#   description = "The S3 bucket hosted zone ID"
# }

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "CloudFront hosted zone ID"
  type        = string
}
