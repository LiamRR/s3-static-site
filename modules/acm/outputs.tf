output "certificate_arn" {
  value = aws_acm_certificate.cert.arn
}

output "domain_validation_records" {
  value = aws_acm_certificate.cert.domain_validation_options
}

output "certificate_validation" {
  value       = aws_acm_certificate_validation.cert_validation
  description = "The certificate validation resource"
}

output "certificate_domains" {
  value = aws_acm_certificate.cert.domain_validation_options
}