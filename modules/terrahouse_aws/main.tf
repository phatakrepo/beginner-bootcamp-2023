terraform {
  required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }  
}
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid  = var.user_uuid
 }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "${path.root}/public/index.html"
  key    = "index.html"
  etag = filemd5("${path.root}/public/index.html")
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  source =  var.error_html_path
  key    = "error.html"
    etag = filemd5(var.error_html_path)
}