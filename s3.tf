resource "aws_s3_bucket" "my-bucket" {
  bucket = "crm-devops-241414"

  tags = {
    Name        = "My bucket"

  }
}
