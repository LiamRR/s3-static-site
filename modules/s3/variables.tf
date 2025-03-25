variable "block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Block public policy"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Restrict public buckets"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Custom bucket name (if not provided, a random one will be generated)"
  type        = string
  default     = null
}

variable "cloudfront_arn" {
  description = "CloudFront ARN"
  type        = string
  default     = ""
}
