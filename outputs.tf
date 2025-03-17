# Get the endpioint of the bucket.
output "s3_bucket_endpoint" {
  value = module.s3.website_endpoint
}

# Get the bucket name, since its random to check UI.
output "generated_bucket_name" {
  value = module.s3.bucket_name
}