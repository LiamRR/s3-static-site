output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "domain_validation_records" {
  value = aws_acm_certificate.this.domain_validation_options
}

output "certificate_validation" {
  value       = aws_acm_certificate_validation.this
  description = "The certificate validation resource"
}

output "certificate_domains" {
  value = aws_acm_certificate.this.domain_validation_options
}