variable "domain_name" {
  description = "Domain name for the certificate"
  type        = string
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
