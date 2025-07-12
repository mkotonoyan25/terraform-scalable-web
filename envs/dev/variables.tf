variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "prod"
    Project     = "scalable-web"
    Owner       = "tonoyan"
  }
}

variable "key_name" {
  type = string
  default = "change_to_your_key_name"
}

 