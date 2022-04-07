# Create a s3 bucket

resource "aws_s3_bucket" "custom-s3-bucket-01"{
  bucket = "custom-s3-bucket-01-karan-suneja-oodles"
  tags = {
    Name = "bucket_demo"
  }

}

#access control list
resource "aws_s3_bucket_acl" "example"{
  bucket = aws_s3_bucket.custom-s3-bucket-01.id
  acl = "private"
}
