variable "user_uuid" {
  description = "User UUID"
  type        = string
  validation {
    condition     = length(var.user_uuid) == 36 && can(regex("^[0-9a-fA-F-]+$", var.user_uuid))
    error_message = "User UUID must be a valid UUID string in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  }
}