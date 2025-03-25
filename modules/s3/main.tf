# Create the bucket with the random string from above.
resource "aws_s3_bucket" "sst_bucket" {
  bucket = var.bucket_name
}

# Adjust the ownership 
resource "aws_s3_bucket_ownership_controls" "sst_bucket_oc" {
  bucket = aws_s3_bucket.sst_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Block access to bucket.
resource "aws_s3_bucket_public_access_block" "sst_bucket_pab" {
  bucket                  = aws_s3_bucket.sst_bucket.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

# deny public read access to the bucket.
resource "aws_s3_bucket_acl" "sst_bucket_acl" {
  bucket = aws_s3_bucket.sst_bucket.id
  acl    = "private"

  depends_on = [
    aws_s3_bucket_ownership_controls.sst_bucket_oc,
    aws_s3_bucket_public_access_block.sst_bucket_pab,
  ]
}

# Cloudfront policy.
resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = aws_s3_bucket.sst_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontAccess"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.sst_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "${var.cloudfront_arn}"
          }
        }
      }
    ]
  })

  depends_on = [
    aws_s3_bucket_public_access_block.sst_bucket_pab
  ]
}

# Will upload all the files present under HTML folder to the S3 bucket.
resource "aws_s3_object" "upload_object" {
  for_each     = fileset("${path.root}/html/", "*")
  bucket       = aws_s3_bucket.sst_bucket.id
  key          = each.value
  source       = "${path.root}/html/${each.value}"
  etag         = filemd5("${path.root}/html/${each.value}")
  content_type = "text/html"
}

# Basic site config, index and error pages.
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.sst_bucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.sst_bucket_acl]
}
