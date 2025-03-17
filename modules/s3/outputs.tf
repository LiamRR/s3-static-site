output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
  description = "The website endpoint for the S3 bucket"
}

output "hosted_zone_id" {
  value       = aws_s3_bucket.sst_bucket.hosted_zone_id
  description = "The Route 53 Hosted Zone ID for the S3 bucket"
}

output "bucket_name" {
  value       = aws_s3_bucket.sst_bucket.bucket
  description = "Name of the bucket"
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.sst_bucket.bucket_regional_domain_name
}
