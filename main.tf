terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.23.0, < 7.0.0"
    }
  }
}


provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.default_tags
  }
}

# Get current AWS account ID for bucket naming
data "aws_caller_identity" "current" {}

# Private S3 bucket (secure configuration)
resource "aws_s3_bucket" "private_bucket" {
  bucket = "genai-demo-private-bucket-${data.aws_caller_identity.current.account_id}"
}

# Block all public access (security best practice)
resource "aws_s3_bucket_public_access_block" "private_bucket" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Private ACL (bucket owner has full control)
resource "aws_s3_bucket_acl" "private_bucket" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = "private"

  depends_on = [aws_s3_bucket_public_access_block.private_bucket]
}

# Enable versioning for data protection
resource "aws_s3_bucket_versioning" "private_bucket" {
  bucket = aws_s3_bucket.private_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "private_bucket" {
  bucket = aws_s3_bucket.private_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}