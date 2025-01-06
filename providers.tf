# Configure the AWS Provider
provider "aws" {
  profile = "default" # Profile taken from ~/.aws/credentials
  region  = var.region
}
