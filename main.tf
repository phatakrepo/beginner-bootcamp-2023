terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
     }
   } 
  }
 # cloud {
 #   organization = "terraform_2023_bootcamp"
 #  workspaces {
 #     name = "terrahouse-1"
 #   }
 # }
#    aws = {
#       source = "hashicorp/aws"
#       version = "5.17.0"
#     }
#   }  
# }
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratown_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  teacherseat_user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "missingo"
  content_version = var.arcanum.content_version
}
