variable "teacherseat_user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "The user_uuid value is not a valid UUID."
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

  validation {
    condition     = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && 
      can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    )
    error_message = "The bucket name must be between 3 and 63 characters, start and end with a lowercase letter or number, and can contain only lowercase letters, numbers, hyphens, and dots."
  }
}

variable "index_html_path" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_path)
    error_message = "The specified index.html file does not exist."
  }
}

variable "error_html_path" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.error_html_path)
    error_message = "The specified index.html file does not exist."
  }
}
variable "content_version" {
  description = "The desired content version (positive integer, starting at 1)"
  type        = number
  default     = 1  # Default to 1 if not provided
  validation {
    condition     = var.content_version >= 1 && can(var.content_version)
    error_message = "Content version must be a positive integer starting at 1."
  }
}
variable "assets_path" {
  description = "Assets to be uploaded to s3"
  type        = string
}