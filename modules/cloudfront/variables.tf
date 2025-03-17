variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
}

variable "subject_alternative_names" {
  description = "Subject alternative names for the certificate"
  type        = list(string)
  default     = []
}

