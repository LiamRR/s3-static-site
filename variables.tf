variable "region" {
  description = "Region of AWS VPC"
  type        = string
  default     = ""
}

####
# S3
####
variable "bucket_name" {
  description = "Custom bucket name (if not provided, a random one will be generated)"
  type        = string
  default     = ""
}

#####
# ACM
#####
variable "domain_name" {
  description = "Domain name for the certificate"
  type        = string
  default     = ""
}

variable "subject_alternative_names" {
  description = "Subject alternative names for the certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Validation method for the certificate"
  type        = string
  default     = "DNS"
}

############
# Cloudfront
############
variable "origin_id" {
  description = "origin_id"
  type        = string
  default     = ""
}

variable "sub_domain" {
  description = "Domain name for the website"
  type        = string
  default     = ""
}

#########
# Route53
#########
variable "record_type" {
  description = "DNS record type"
  type        = string
  default     = ""
}
