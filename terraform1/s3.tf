resource "aws_s3_bucket" "kien-bucket" {
  bucket = "${var.name}-bucket"

  tags = {
    Name              = "${var.name}-bucket"
    GBL_CLASS_0       = "${var.GBL_CLASS_0}"
    GBL_CLASS_1       = "${var.GBL_CLASS_1}"
    SEC_ASSETS_PUBLIC = "${var.SEC_ASSETS_PUBLIC}"
    SEC_ASSETS_PII    = "${var.SEC_ASSETS_PII}"
  }
}

resource "aws_s3_bucket_versioning" "kien-bucket-version" {
  bucket = aws_s3_bucket.kien-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "kien-bucket-acl" {
  bucket = aws_s3_bucket.kien-bucket.id
  acl    = "private"
}

resource "aws_s3_object" "kien-object" {
  bucket = aws_s3_bucket.kien-bucket.id
  key    = "index.html"
  source = "index.html"
  etag   = filemd5("index.html")
}

resource "aws_s3_bucket_public_access_block" "kien-bucket-public-access-block" {
  bucket = aws_s3_bucket.kien-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
