variable "block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Block public policy"
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs"
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Restrict public buckets"
  type        = bool
  default     = false
}

variable "bucket_name" {
  description = "Custom bucket name (if not provided, a random one will be generated)"
  type        = string
  default     = null
}
