variable "aws_region" {
  description = "AWS region for orchestration infrastructure"
  type        = string
  default     = "us-west-2"
}

variable "default_tags" {
  description = "Default tags applied to all AWS resources via the provider's default_tags."
  type        = map(string)
  default = {
    project = "example-genai-s3-code-module"
  }
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name (will be combined with account ID for uniqueness)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*$", var.bucket_prefix)) && length(var.bucket_prefix) >= 3 && length(var.bucket_prefix) <= 40
    error_message = "Bucket prefix must be 3-40 characters, start with a letter or number, and contain only lowercase letters, numbers, and hyphens."
  }
}