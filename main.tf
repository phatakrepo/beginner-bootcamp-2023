terraform {
  required_providers {
 # cloud {
 #   organization = "terraform_2023_bootcamp"
 #  workspaces {
 #     name = "terrahouse-1"
 #   }
 # }
   aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }  
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
  content_version = var.content_version
  assets_path = var.assets_path
}
