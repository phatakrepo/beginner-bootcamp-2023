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
