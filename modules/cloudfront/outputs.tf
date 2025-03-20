# output "cloudfront_domain_name" {
#   value = aws_cloudfront_distribution.s3_distribution.domain_name
# }

# output "cloudfront_hosted_zone_id" {
#   value = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
# }

output "cloudfront_url" {
  value = aws_cloudfront_distribution.cdn_static_site.domain_name
}


output "cloudfront_zone_id" {
  value = aws_cloudfront_distribution.cdn_static_site.hosted_zone_id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.cdn_static_site.domain_name
}