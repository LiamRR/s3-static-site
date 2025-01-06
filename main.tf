# We need to make sure the bucket name is unique.
resource "random_string" "random" {
  length = 6
  special = false
  upper = false
} 

resource "aws_s3_bucket" "sst_bucket" {
  bucket = "bucket-${random_string.random.result}" 
}

resource "aws_s3_bucket_ownership_controls" "sst_bucket_oc" {
  bucket = aws_s3_bucket.sst_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "sst_bucket_pab" {
  bucket = aws_s3_bucket.sst_bucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "sst_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.sst_bucket_oc,
    aws_s3_bucket_public_access_block.sst_bucket_pab,
  ]
  bucket = aws_s3_bucket.sst_bucket.id
  acl    = "public-read"
}

# Will upload all the files present under HTML folder to the S3 bucket.
resource "aws_s3_object" "upload_object" {
  for_each = fileset("html/", "*")
  bucket = aws_s3_bucket.sst_bucket.id
  key = each.value
  source = "html/${each.value}"
  etag = filemd5("html/${each.value}")
  content_type = "text/html"
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "blog" {
  bucket = aws_s3_bucket.sst_bucket.id
  index_document {
    suffix = "index.html"
  }
  
  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.sst_bucket_acl ]
}
