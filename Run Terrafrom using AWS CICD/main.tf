# Define the provider for AWS
provider "aws" {
  region = "us-west-2"
}

# Define the S3 buckets
resource "aws_s3_bucket" "bucket_house" {
  bucket = "my-bucket-house"
}

resource "aws_s3_bucket" "bucket_car" {
  bucket = "my-bucket-car"
}

resource "aws_s3_bucket" "bucket_tv" {
  bucket = "my-bucket-tv"
}

# Define the S3 bucket objects (folders)
resource "aws_s3_bucket_object" "folder_house" {
  bucket = aws_s3_bucket.bucket_house.id
  key    = "house/"
  acl    = "private"
}

resource "aws_s3_bucket_object" "folder_car" {
  bucket = aws_s3_bucket.bucket_car.id
  key    = "car/"
  acl    = "private"
}

resource "aws_s3_bucket_object" "folder_tv" {
  bucket = aws_s3_bucket.bucket_tv.id
  key    = "tv/"
  acl    = "private"
}
