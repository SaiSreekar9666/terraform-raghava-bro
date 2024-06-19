resource "aws_s3_bucket" "my-bucket" {
  bucket = "lms-devops-2414"

  tags = {
    Name        = "My bucket"

  }
}

