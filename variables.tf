variable "user_uuid" {
  description = "User UUID"
  type        = string
  validation {
    condition     = length(var.user_uuid) == 36 && can(regex("^[0-9a-fA-F-]+$", var.user_uuid))
    error_message = "User UUID must be a valid UUID string in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  }
}

variable "bucket_name" {
  description = "The name of the AWS S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Invalid bucket name. Bucket names must be between 3 and 63 characters long and can only contain alphanumeric characters, hyphens, and periods."
  }
}
