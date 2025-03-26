####
# S3
####
bucket_name = "its.nuunya.business"
region = "eu-west-2"

#####
# ACM
#####
domain_name               = "nuunya.business" # used in cloudfront and R53
subject_alternative_names = ["*.nuunya.business", "its.nuunya.business"]
validation_method         = "DNS"

############
# Cloudfront
############
origin_id  = "s3-site"
sub_domain = "its.nuunya.business"

#########
# Route53
#########
record_type = "A"
