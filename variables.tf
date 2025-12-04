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