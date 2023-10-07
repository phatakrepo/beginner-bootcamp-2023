variable "teacherseat_user_uuid" {
  description = "User UUID"
  type        = string
  
}
variable "terratowns_endpoint" {
 type = string
}

variable "terratown_token" {
 type = string
}

# variable "bucket_name" {
#   description = "The name of the AWS S3 bucket"
#   type        = string
# }

variable "index_html_path" {
  description = "Path to the index.html file"
  type        = string
}

variable "error_html_path" {
  description = "Path to the index.html file"
  type        = string
}

variable "content_version" {
  description = "The desired content version (positive integer, starting at 1)"
  type        = number
}

variable "assets_path" {
  description = "Assets to be uploaded to s3"
  type        = string
}