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
  content_type = "text/html"  # Set the content type here

  etag = filemd5("${path.root}/public/index.html")
  lifecycle {
    ignore_changes = [etag]
  }
}
resource "aws_s3_object" "upload_assets" {
  for_each = fileset(var.assets_path, "*.{jpg,png,gif}")
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "${var.assets_path}/{each.key}"
  key    = "assets/${each.key}"
  #content_type = "text/html"  # Set the content type here
  etag = filemd5("${var.assets_path}/{each.key}")
  lifecycle {
    ignore_changes = [etag]
  }
}
resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  source =  var.error_html_path
  key    = "error.html"
  content_type = "text/html"  # Set the content type here
   etag = filemd5(var.error_html_path)
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.bucket
  #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
   policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipalReadOnly",
        Effect    = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:${aws_cloudfront_distribution.s3_distribution.id}"
          }
        }
      }
    ]
  })
}
resource "terraform_data" "content_version" {
   input = var.content_version
  
}
#fileset("${path.root}/public/assets", "*.{jpg,png,gif}")