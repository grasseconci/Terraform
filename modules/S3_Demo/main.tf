  resource "aws_s3_bucket" "S3_demo" {
  bucket = "${var.bucket}"
  acl    = "private"

  tags {
    Name = "Mybucket"
  }
}
