terraform {
  required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }  
}
# resource "aws_s3_bucket" "website_bucket" {
#   bucket = var.bucket_name
# }
#   tags = {
#     UserUuid  = var.teacherseat_user_uuid
#  }
# }
data "aws_caller_identity" "current" {}
