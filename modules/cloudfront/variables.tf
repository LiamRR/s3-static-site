variable "origin_id" {
  description = "origin_id"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "s3_website_endpoint" {
  description = "The website endpoint of the S3 bucket"
  type        = string
}

variable "domain_name_simple" {
  description = "Full domain"
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
  default     = ""
}
